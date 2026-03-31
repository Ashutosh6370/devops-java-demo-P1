# DevOps CI/CD Pipeline - Java App

## 📌 Overview

This project demonstrates a simple **CI/CD pipeline** for a Java application using Jenkins, Maven, Docker, and AWS.

It covers the complete workflow from **code build → artifact creation → Docker image → deployment**.

---

## 🚀 Tech Stack

* Java 17
* Maven 3.9
* Jenkins
* Docker
* AWS (EC2 / EKS)

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

### Run Container

```
docker run -d -p 8080:8080 ashutosh6370/devops-java-demo-P1
```

---

## 🔄 CI/CD Pipeline Flow

1. Code pushed to GitHub
2. Jenkins triggers build
3. Maven builds JAR
4. Docker image is created
5. Image pushed to Docker Hub
6. Deployment on AWS

---

## 📂 Project Structure

```
├── src/
├── pom.xml
├── Dockerfile
├── Jenkinsfile
```

---

## 👨‍💻 Author

Ashutosh Jena
