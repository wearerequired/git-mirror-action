# Git Mirror Action

A GitHub Action for [mirroring a git repository](https://help.github.com/en/articles/duplicating-a-repository#mirroring-a-repository-in-another-location) to another location via SSH.

## Inputs

### `source-repo`

**Required** SSH URLs of the source repo.

### `destination-repo`

**Required** SSH URLs of the destination repo.

## Environment variables

`SSH_PRIVATE_KEY`: Create a [SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) which has access to both repositories. On GitHub they are called "deploy keys". Store [the private key as a secret](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables) and use it in your workflow as seen in the example usage below.


## Example usage

```
uses: wearerequired/git-mirror-action@master
env:
  SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
with:
  source-repo: 'git@github.com:wearerequired/git-mirror-action.git'
  destination-repo: 'git@bitbucket.org:wearerequired/git-mirror-action.git'
```

## Docker

```
docker run --rm -e "SSH_PRIVATE_KEY=$(cat ~/.ssh/id_rsa)" $(docker build -q .) "$SOURCE_REPO" "$DESTINATION_REPO"
```


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
