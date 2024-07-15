pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Checkout the code from the repository
                    checkout scm
                    
                    // Build the Docker image
                    sh 'docker build -t nginx-webserver .'
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

    }

    post {
        always {
            // Cleanup Docker containers and images
            sh 'docker rmi -f nginx-webserver || true'
        }
    }
}
