#!/bin/sh

export FASTLANE_XCODE_LIST_TIMEOUT=30

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
    fastlane test
    exit $?
fi

if [[ "$TRAVIS_BRANCH" == "develop" ]]; then
  travis pubkey
  fastlane beta
  exit $?
fi
