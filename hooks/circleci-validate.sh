#!/usr/bin/env bash

set -e

if ! command -v circleci > /dev/null 2>&1; then
  echo "Please ensure the 'circleci' command is installed. See https://cli.circleci.com/reference/#installation for instructions."
  exit 1
fi

# Confirm the CLI is logged in before validating, so a missing token produces a
# clear message instead of a raw API error.
#
# The legacy CLI (0.1.x) checks this with `circleci diagnostic` and logs in with
# `circleci setup`. CLI 1.x removed both: `circleci auth me` checks the login and
# `circleci auth login` logs in. A legacy CLI is recognised by `diagnostic`
# existing; anything else is treated as 1.x.
if circleci diagnostic --help > /dev/null 2>&1; then
  if ! circleci diagnostic > /dev/null 2>&1; then
    echo "Please ensure you have run 'circleci setup' to login. Run 'circleci diagnostic' to verify connectivity."
    echo "See https://cli.circleci.com/reference/#installation for instructions."
    exit 1
  fi
elif ! circleci auth me > /dev/null 2>&1; then
  echo "Please ensure you have run 'circleci auth login' to login. Run 'circleci auth me' to verify your account."
  echo "See https://cli.circleci.com/reference/#installation for instructions."
  exit 1
fi

circleci config validate "$@"
