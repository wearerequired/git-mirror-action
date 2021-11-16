# Git Mirror Action

A GitHub Action for [mirroring a git repository](https://help.github.com/en/articles/duplicating-a-repository#mirroring-a-repository-in-another-location) to another location via SSH.

## Inputs

### `source-repo`

**Required** SSH URL of the source repo.

### `destination-repo`

**Required** SSH URL of the destination repo.

### `dry-run`

**Optional** *(default: `false`)* Execute a dry run. All steps are executed, but no updates are pushed to the destination repo.

## Environment variables

`SSH_PRIVATE_KEY`: Create a [SSH key](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) **without** a passphrase which has access to both repositories. On GitHub you can add the public key as [a deploy key to the repository](https://docs.github.com/en/developers/overview/managing-deploy-keys#deploy-keys). GitLab has also [deploy keys with write access](https://docs.gitlab.com/ee/user/project/deploy_keys/) and for any other services you may have to add the public key to your personal account.  
Store the private key as [an encrypted secret](https://docs.github.com/en/actions/reference/encrypted-secrets) and use it in your workflow as seen in the example workflow below.

`SSH_KNOWN_HOSTS`: Known hosts as used in the `known_hosts` file. *StrictHostKeyChecking* is disabled in case the variable isn't available.

If you added the private key or known hosts in an [environment](https://docs.github.com/en/actions/reference/environments) make sure to [reference the environment name in your workflow](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_idenvironment) otherwise the secret is not passed to the workflow.

## Example workflow

```yml
name: Mirror to Bitbucket Repo

on: [ push, delete, create ]

# Ensures that only one mirror task will run at a time.
concurrency:
  group: git-mirror

jobs:
  git-mirror:
    runs-on: ubuntu-latest
    steps:
      - uses: wearerequired/git-mirror-action@v1
        env:
          SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
          SSH_KNOWN_HOSTS: ${{ secrets.SSH_KNOWN_HOSTS }}
        with:
          source-repo: "git@github.com:wearerequired/git-mirror-action.git"
          destination-repo: "git@bitbucket.org:wearerequired/git-mirror-action.git"
```

## Docker

```sh
docker run --rm -e "SSH_PRIVATE_KEY=$(cat ~/.ssh/id_rsa)" $(docker build -q .) "$SOURCE_REPO" "$DESTINATION_REPO"
```


## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
