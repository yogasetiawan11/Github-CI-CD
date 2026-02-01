# Bank App (bankapp)

A Spring Boot-based banking web application with CI/CD and container / Kubernetes deployment artifacts. This repository contains the Maven project configuration, a Dockerfile for container images, SonarQube configuration for code analysis, and a `k8s` folder for Kubernetes manifests.

Repository: [yogasetiawan11/Github-CI-CD](https://github.com/yogasetiawan11/Github-CI-CD)

---

## Table of contents

- [Project overview](#project-overview)
- [Key files](#key-files)
- [Technologies](#technologies)
- [Prerequisites](#prerequisites)
- [Build & run (local)](#build--run-local)
- [Build & run with Docker](#build--run-with-docker)
- [Tests, coverage & SonarQube](#tests-coverage--sonarqube)
- [Kubernetes deployment](#kubernetes-deployment)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## Project overview

This project is a Java Spring Boot web application named `bankapp` (artifactId `bankapp`) described as a "Banking Web Application" in the Maven configuration. It is packaged as an executable JAR and prepared to be run inside a container.

I inspected the repository and found:
- Maven project file: `pom.xml` (Spring Boot 3.3.3, Java 17, jacoco plugin configured)
- Dockerfile for running the packaged JAR
- SonarQube properties file: `sonar-project.properties`
- `k8s` directory (Kubernetes manifests)
- `LICENSE` at project root
- `src` tree is present (`src/main`, `src/test`) — I could not list every file here; please check the GitHub UI for the full contents.

Relevant links:
- Maven POM: [pom.xml](https://github.com/yogasetiawan11/Github-CI-CD/blob/main/pom.xml)
- Dockerfile: [Dockerfile](https://github.com/yogasetiawan11/Github-CI-CD/blob/main/Dockerfile)
- Sonar config: [sonar-project.properties](https://github.com/yogasetiawan11/Github-CI-CD/blob/main/sonar-project.properties)
- Kubernetes manifests folder: [k8s/](https://github.com/yogasetiawan11/Github-CI-CD/tree/main/k8s)
- Repository: [yogasetiawan11/Github-CI-CD](https://github.com/yogasetiawan11/Github-CI-CD)

---

## Technologies

- Java 17
- Spring Boot 3.x
- Maven
- JaCoCo (code coverage)
- SonarQube (static analysis)
- Docker (container)
- Kubernetes (manifests provided)
- MySQL (mysql-connector runtime dependency)

---

## Prerequisites

- JDK 17+
- Maven 3.6+
- Docker (if building container images)
- kubectl / Kubernetes cluster (for cluster deployment)
- SonarQube server (optional, for code analysis)

---

## Build & run (local)

1. Build with Maven:
   - mvn clean package

2. The build should produce an executable jar under `target/`. The Dockerfile expects the application JAR to be copied from `app/*.jar` at image build time; for local testing you can run the JAR directly:
   - java -jar target/your-app-name.jar

(Adjust the jar filename according to the artifact created by Maven; the project artifactId is `bankapp`.)

---

## Build & run with Docker

The repository includes a Dockerfile that runs a Java 17 JDK image and starts the app on port 8080. Example workflow:

1. Build the application JAR:
   - mvn clean package -DskipTests

2. Prepare a folder `app/` and copy the JAR into it (the Dockerfile copies `app/*.jar`):
   - mkdir -p app
   - cp target/*.jar app/app.jar

3. Build the Docker image:
   - docker build -t bankapp:latest .

4. Run the container:
   - docker run -p 8080:8080 --rm bankapp:latest

The Dockerfile can be found here: [Dockerfile](https://github.com/yogasetiawan11/Github-CI-CD/blob/main/Dockerfile)

---

## Tests, coverage & SonarQube

- The project uses JaCoCo for code coverage and includes jacoco plugin configuration in `pom.xml`.
- Sonar configuration (`sonar-project.properties`) is present and points to tests and binaries for analysis.

To run tests and generate coverage reports:
- mvn test
- mvn jacoco:report (if needed — jacoco plugin is configured in the POM)

To analyze with SonarQube (example):
- Configure your Sonar server and token.
- Run:
  - mvn sonar:sonar -Dsonar.projectKey=bank-app -Dsonar.host.url=<your-sonar-url> -Dsonar.login=<token>

Sonar config: [sonar-project.properties](https://github.com/yogasetiawan11/Github-CI-CD/blob/main/sonar-project.properties)

---

## Kubernetes deployment

A `k8s` directory is present containing Kubernetes manifests (service/deployment/etc). Deploy to a cluster with:
- kubectl apply -f k8s/

Review and customize resource names, image tags, environment variables, and secrets before applying to production.

k8s directory: [k8s/](https://github.com/yogasetiawan11/Github-CI-CD/tree/main/k8s)

---

## Contributing

Contributions are welcome. Suggested workflow:
1. Fork the repository
2. Create a feature branch
3. Commit and push
4. Open a pull request describing the change

Add unit/integration tests for new functionality and make sure the pipeline (if present) passes.

---

## License

This project includes a LICENSE file at the repository root. Review it for permitted uses:
- [LICENSE](https://github.com/yogasetiawan11/Github-CI-CD/blob/main/LICENSE)

---

## Contact

Author: repository owner (yogasetiawan11)

---
