FROM openjdk:21-jdk-slim

WORKDIR /app

COPY target/sbom-demo-0.0.1-SNAPSHOT.jar sbom-docker-demo.jar

EXPOSE 8082

ENTRYPOINT ["java", "-jar", "sbom-docker-demo.jar"]