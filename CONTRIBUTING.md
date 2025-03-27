# Contributing to the Helmless Google Cloud Run Charts

## 🤝 Contributing

You want to contribute to Helmless? Great ❤️!
We use [asdf](https://asdf-vm.com/) to manage the tools and dependencies and [pre-commit](https://pre-commit.com/) to check if everything is fine before committing.

To setup the development environment, install [asdf](https://asdf-vm.com/) and the following plugins:

```sh
asdf plugin add python
asdf plugin add helm
asdf plugin add pre-commit
```

Then install the tools and dependencies:

```sh
asdf install
```

## 🧑🏻‍💻 Development

All Helm charts for the Helmless project are developed schema and test first. If you want to add new features please update the schema first and then add new unit tests to the `tests` folder. Only after the tests failed you should start to implement the feature.

### 📝 Updating the Schema

Since Helm does not support dereferencing schemas from other files, the schema needs to be dereferenced from the `values-edit-me.schema.json` file after every change. To do this run the following script:

```sh
./update-schema.sh
```

This will update the `values.schema.json` file with the dereferenced schema. Make sure to commit the changes to the repository.

### 🧪 Testing

To test all charts run:

```sh
./test.sh
```

To test a specific chart run:

```sh
./test.sh service/job/common
```


## 📝 Documentation

The schema documentation is generated using a [custom mkdocs plugin](https://github.com/helmless/helmless/tree/main/docs/_hooks) located in the [`helmless/helmless`](https://github.com/helmless/helmless) repository that provides the documentation and website.

It is on my todo list to enable previewing the docs directly from this repository. For now please clone both repositories and then update the `mkdocs.yaml` file to use the local schema files.

```yaml
schema_renderer:
  write_output: false
  schemas:
    # - schema_path: https://raw.githubusercontent.com/helmless/google-cloudrun-charts/main/charts/cloudrun/service/values.schema.json
    #   changelog_path: https://raw.githubusercontent.com/helmless/google-cloudrun-charts/main/charts/cloudrun/service/CHANGELOG.md
    #   nav_path: docs/cloudrun/schemas/service/index.md
    # - schema_path: https://raw.githubusercontent.com/helmless/google-cloudrun-charts/main/charts/cloudrun/job/values.schema.json
    #   changelog_path: https://raw.githubusercontent.com/helmless/google-cloudrun-charts/main/charts/cloudrun/job/CHANGELOG.md
    #   nav_path: docs/cloudrun/schemas/job/index.md
    - schema_path: ../google-cloudrun-charts/charts/cloudrun/service/values.schema.json
      changelog_path: ../google-cloudrun-charts/charts/cloudrun/service/CHANGELOG.md
      nav_path: docs/cloudrun/schemas/service/index.md
    - schema_path: ../google-cloudrun-charts/charts/cloudrun/job/values.schema.json
      changelog_path: ../google-cloudrun-charts/charts/cloudrun/job/CHANGELOG.md
      nav_path: docs/cloudrun/schemas/job/index.md
```
