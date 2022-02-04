# pre-commit-check-golang-version

golan hooks for http://pre-commit.com/

### Using this hook

Add this to your `.pre-commit-config.yaml`

     - repo: https://github.com/aronderos-meli/pre-commit-check-golang-version
       rev: main
       hooks:
         - id: go-check-version
           args: ["1.17"]
           stages: [commit]

### Available hooks

- `go-check-version` - validate golang version declared in go.mod file, requires go.mod file
