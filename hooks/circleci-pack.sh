#!/usr/bin/env bash

set -e

if ! command -v circleci > /dev/null 2>&1; then
  echo "Please ensure the 'circleci' command is installed. See https://github.com/CircleCI-Public/circleci-cli#getting-started for instructions."
  exit 1
fi

config_path="${1:-.circleci/config.yml}"

circleci config pack .circleci/template > "$config_path"
git add "$config_path"
