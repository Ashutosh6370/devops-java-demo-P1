# 🚀 DevOps CI/CD Pipeline Project

---

# 🪜 STEP-BY-STEP (VERY CLEAR)

---

# 🧩 PART 1: Create Java Project & Push to GitHub

---

## ✅ STEP 1: Create GitHub Repository

Go to 👉 https://github.com
Click “New Repository”
Enter:
Repo name: **devops-java-demo-P1**
Click Create Repository

👉 Keep this page open (you’ll need the URL)

---

## ✅ STEP 2: Open Terminal / Command Prompt

Open:

* Windows → Command Prompt / Git Bash
* Mac/Linux → Terminal

---

## ✅ STEP 3: Create Project Folder

```bash
mkdir devops-java-demo-P1
cd devops-java-demo-P1
```

---

## ✅ STEP 4: Create Folder Structure

### Linux / Mac:

```bash
mkdir -p src/main/java/com/demo
```

### Windows (if above fails):

```bash
mkdir src
cd src
mkdir main
cd main
mkdir java
cd java
mkdir com
cd com
mkdir demo
```

---

## ✅ STEP 5: Navigate to Java Folder

```bash
cd src/main/java/com/demo
```

---

## ✅ STEP 6: Create Java File

### Linux / Mac:

```bash
touch App.java
```

### Windows:

```bash
type nul > App.java
```

---

## ✅ STEP 7: Open and Edit Java File

Open `App.java` using:

* VS Code
* Notepad
* Any editor

Paste this:

```java
package com.demo;

public class App {
    public static void main(String[] args) {
        System.out.println("Hello World from DevOps 🚀");
    }
}
```

Save the file ✅

---

## ✅ STEP 8: Go Back to Project Root

Run step-by-step:

```bash
cd ..
cd ..
cd ..
cd ..
cd ..
```

👉 Now you should be inside:

```
devops-java-demo-P1
```

---

## ✅ STEP 9: Create pom.xml

### Linux / Mac:

```bash
touch pom.xml
```

### Windows:

```bash
type nul > pom.xml
```

---

## ✅ STEP 10: Open and Paste pom.xml

Paste this:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.demo</groupId>
    <artifactId>devops-java-demo-P1</artifactId>
    <version>1.0</version>

    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
    </properties>

    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <version>3.2.2</version>
                <configuration>
                    <archive>
                        <manifest>
                            <mainClass>com.demo.App</mainClass>
                        </manifest>
                    </archive>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
```

Save it ✅

---

## ✅ STEP 11: Create Dockerfile

```bash
touch Dockerfile
```

Paste:

```dockerfile
FROM openjdk:17
COPY target/*.jar app.jar
CMD ["java","-jar","app.jar"]
```

Save it ✅

---

## ✅ STEP 12: Initialize Git

```bash
git init
git add .
git commit -m "initial commit"
```

---

## ✅ STEP 13: Connect to GitHub

```bash
git remote add origin https://github.com/YOUR-USERNAME/devops-java-demo-P1.git
git branch -M main
git push -u origin main
```

---

## ✅ STEP 14: VERIFY

Go to GitHub

You should see:

```
src/
pom.xml
Dockerfile
```

---

# ☁️ PART 2: Setup Jenkins on AWS EC2

---

## ✅ STEP 15: Launch EC2

* Ubuntu 22.04
* t2.micro
* Open Ports:

  * 22
  * 8080
  * 9000
  * 8081

---

## ✅ STEP 16: Connect to EC2

```bash
ssh -i key.pem ubuntu@<EC2-IP>
```

---

## ✅ STEP 17: Install Java

```bash
sudo apt update
sudo apt install openjdk-17-jdk -y
```

---

## ✅ STEP 18: Install Jenkins

```bash
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
```

---

## ✅ STEP 19: Install Docker

```bash
sudo apt install docker.io -y
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

---

## ✅ STEP 20: Install Maven

```bash
sudo apt install maven -y
```

---

## ✅ STEP 21: Configure Jenkins Tools

Go to Jenkins UI:

Manage Jenkins → Global Tool Configuration

Add:

JDK:

```
JDK17
```

Maven:

```
Maven3
```

---

# 🔁 PART 3: Jenkins Pipeline

---

## ✅ STEP 22: Create Pipeline Job

* Click New Item
* Select Pipeline

---

## ✅ STEP 23: Add Jenkinsfile

```groovy
pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven3'
    }

    environment {
        IMAGE_NAME = "devops-java-demo-P1"
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/YOUR-USERNAME/devops-java-demo-P1.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run') {
            steps {
                sh 'docker run $IMAGE_NAME'
            }
        }
    }
}
```

---

## ✅ STEP 24: Trigger Pipeline

```bash
git commit -am "trigger pipeline"
git push
```

---

# 🎉 FINAL OUTPUT

```
Hello World from DevOps 🚀
```

---

# 🎯 YOU HAVE BUILT

✔️ Java App
✔️ GitHub Repo
✔️ Jenkins Pipeline
✔️ Docker Deployment

---

## 👨‍💻 Author

Ashutosh Jena
