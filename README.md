# A Git Mirror Action

A GitHub Action for [mirroring a git repository](https://help.github.com/en/articles/duplicating-a-repository#mirroring-a-repository-in-another-location) to another location via SSH.

## Inputs

### `source-repo`

**Required** SSH URLs of the source repo.

### `destination-repo`

**Required** SSH URLs of the destination repo.

## Environment variables

`SSH_PRIVATE_KEY`: Create a [SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) which has access to both repositories. On GitHub they are called "deploy keys". Store [the private key as a secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets) and use it in your workflow as seen in the example usage below.


## Example workflow

```
name: Mirror to Bitbucket Repo

on: [ push, delete, create ]

jobs:
  git-mirror:
    runs-on: ubuntu-latest
    steps:
      - uses: wearerequired/git-mirror-action@v1
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
        with:
          source-repo: 'git@github.com:wearerequired/swisscom-magazine.git'
          destination-repo: 'git@bitbucket.org:wearerequired/git-mirror-action.git'
          destination-branch: 'main'
```

## Docker

```
docker run --rm -e "SSH_PRIVATE_KEY=$(cat ~/.ssh/id_rsa)" $(docker build -q .) "$SOURCE_REPO" "$DESTINATION_REPO"
```


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
