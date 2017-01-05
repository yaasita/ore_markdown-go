binary = \
	bin/linux-386-ore_markdown-go \
	bin/linux-amd64-ore_markdown-go \
	bin/freebsd-386-ore_markdown-go \
	bin/freebsd-amd64-ore_markdown-go \
	bin/windows-386-ore_markdown-go.exe \
	bin/windows-amd64-ore_markdown-go.exe \
	bin/darwin-386-ore_markdown-go \
	bin/darwin-amd64-ore_markdown-go

all: $(binary)

bin/linux-386-ore_markdown-go:
	GOOS=linux GOARCH=386 CGO_ENABLED=0 go build -a -o $@

bin/linux-amd64-ore_markdown-go:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -a -o $@

bin/freebsd-386-ore_markdown-go:
	GOOS=freebsd GOARCH=386 CGO_ENABLED=0 go build -a -o $@

bin/freebsd-amd64-ore_markdown-go:
	GOOS=freebsd GOARCH=amd64 CGO_ENABLED=0 go build -a -o $@

bin/windows-386-ore_markdown-go.exe:
	GOOS=windows GOARCH=386 CGO_ENABLED=0 go build -a -o $@

bin/windows-amd64-ore_markdown-go.exe:
	GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -a -o $@

bin/darwin-386-ore_markdown-go:
	GOOS=darwin GOARCH=386 CGO_ENABLED=0 go build -a -o $@

bin/darwin-amd64-ore_markdown-go:
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -a -o $@

clean:
	rm $(binary)
