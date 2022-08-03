#!/usr/bin/env bash

set -e

if ! command -v circleci > /dev/null 2>&1; then
  echo "Please ensure the 'circleci' command is installed. See https://github.com/CircleCI-Public/circleci-cli#getting-started for instructions."
  exit 1
fi

if ! circleci diagnostic > /dev/null 2>&1; then
  echo "Please ensure you have run 'circleci setup' to login. Run 'circleci diagnostic' to verify connectivity."
  echo "See https://github.com/CircleCI-Public/circleci-cli#getting-started for instructions."
  exit 1
fi

circleci config validate "$@"
