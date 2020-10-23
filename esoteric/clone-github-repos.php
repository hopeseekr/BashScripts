#!/usr/bin/env env php
<?php
#########################################################################
# GitHub User + Org Repo Cloner                                         #
#                                                                       #
#   This utility effortlessly downloads all of the GitHub repositories  #
#   for either a user or an organization.                               #
#                                                                       #
#   I personally use it to archive all of my work and as part of        #
#   my Bettergist Collective platform.                                  #
#   See https://github.com/bettergistco/                                #
#                                                                       #
# Part of HopeSeekr's BashScripts Collection                            #
# https://github.com/hopeseekr/BashScripts/                             #
#                                                                       #
# Copyright © 2020 Theodore R. Smith <theodore@phpexperts.pro>          #
# GPG Fingerprint: 4BF8 2613 1C34 87AC D28F  2AD8 EB24 A91D D612 5690   #
#                                                                       #
# License: Creative Commons Attribution v4.0 International              #
#########################################################################

$sanity = function (string $username) {
    if (empty($username)) {
        echo "Error: Please provide a GitHub username or organization.\n";
        exit(1);
    }

    if (!preg_match('/^[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$/i', $username)) {
        echo "Error: The GitHub username you provided contains invalid characters.\n";
        exit(2);
    }
};

$username = $argv[1];
$sanity($username);

ini_set('user_agent', 'github repo downloader');

// From: https://stackoverflow.com/a/2280413/430062
function checkURL(string $url): bool
{
    if (function_exists('curl_init')) {
        return curl_init($url) !== false;
    }
    $headers = @get_headers($url);

    return (!(!$headers || $headers[0] != 'HTTP/1.1 200 OK'));
};

function grabUserJson(string $username)
{
    $url = "https://api.github.com/users/$username/repos?per_page=200";
    if (checkURL($url) === false) {
        throw new \RuntimeException("Could not fetch GitHub repo info for a user named '$username'.");
    }

    return json_decode(file_get_contents($url));
}

function grabOrgJson(string $orgname)
{
    $url = "https://api.github.com/orgs/$orgname/repos?per_page=200";
    if (checkURL($url) === false) {
        throw new \RuntimeException("Could not fetch GitHub repo info for either a user or organization named '$orgname'.");
    }

    return json_decode(file_get_contents($url));
}

try {
    $repos = grabUserJson($username);
} catch (\RuntimeException $e) {
    $repos = grabOrgJson($username);
}

foreach ($repos as $repo) {
    if ($repo->fork === 1 || empty($repo->clone_url))) {
        continue;
    }

    system("git clone --depth=1 {$repo->clone_url}");
}
