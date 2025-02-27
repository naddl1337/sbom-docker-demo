# Demo project for SBOM generation and CVE analysis

This is a demo project designed to generate SBOMs (Software Bill of Materials) that include 
both the dependencies of the project and the dependencies of the container image. 
Additionally, the SBOM can be used to identify known vulnerabilities (CVEs) in the listed 
components. 

> [!NOTE]  
> We'll need Docker Version 4.7.0 or higher.

> [!WARNING]  
> We will find a critical vulnerable dependency in the pom file. This is for testing only!!!!!. We do not use it in our projects!


## Build the project

```bash
./mvnw install cyclonedx:makeAggregateBom
```

With this command, a bunch of files will be generated into `/target` folder:
- `bom.json`
- `bom.xml` and
- `/site/com.example_sbom-docker-demo-0.0.1-SNAPSHOT.spdx.json`. 

## Create Container Image

```bash
# just create
docker compose build
# or create an run container
docker compose up -d
```

> [!NOTE]  
> We should be aware that we copy the BOM into the container image. (see `dockerfile`)

## Create SBOM with project and image dependencies

> [!NOTE]  
> This function is available since Docker v4.7.0.

Now that we have our project dependencies copied to the image, we can generate an SBOM which includes both project and image dependencies.

We can do this with `docker scout` like this:
```bash
docker scout sbom \
  sbom-docker-demo \
  --format json \
  --output sbom-docker-demo.sbom
```

And we can print CVE´s:
```bash
docker scout cves \
  sbom-docker-demo \
  --output sbom-docker-demo-cves.txt
```

> [!NOTE]  
> We can find details about the vulnerability databases [here](https://docs.docker.com/scout/deep-dive/advisory-db-sources/).
