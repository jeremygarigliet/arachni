# Arachni

## Build

docker build -t jeremygarigliet/arachni .

## Run

```docker run -ti --rm -v $(pwd)/report/:/report/ jeremygarigliet/arachni [<options>] <host>```

Generate HTML report :

```docker run -ti --rm -v $(pwd)/report/:/report/ jeremygarigliet/arachni reporter```

## Usage

[CLI Manual](https://github.com/Arachni/arachni/wiki/Command-line-user-interface)