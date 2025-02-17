### create package
```sh
mvn package
```
### create docker image
```sh
docker compose build
```
### Or create docker image and run Container
```sh
docker compose up -d
```

### Since Docker Version 4.7.0 
In Json-Format
```sh
docker scout sbom sbom-docker-demo --format json --output sbom-docker-demo.sbom
```
In SPDX-Format
```sh
docker scout sbom sbom-docker-demo --format spdx
```
