# 🚀 DevOps CI/CD Pipeline - Java App

## 📌 Overview

This project demonstrates a complete **CI/CD pipeline for a Java application** using DevOps tools.
It covers **code build, testing, quality analysis, containerization, and image scanning**.

---

## 🛠️ Tech Stack

* Java 17
* Maven 3.9
* Jenkins
* SonarQube
* Docker
* Trivy

---

## ⚙️ Build & Run

### 1. Build the application

```
mvn clean package
```

### 2. Run the application

```
java -jar target/devops-java-demo-P1.jar
```

---

## 🐳 Docker

### Build Image

```
docker build -t ashutosh6370/devops-java-demo-P1 .
```

### Push Image

```
docker push ashutosh6370/devops-java-demo-P1
```

### Run Container

```
docker run -d -p 8080:8080 ashutosh6370/devops-java-demo-P1
```

---

## 🔄 CI/CD Pipeline Flow

```
Developer commits code  
Code pushed to GitHub  
GitHub webhook triggers Jenkins  

Jenkins starts build  
Maven performs:
  - Code Compile  
  - Unit Test  

SonarQube performs Code Quality Checks  

Maven builds the JAR  

Docker:
  - Build Docker Image  
  - Push Image to Docker Hub  

Trivy performs Docker Image Scan  

Docker Container is Deployed
```

---

## 📂 Project Structure

```
├── src/
├── pom.xml
├── Dockerfile
├── Jenkinsfile
```

---

## 🔐 Key Features

* Automated CI/CD pipeline using Jenkins
* Code quality analysis using SonarQube
* Docker image build and push to Docker Hub
* Container image security scanning using Trivy

---

## 👨‍💻 Author

Ashutosh Jena
