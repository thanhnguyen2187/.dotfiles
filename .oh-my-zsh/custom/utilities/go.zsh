if command -v go >/dev/null 2>&1; then
    # shellcheck disable=SC2155
    export PATH="$(go env GOPATH)/bin:$PATH"
    export GOPATH=$(go env GOPATH)
fi
