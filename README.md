## pre-commit-circleci

Pre-commit hooks for CircleCI config validation and creation based around the [circleci-cli](https://github.com/CircleCI-Public/circleci-cli).

### Requirements

`pre-commit-circleci` requires:

* [circleci-cli](https://cli.circleci.com/reference/#installation)

### Install

There are two hooks for operating on the CircleCI configuration:

* `circleci-validate` will call `circleci config validate` on the configuration and report errors.
* `circleci-pack` will call `circleci config pack` and add the resulting `.circleci/config.yaml` to the commit if files in `.circleci/template/*.yaml` have changed.

Add the following to your `.pre-commit-config.yaml`:

```yaml
- repo: https://github.com/dominodatalab/pre-commit-circleci
  rev: v0.0.4
  hooks:
    - id: circleci-validate
    - id: circleci-pack
```

### CLI versions

Both the legacy CLI (0.1.x) and CLI 1.x are supported. `circleci-validate` checks that you are logged in first:
it uses `circleci diagnostic` on the legacy CLI and `circleci auth me` on 1.x.

Extra `args` are passed straight to `circleci config validate`, so they must match your CLI version.
For example, the organization flag is `--org-slug github/myorg` on the legacy CLI and `--org gh/myorg` on 1.x.

### Contributing

Contributions are welcome! Please feel free to create a pull request or issue and we'll make sure to take a look.
