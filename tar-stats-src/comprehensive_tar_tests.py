#!/usr/bin/env python3
"""
comprehensive_tar_tests.py
Comprehensive test suite comparing tar with tar-stats
"""

import os
import sys
import tempfile
import subprocess
import hashlib
import shutil
from pathlib import Path
from datetime import datetime
import json

class Colors:
    RED = '\033[0;31m'
    GREEN = '\033[0;32m'
    YELLOW = '\033[1;33m'
    BLUE = '\033[0;34m'
    CYAN = '\033[0;36m'
    NC = '\033[0m'

class TestStats:
    def __init__(self):
        self.run = 0
        self.passed = 0
        self.failed = 0
        self.failed_tests = []

    def print_summary(self):
        print()
        print("=" * 60)
        print("Test Summary")
        print("=" * 60)
        print(f"Tests Run:    {Colors.BLUE}{self.run}{Colors.NC}")
        print(f"Tests Passed: {Colors.GREEN}{self.passed}{Colors.NC}")
        print(f"Tests Failed: {Colors.RED}{self.failed}{Colors.NC}")
        print("=" * 60)
        
        if self.failed > 0:
            print(f"\n{Colors.RED}Failed tests:{Colors.NC}")
            for test in self.failed_tests:
                print(f"  - {test}")
        
        return self.failed == 0

class TarTest:
    def __init__(self, tar_stats_path="/tmp/tar-stats"):
        self.tar_stats = tar_stats_path
        self.stats = TestStats()
        self.testdir = tempfile.mkdtemp(prefix="tar-test-")
        self.verbose = False
        
        # Verify tar-stats exists
        if not os.path.exists(self.tar_stats):
            print(f"{Colors.RED}Error: {self.tar_stats} not found{Colors.NC}")
            sys.exit(1)
    
    def cleanup(self):
        """Remove test directory"""
        if os.path.exists(self.testdir):
            shutil.rmtree(self.testdir)
    
    def log(self, message):
        """Print message"""
        print(message)
    
    def log_verbose(self, message):
        """Print message only in verbose mode"""
        if self.verbose:
            print(f"  {message}")
    
    def run_command(self, cmd, cwd=None, env=None):
        """Run a shell command"""
        try:
            result = subprocess.run(
                cmd,
                shell=True,
                cwd=cwd,
                env=env,
                capture_output=True,
                text=True
            )
            return result.returncode == 0, result.stdout, result.stderr
        except Exception as e:
            return False, "", str(e)
    
    def create_file_with_faketime(self, filepath, content=None, size=None, timestamp="2024-01-01 12:00:00"):
        """Create a file with specific timestamp using faketime"""
        # Create the file first
        if content is not None:
            with open(filepath, 'w') as f:
                f.write(content)
        elif size is not None:
            with open(filepath, 'wb') as f:
                f.write(b'\0' * size)
        else:
            Path(filepath).touch()
        
        # Use faketime to set the timestamp
        cmd = f'faketime "{timestamp}" touch "{filepath}"'
        self.run_command(cmd)
    
    def compare_archives(self, tar_file, stats_file):
        """Compare two tar archives"""
        # Check both files exist
        if not os.path.exists(tar_file):
            return False, "tar archive not created"
        
        if not os.path.exists(stats_file):
            return False, "tar-stats archive not created"
        
        # Compare sizes
        size1 = os.path.getsize(tar_file)
        size2 = os.path.getsize(stats_file)
        
        self.log_verbose(f"tar size: {size1} bytes")
        self.log_verbose(f"tar-stats size: {size2} bytes")
        
        if size1 != size2:
            return False, f"Size mismatch: tar={size1}, tar-stats={size2}"
        
        # Compare checksums
        with open(tar_file, 'rb') as f:
            sum1 = hashlib.md5(f.read()).hexdigest()
        
        with open(stats_file, 'rb') as f:
            sum2 = hashlib.md5(f.read()).hexdigest()
        
        self.log_verbose(f"tar checksum: {sum1}")
        self.log_verbose(f"tar-stats checksum: {sum2}")
        
        if sum1 != sum2:
            # Try to get more details
            msg = f"Checksum mismatch:\n  tar:       {sum1}\n  tar-stats: {sum2}"
            
            # Compare listings
            success1, list1, _ = self.run_command(f"tar -tvf {tar_file}")
            success2, list2, _ = self.run_command(f"tar -tvf {stats_file}")
            
            if success1 and success2:
                if list1 != list2:
                    msg += "\n  Listings differ"
                else:
                    msg += "\n  Listings are identical (but bytes differ)"
            
            return False, msg
        
        return True, f"Archives identical (size={size1}, md5={sum1})"
    
    def run_test(self, test_num, test_name, setup_func):
        """Run a single test"""
        self.stats.run += 1
        
        print()
        print(f"{Colors.CYAN}{'=' * 60}")
        print(f"TEST {test_num}: {test_name}")
        print(f"{'=' * 60}{Colors.NC}")
        
        # Create test directory
        workdir = os.path.join(self.testdir, f"test-{test_num:03d}")
        os.makedirs(workdir, exist_ok=True)
        
        self.log_verbose(f"Working directory: {workdir}")
        
        try:
            # Run setup
            self.log_verbose("Running setup...")
            setup_func(workdir)
            
            # Get list of files to archive (excluding hidden files starting with .)
            files_to_archive = []
            for item in os.listdir(workdir):
                if not item.startswith('.'):
                    files_to_archive.append(item)
            
            if not files_to_archive:
                self.log_verbose("No files to archive")
                files_to_archive = ['.']
            
            files_arg = ' '.join(f'"{f}"' for f in sorted(files_to_archive))
            
            self.log_verbose(f"Files to archive: {files_arg}")
            
            # Create archives
            tar_out = os.path.join(workdir, "output-tar.tar")
            stats_out = os.path.join(workdir, "output-stats.tar")
            
            # Use faketime for consistent timestamps
            timestamp = "2024-01-01 12:00:00"
            
            # Create tar archive
            self.log_verbose("Creating tar archive...")
            tar_cmd = f'cd "{workdir}" && faketime "{timestamp}" tar -cf output-tar.tar {files_arg}'
            success, stdout, stderr = self.run_command(tar_cmd)
            if not success and self.verbose:
                self.log_verbose(f"tar stderr: {stderr}")
            
            # Create tar-stats archive
            self.log_verbose("Creating tar-stats archive...")
            stats_cmd = f'cd "{workdir}" && faketime "{timestamp}" {self.tar_stats} -cf output-stats.tar {files_arg}'
            success, stdout, stderr = self.run_command(stats_cmd)
            if not success and self.verbose:
                self.log_verbose(f"tar-stats stderr: {stderr}")
            
            # Compare archives
            self.log_verbose("Comparing archives...")
            success, message = self.compare_archives(tar_out, stats_out)
            
            if success:
                print(f"{Colors.GREEN}  ✓ PASS{Colors.NC}")
                self.log_verbose(message)
                self.stats.passed += 1
            else:
                print(f"{Colors.RED}  ✗ FAIL{Colors.NC}")
                print(f"  {message}")
                self.stats.failed += 1
                self.stats.failed_tests.append(f"Test {test_num}: {test_name}")
        
        except Exception as e:
            print(f"{Colors.RED}  ✗ FAIL: Exception occurred{Colors.NC}")
            print(f"  {str(e)}")
            self.stats.failed += 1
            self.stats.failed_tests.append(f"Test {test_num}: {test_name} (exception)")
    
    # =========================================================================
    # TEST DEFINITIONS
    # =========================================================================
    
    def test_empty_file(self, workdir):
        """Test with a single empty file"""
        filepath = os.path.join(workdir, "empty.txt")
        self.create_file_with_faketime(filepath)
    
    def test_simple_text_file(self, workdir):
        """Test with a simple text file"""
        filepath = os.path.join(workdir, "hello.txt")
        self.create_file_with_faketime(filepath, content="Hello, World!\n")
    
    def test_multiple_files(self, workdir):
        """Test with multiple text files"""
        for i in range(1, 6):
            filepath = os.path.join(workdir, f"file{i}.txt")
            self.create_file_with_faketime(filepath, content=f"File {i} content\n")
    
    def test_empty_directory(self, workdir):
        """Test with an empty directory"""
        dirpath = os.path.join(workdir, "emptydir")
        os.makedirs(dirpath)
        self.run_command(f'faketime "2024-01-01 12:00:00" touch "{dirpath}"')
    
    def test_directory_with_files(self, workdir):
        """Test with a directory containing files"""
        dirpath = os.path.join(workdir, "testdir")
        os.makedirs(dirpath)
        
        for i in range(1, 4):
            filepath = os.path.join(dirpath, f"file{i}.txt")
            self.create_file_with_faketime(filepath, content=f"Content {i}\n")
    
    def test_nested_directories(self, workdir):
        """Test with nested directory structure"""
        # Create nested structure
        path = os.path.join(workdir, "a", "b", "c")
        os.makedirs(path)
        
        # Add files at each level
        self.create_file_with_faketime(
            os.path.join(workdir, "a", "file1.txt"),
            content="Level 1\n"
        )
        self.create_file_with_faketime(
            os.path.join(workdir, "a", "b", "file2.txt"),
            content="Level 2\n"
        )
        self.create_file_with_faketime(
            os.path.join(workdir, "a", "b", "c", "file3.txt"),
            content="Level 3\n"
        )
    
    def test_binary_file_1kb(self, workdir):
        """Test with 1KB binary file"""
        filepath = os.path.join(workdir, "random.bin")
        self.create_file_with_faketime(filepath, size=1024)
    
    def test_binary_file_10kb(self, workdir):
        """Test with 10KB binary file"""
        filepath = os.path.join(workdir, "random10k.bin")
        self.create_file_with_faketime(filepath, size=10240)
    
    def test_file_512_bytes(self, workdir):
        """Test with file exactly 512 bytes"""
        filepath = os.path.join(workdir, "exact512.bin")
        self.create_file_with_faketime(filepath, size=512)
    
    def test_file_1024_bytes(self, workdir):
        """Test with file exactly 1024 bytes"""
        filepath = os.path.join(workdir, "exact1024.bin")
        self.create_file_with_faketime(filepath, size=1024)
    
    def test_file_513_bytes(self, workdir):
        """Test with odd-sized file (513 bytes)"""
        filepath = os.path.join(workdir, "odd513.bin")
        self.create_file_with_faketime(filepath, size=513)
    
    def test_symbolic_link(self, workdir):
        """Test with symbolic link"""
        target = os.path.join(workdir, "target.txt")
        link = os.path.join(workdir, "symlink.txt")
        
        self.create_file_with_faketime(target, content="Target content\n")
        os.symlink("target.txt", link)
    
    def test_file_permissions_644(self, workdir):
        """Test with file permissions 644"""
        filepath = os.path.join(workdir, "file644.txt")
        self.create_file_with_faketime(filepath, content="Content\n")
        os.chmod(filepath, 0o644)
    
    def test_file_permissions_755(self, workdir):
        """Test with file permissions 755"""
        filepath = os.path.join(workdir, "file755.txt")
        self.create_file_with_faketime(filepath, content="Content\n")
        os.chmod(filepath, 0o755)
    
    def test_mixed_permissions(self, workdir):
        """Test with mixed file permissions"""
        for perm in [0o644, 0o755, 0o600]:
            filepath = os.path.join(workdir, f"file{perm:o}.txt")
            self.create_file_with_faketime(filepath, content="Content\n")
            os.chmod(filepath, perm)
    
    def test_spaces_in_filename(self, workdir):
        """Test with spaces in filenames"""
        filepath = os.path.join(workdir, "file with spaces.txt")
        self.create_file_with_faketime(filepath, content="Content\n")
    
    def test_special_characters(self, workdir):
        """Test with special characters in filenames"""
        names = [
            "file-with-dashes.txt",
            "file_with_underscores.txt",
            "file.multiple.dots.txt"
        ]
        for name in names:
            filepath = os.path.join(workdir, name)
            self.create_file_with_faketime(filepath, content="Content\n")
    
    def test_long_filename(self, workdir):
        """Test with long filename (90 chars)"""
        name = "a" * 90 + ".txt"
        filepath = os.path.join(workdir, name)
        self.create_file_with_faketime(filepath, content="Content\n")
    
    def test_deep_nesting(self, workdir):
        """Test with deep directory nesting"""
        path = os.path.join(workdir, *["level"] * 10)
        os.makedirs(path)
        
        filepath = os.path.join(path, "deep.txt")
        self.create_file_with_faketime(filepath, content="Deep content\n")
    
    def test_many_files(self, workdir):
        """Test with many files (50 files)"""
        for i in range(1, 51):
            filepath = os.path.join(workdir, f"file{i:03d}.txt")
            self.create_file_with_faketime(filepath, content=f"File {i}\n")
    
    def test_no_trailing_newline(self, workdir):
        """Test with file with no trailing newline"""
        filepath = os.path.join(workdir, "no-newline.txt")
        with open(filepath, 'w') as f:
            f.write("No newline at end")
        self.run_command(f'faketime "2024-01-01 12:00:00" touch "{filepath}"')
    
    def test_multiple_newlines(self, workdir):
        """Test with file with multiple newlines"""
        filepath = os.path.join(workdir, "multiline.txt")
        self.create_file_with_faketime(filepath, content="Line 1\n\nLine 3\n\n\n")
    
    def test_mixed_content(self, workdir):
        """Test with mixed content types"""
        # Text file
        self.create_file_with_faketime(
            os.path.join(workdir, "text.txt"),
            content="Text content\n"
        )
        
        # Binary file
        self.create_file_with_faketime(
            os.path.join(workdir, "binary.bin"),
            size=1024
        )
        
        # Empty file
        self.create_file_with_faketime(
            os.path.join(workdir, "empty.txt")
        )
        
        # Empty directory
        emptydir = os.path.join(workdir, "emptydir")
        os.makedirs(emptydir)
        
        # Directory with file
        fulldir = os.path.join(workdir, "fulldir")
        os.makedirs(fulldir)
        self.create_file_with_faketime(
            os.path.join(fulldir, "file.txt"),
            content="Content\n"
        )
    
    def test_duplicate_content(self, workdir):
        """Test with files having duplicate content"""
        content = "Same content\n"
        for i in range(1, 4):
            filepath = os.path.join(workdir, f"dup{i}.txt")
            self.create_file_with_faketime(filepath, content=content)
    
    def test_large_file_1mb(self, workdir):
        """Test with 1MB file"""
        filepath = os.path.join(workdir, "large.bin")
        self.create_file_with_faketime(filepath, size=1024*1024)
    
    def test_many_directories(self, workdir):
        """Test with many directories"""
        for i in range(1, 21):
            dirpath = os.path.join(workdir, f"dir{i}")
            os.makedirs(dirpath)
            
            filepath = os.path.join(dirpath, "file.txt")
            self.create_file_with_faketime(filepath, content=f"Content {i}\n")
    
    def test_nested_empty_dirs(self, workdir):
        """Test with nested empty directories"""
        path = os.path.join(workdir, "empty1", "empty2", "empty3")
        os.makedirs(path)
    
    def test_single_char_content(self, workdir):
        """Test with single character content"""
        filepath = os.path.join(workdir, "single.txt")
        self.create_file_with_faketime(filepath, content="x")
    
    def test_exact_block_sizes(self, workdir):
        """Test with files at exact block boundaries"""
        for size in [512, 1024, 2048, 4096]:
            filepath = os.path.join(workdir, f"size{size}.bin")
            self.create_file_with_faketime(filepath, size=size)

def main():
    """Main test runner"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Comprehensive tar creation tests')
    parser.add_argument('-v', '--verbose', action='store_true',
                       help='Verbose output')
    parser.add_argument('--tar-stats', default='/tmp/tar-stats',
                       help='Path to tar-stats binary')
    parser.add_argument('--keep', action='store_true',
                       help='Keep test directory after completion')
    
    args = parser.parse_args()
    
    # Copy tar-stats to /tmp if needed
    if not os.path.exists('/tmp/tar-stats'):
        if os.path.exists('./tar-stats'):
            shutil.copy('./tar-stats', '/tmp/tar-stats')
            os.chmod('/tmp/tar-stats', 0o755)
        else:
            print(f"{Colors.RED}Error: ./tar-stats not found{Colors.NC}")
            sys.exit(1)
    
    print(f"{Colors.BLUE}={'=' * 60}")
    print("Comprehensive Tar Creation Tests")
    print(f"{'=' * 60}{Colors.NC}")
    print()
    
    tester = TarTest(tar_stats_path=args.tar_stats)
    tester.verbose = args.verbose
    
    print(f"Test directory: {tester.testdir}")
    print(f"tar-stats: {tester.tar_stats}")
    print()
    
    # Get all test methods
    test_methods = [
        (name, method) for name, method in sorted(vars(TarTest).items())
        if name.startswith('test_') and callable(method)
    ]
    
    # Run all tests
    for i, (name, method) in enumerate(test_methods, 1):
        # Convert test_method_name to "Method Name"
        test_name = name[5:].replace('_', ' ').title()
        tester.run_test(i, test_name, lambda wd, m=method: m(tester, wd))
    
    # Print summary
    success = tester.stats.print_summary()
    
    # Cleanup
    if not args.keep:
        tester.cleanup()
    else:
        print(f"\nTest directory preserved: {tester.testdir}")
    
    sys.exit(0 if success else 1)

if __name__ == '__main__':
    main()
