# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0] - 2026-07-20

### Changed
* Only mirror branches and tags to avoid pushing GitHub's hidden refs (e.g. `refs/pull/*`, `refs/github-services/*`), which are rejected by destinations such as GitLab, Bitbucket or Codeup.

## [1.0.1] - 2020-03-23

### Changed
* Exclude hidden refs created by GitHub for pull request before pushing to mirror.

## [1.0.0] - 2019-11-26

### Added
* Initial release.

[1.3.0]: https://github.com/wearerequired/git-mirror-action/compare/v1.2.0...v1.3.0
[1.0.1]: https://github.com/wearerequired/git-mirror-action/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/wearerequired/git-mirror-action/compare/26c99373bfd4beb7811a3fd8a068ec944dadedcc...v1.0.0
