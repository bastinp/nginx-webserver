pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Checkout the code from the repository
                    checkout scm
                    
                    // Build the Docker image
                    sh 'docker build -t nginx-webserver:$BUILD_NUMBER .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests if any (optional)
                    echo 'Running tests...'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the Docker container
		    sh 'docker stop nginx-webserver'
		    sh 'docker rm nginx-webserver'
                    sh 'docker run -d -p 80:80 nginx-webserver:$BUILD_NUMBER'
                }
            }
        }
    }

    post {
        always {
            // Cleanup Docker containers and images
            //sh 'docker rm -f nginx-webserver-${BUILD_ID} || true'
            sh 'docker rmi -f nginx-webserver:$BUILD_NUMBER || true'
        }
    }
}

