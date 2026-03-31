FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/devops-java-demo-P1.jar app.jar

CMD ["java","-jar","app.jar"]
