pipeline {
    agent any

    tools {
        maven 'Maven3.9'      // Make sure this is configured in Jenkins
        jdk 'Java17'
    }

    environment {
        DOCKER_IMAGE = "devops-demo"
        CONTAINER_NAME = "devops-container"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/Ashutosh6370/devops-java-demo-P1.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
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
            echo "✅ SUCCESS: Application built and deployed successfully!"
        }

        failure {
            echo "❌ FAILURE: Pipeline failed. Check logs for details."
        }

        always {
            echo "📌 Pipeline execution finished."

            // Cleanup (important for EC2 disk space)
            sh '''
            docker system prune -f || true
            '''
        }
    }
}
