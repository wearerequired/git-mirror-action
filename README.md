# Git Mirror Action

A GitHub Action for mirroring git repositories via SSH.

## Inputs

### `source-repo`

**Required** SSH URLs of the source repo.

### `destination-repo`

**Required** SSH URLs of the destination repo.

## Example usage

```
uses: wearerequired/git-mirror-action@master
env:
  SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
with:
  source-repo: 'git@github.com:wearerequired/git-mirror-action.git'
  destination-repo: 'git@bitbucket.org:wearerequired/git-mirror-action.git'
```
