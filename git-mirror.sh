#!/bin/sh

set -e

SOURCE_REPO=$1
DESTINATION_REPO=$2
SOURCE_DIR=$(basename "$SOURCE_REPO")
DRY_RUN=$3

GIT_SSH_COMMAND="ssh -v"

echo "SOURCE=$SOURCE_REPO"
echo "DESTINATION=$DESTINATION_REPO"
echo "DRY RUN=$DRY_RUN"

git clone --mirror "$SOURCE_REPO" "$SOURCE_DIR" && cd "$SOURCE_DIR"
git remote set-url --push origin "$DESTINATION_REPO"
git fetch -p origin
# Only mirror branches and tags. GitHub advertises additional hidden refs
# (e.g. refs/pull/*, refs/github-services/*) that destinations such as GitLab,
# Bitbucket or Codeup reject, which fails the whole mirror push.
#
# The exclude patterns are given without a glob so they match the whole
# namespace: a bare "refs/heads" matches every ref below it, whereas
# "refs/heads/*" would only match one level and drop nested refs such as
# refs/heads/feature/foo.
git for-each-ref --format 'delete %(refname)' \
	--exclude refs/heads --exclude refs/tags refs \
	| git update-ref --stdin

if [ "$DRY_RUN" = "true" ]
then
    echo "INFO: Dry Run, no data is pushed"
    git push --mirror --dry-run
else
    git push --mirror
fi
