pipeline {
    agent any

    tools {
        maven 'Maven3.9'
        jdk 'Java17'
    }

    environment {
        DOCKER_IMAGE = "ashutosh6370/devops-java-demo-P1"
        CONTAINER_NAME = "devops-java-demo-P1"       
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/Ashutosh6370/devops-java-demo-P1.git'
            }
        }

        stage('Maven Build & Unit Test') {
            steps {
                sh 'mvn clean verify'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Maven Package') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Docker Build & Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-cred',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh '''
                    docker build -t $DOCKER_IMAGE .
                    echo $PASS | docker login -u $USER --password-stdin
                    docker push $DOCKER_IMAGE
                    '''
                }
            }
        }

        stage('Trivy Scan') {
            steps {
                sh '''
                trivy image --severity HIGH,CRITICAL $DOCKER_IMAGE
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                docker run -d -p 80:8080 --name $CONTAINER_NAME $DOCKER_IMAGE
                '''
            }
        }
    }

    post {
        success {
            echo "SUCCESS: Full DevSecOps pipeline executed successfully!"
        }
        failure {
            echo "FAILURE: Pipeline failed. Check logs."
        }
        always {
            sh 'docker system prune -f || true'
        }
    }
}
