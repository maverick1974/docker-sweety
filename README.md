# docker-sweety

This container is a poc developed for PuppetConf 2016. It is a simple puppet agent that triggers run against a defined server & ca

## Usage

### Build

```
docker build -t mvisonneau/sweety .
```

### Run

```
docker run -d -e PUPPET_CA=<your_ca> -e PUPPET_SERVER=<your_server> <yourname>/pptcb
```
