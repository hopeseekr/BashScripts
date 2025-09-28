#!/bin/sh

rm -rf dockerize
../../git-filter-copy /code/dockerize .
diff -r dockerize dockerize-verify
