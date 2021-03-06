.PHONY: build package light deploy clean

build:
	GOOS=linux go build -o main

package: build
	zip deployment.zip main

# Light deploy, does not execute cloudformation
light: package
	sls deploy -f hello

# Full deploy, execute cloudformation stack
deploy: package
	sls deploy

clean:
	@rm -f deployment.zip
	@rm -f main
