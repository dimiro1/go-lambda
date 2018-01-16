.PHONY: build package deploy

build:
	GOOS=linux go build -o main

package: build
	zip deployment.zip main

# Light deploy, does not execute cloudformation
light: build
    sls deploy -f hello

# Full deploy, execute cloudformation stack
deploy: package
	sls deploy