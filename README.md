# Demo project for SBOM generation and CVE analysis

This is a demo project designed to generate SBOMs (Software Bill of Materials) that include 
both the dependencies of the project and the dependencies of the container image. 
Additionally, the SBOM can be used to identify known vulnerabilities (CVEs) in the listed 
components. 

### You need: 
- Docker Version 4.7.0 or higher

### WARNING:
You will find a critical vulnerable dependency in the pom file. 
This is for testing only ! ! ! ! !. Do not use it in your projects. 

### Package project
```sh
./mvnw package
```
### Create SBOM for project dependencies
With this, a bunch of files will be generated into /target folder.
bom.json, bom.xml and /site/com.example_sbom-docker-demo-0.0.1-SNAPSHOT.spdx.json. 
In bom.json we will find our project dependencies.
Since a regular jar file does not include any project dependencies for later scan, we have to 
copy the generated file into our docker image (alrdy done, see dockerfile). 
```sh
./mvnw install cyclonedx:makeAggregateBom
```

### Create docker image
```sh
docker compose build
```
### Or create docker image and run Container
```sh
docker compose up -d
```

Now our image is generated with project dependencies.
### Create SBOM with project and image dependencies (Since Docker Version 4.7.0)
If we want to generate a SBOM which includes both, project and image dependencies, we can do that with 
docker scout like this:
```sh
docker scout sbom sbom-docker-demo --format json --output sbom-docker-demo.sbom
```

Print CVE´s with Docker scout
```sh
docker scout cves sbom-docker-demo --output sbom-docker-demo-cves.txt
```