pipeline {
    agent anyss

    stages {
        stage('Debug') {
            steps {
                echo "Current Directory: ${pwd()}"
                sh "ls -la"
            }
        }

        // Rest of your pipeline...
    }
}

