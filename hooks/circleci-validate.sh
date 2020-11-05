#!/usr/bin/env bash

set -e

if ! command -v circleci; then
  echo "Please ensure the 'circleci' command is installed. See https://github.com/CircleCI-Public/circleci-cli#getting-started for instructions."
  exit 1
fi

circleci config validate
