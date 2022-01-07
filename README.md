# aqua-renovate-config

[Renovate Config Preset](https://docs.renovatebot.com/config-presets/) to update [aqua](https://github.com/aquaproj/aqua), [aqua-installer](https://github.com/aquaproj/aqua-installer), packages, and registries.

https://aquaproj.github.io/

Example: https://github.com/aquaproj/test-aqua-renovate-config

## Reference about Renovate

* [Renovate documentation](https://docs.renovatebot.com/)
* [Renovate Config Preset](https://docs.renovatebot.com/config-presets/)
  * How to use Preset
  * How to specify preset version and parameter
* [Custom Manager Support using Regex](https://docs.renovatebot.com/modules/manager/regex/)
  * This Preset updates tools with custom regular expression by Renovate Regex Manager

## List of Presets

* [default](default.json)
  * aqua.yaml
  * GitHub Actions [aquaproj/aqua-installer](https://github.com/aquaproj/aqua-installer)'s `aqua_version`
  * [aquaproj/aqua-renovate-config](https://github.com/aquaproj/aqua-renovate-config)
  * [golang/go](https://github.com/golang/go)
  * [kubernetes-sigs/kustomize](https://github.com/kubernetes-sigs/kustomize)
  * [kubernetes/kubectl](https://github.com/kubernetes/kubectl)
* [base](base.json)
  * aqua.yaml
* [action](action.json)
  * GitHub Actions [aquaproj/aqua-installer](https://github.com/aquaproj/aqua-installer)'s `aqua_version`
* [file](file.json)
  * aqua.yaml. `fileMatch` is parameterized
* [installer-script](installer-script.json)
  * the shell script [aquaproj/aqua-installer](https://github.com/aquaproj/aqua-installer). `fileMatch` is parameterized
* [golang-go](golang-go.json)
  * [golang/go](https://github.com/golang/go). `fileMatch` is parameterized
* [kubernetes-sigs-kustomize](kubernetes-sigs-kustomize.json)
  * [kubernetes-sigs/kustomize](https://github.com/kubernetes-sigs/kustomize). `fileMatch` is parameterized
* [kubernetes-kubectl](kubernetes-kubectl.json)
  * [kubernetes/kubectl](https://github.com/kubernetes/kubectl). `fileMatch` is parameterized

## How to use

We recommend specifying the Prset version.

* :thumbsup: "github>aquaproj/aqua-renovate-config#0.1.8"
* :thumbsdown: "github>aquaproj/aqua-renovate-config"

### `default` Preset

```json
{
  "extends": [
    "github>aquaproj/aqua-renovate-config#0.1.8"
  ]
}
```

Add the comment `# renovate: depName=<repository full name>` in aqua.yaml for [Renovate's Regex Manager](https://docs.renovatebot.com/modules/manager/regex/).

e.g.

```yaml
registries:
- type: standard
  ref: v0.13.1 # renovate: depName=aquaproj/aqua-registry

packages:
- name: open-policy-agent/conftest@v0.28.3
```

If the package full name is different from the GitHub Repository name,
add the comment `# renovate: depName=<repository full name>`.

```yaml
packages:
- name: GoogleCloudPlatform/terraformer/aws
  version: 0.8.18 # renovate: depName=GoogleCloudPlatform/terraformer
```

The default preset updates GitHub Actions [aquaproj/aqua-installer](https://github.com/aquaproj/aqua-installer)'s `aqua_version` in `.github` too.

```yaml
- uses: aquaproj/aqua-installer@v0.4.0
  with:
    aqua_version: v0.8.12
```

### `file` Preset

You can specify the file path aqua.yaml.
This is especially useful when you split the list of packages.

https://aquaproj.github.io/docs/tutorial-extras/split-config

```json
{
  "extends": [
    "github>aquaproj/aqua-renovate-config:file#0.1.8(aqua/.*\\.ya?ml)"
  ]
}
```

### `installer-script` Preset

The preset `installer-script` updates the shell script aqua-installer.
You have to pass fileMatch as parameter.

```json
{
  "extends": [
    "github>aquaproj/aqua-renovate-config:installer-script#0.1.8(scripts/.*\\.sh)"
  ]
}
```

```sh
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v0.4.0/aqua-installer | bash
```

## License

[MIT](LICENSE)
