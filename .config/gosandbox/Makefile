.PHONY: run build test bench cover clean

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
