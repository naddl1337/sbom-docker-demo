FROM openjdk:21-jdk-slim

WORKDIR /app

COPY target/sbom-docker-demo-0.0.1-SNAPSHOT.jar sbom-docker-demo.jar

# copy generated bom.json to image, to be able to scan project dependencies
COPY target/bom.json bom.json

EXPOSE 8082

ENTRYPOINT ["java", "-jar", "sbom-docker-demo.jar"]