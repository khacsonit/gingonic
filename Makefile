dev-server:
	go get github.com/pilu/fresh && go run github.com/pilu/fresh

gqlgen:
	go get github.com/99designs/gqlgen@v0.17.20 && go run github.com/99designs/gqlgen generate

.PHONY: scheduler
scheduler:
	cd scheduler && go run main.go

lint:
	golangci-lint run -c ./golangci.yml ./...

test:
	go test ./... -v --cover

test-report:
	go test ./... -v --cover -coverprofile=coverage.out
	go tool cover -html=coverage.out

# Using hooks or pre-commit-install
hooks:
	git config --local core.hooksPath $(shell pwd)/.githooks
pre-commit-install:
	git config --unset-all core.hooksPath && pre-commit install

# Run pre checking commit
pre-commit-run-all-files:
	pre-commit run --all-files
