# setup-docker-caching

Set up Docker Buildkit in GitHub Actions to use the new experimental GitHub
Actions cache backend:

  * https://github.com/docker/buildx/pull/535
  * https://github.com/moby/buildkit/pull/1974

This action won't be necessary once those pull requests are included in official
releases of Docker.

## Usage

In a GitHub Actions workflow:

```yml
jobs:
  build:
    steps:
    - uses: benesch/setup-docker-caching@master
    - run: docker buildx build --cache-from type=gha --cache-to type=gha PATH
```
