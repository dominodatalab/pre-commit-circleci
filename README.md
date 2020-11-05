## pre-commit-circleci

Pre-commit hooks for CircleCI config validation and creation based around the [circleci-cli](https://github.com/CircleCI-Public/circleci-cli).

### Requirements

`pre-commit-circleci` requires:

* [circleci-cli](https://github.com/CircleCI-Public/circleci-cli#getting-started)

### Install

There are two hooks for operating on the CircleCI configuration:

* `circleci-validate` will call `circleci config validate` on the configuration and report errors.
* `circleci-pack` will call `circleci config pack` and add the resulting `.circleci/config.yaml` to the commit if files in `.circleci/template/*.yaml` have changed.

Add the following to your `.pre-commit-config.yaml`:

```yaml
- repo: git://github.com/dominodatalab/pre-commit-circleci
  rev: main
  hooks:
    - id: circleci-validate
    - id: circleci-pack
```

### Contributing

Contributions are welcome! Please feel free to create a pull request or issue and we'll make sure to take a look.
