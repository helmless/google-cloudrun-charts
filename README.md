<a href="https://helmless.io" target="_blank">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset=".github/helmless_title.png">
    <img alt="Helmless.io - Serverless Deployments Without Compromise" src=".github/helmless_title_light.png">
  </picture>
</a>

# Helmless Google Cloud Run Charts

[![Cloud Run Service Chart GitHub Release](https://img.shields.io/github/v/release/helmless/google-cloudrun-charts?include_prereleases&label=google-cloudrun-service&color=blue)](https://github.com/helmless/google-cloudrun-charts/)
[![Cloud Run Job Chart GitHub Release](https://img.shields.io/github/v/release/helmless/google-cloudrun-charts?include_prereleases&label=google-cloudrun-job&color=blue)](https://github.com/helmless/google-cloudrun-charts/)

These charts are used to deploy Google Cloud Run services and jobs using [Helmless](https://helmless.io). See the [Helmless documentation](https://helmless.io/docs/cloudrun) for more information.

## 🚀 Getting Started

See the [Helmless documentation](https://helmless.io/docs/cloudrun/quickstart) for a 5min quickstart guide.

## 📄 Charts

The charts are located in the `charts` folder. The `common` chart contains the common templates and functions that are used by the other charts.

To create a Helmless application chart, create a new chart and then add either the `service` or `job` chart as a dependency.

```sh
helm create my-app
rm -rf my-app/templates/*
```

Add the following to the `Chart.yaml` file:

```yaml
dependencies:
  - name: google-cloudrun-service
    version: "0.x.x"
    repository: oci://ghcr.io/helmless
    alias: service
  - name: google-cloudrun-job
    version: "0.x.x"
    repository: oci://ghcr.io/helmless
    alias: job
```

Then run the following command to install the dependencies:

```sh
helm dependency update
```

Now you can define your workloads in the `values.yaml` file.

```yaml
global:
  project: my-project
  region: us-central1

env: &env
  SHARED_ENV_VAR: shared-value
secrets: &secrets
  MY_SECRET: my-secret-key
  MY_OTHER_SECRET:
    secret: my-other-secret-key
    version: 1

service:
  name: my-service
  image: gcr.io/my-project/my-service:v1
  env:
    <<: *env
    MY_ENV_VAR: my-value
  secrets:
    <<: *secrets
job:
  name: my-job
  image: gcr.io/my-project/my-job:v1
  env:
    <<: *env
    MY_ENV_VAR: my-value
  secrets:
    <<: *secrets
```

See the [documentation](https://helmless.io/docs/cloudrun/ci-cd) or the [helmless/google-cloudrun-action](https://github.com/helmless/google-cloudrun-action) for information on how to deploy your application using Github Actions.

## 🤝🏻 Contributing

See the [CONTRIBUTING](CONTRIBUTING.md) file for information on how to contribute to Helmless. There is also a [general guide on the website](https://helmless.io/contributing).

## ☑️ TODO

- [ ] Add support for sidecars
- [ ] Create sepereate repository for schema renderer and add mkdocs site to this repo to preview schema changes

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

⭐ If you find Helmless useful, please consider giving it a star! It helps the project grow and improve.
