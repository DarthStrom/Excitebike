#!/bin/sh

export FASTLANE_XCODE_LIST_TIMEOUT=30

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
    fastlane test
    exit $?
fi

# not working yet, can't pull the certificates repo
# this needs to be done locally for now
#
# if [[ "$TRAVIS_BRANCH" == "develop" ]]; then
#   fastlane beta
#   exit $?
# fi
