#!/usr/bin/env bash

set -e

if ! command -v circleci > /dev/null 2>&1; then
  echo "Please ensure the 'circleci' command is installed. See https://cli.circleci.com/reference/#installation for instructions."
  exit 1
fi

circleci config pack .circleci/template > .circleci/config.yml
git add .circleci/config.yml
