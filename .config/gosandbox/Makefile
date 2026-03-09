GOTOOLS_DIR := tools/bin
GOLANGCILINT_CMD := $(GOTOOLS_DIR)/golangci-lint-v2
GOLANGCILINT_VERSION := v2.11.2

.PHONY: run build test bench cover clean install-golangci-lint

run:
	go run main.go

build:
	go build -o main main.go

test:
	go test -v ./...

bench:
	go test -bench=. ./...

cover:
	go test -cover ./...

clean:
	rm -f main

install-golangci-lint:
	curl -sSfL "https://raw.githubusercontent.com/golangci/golangci-lint/HEAD/install.sh" | sh -s -- -b $(GOTOOLS_DIR) $(GOLANGCILINT_VERSION)
	ln $(GOTOOLS_DIR)/golangci-lint{,-v2}
