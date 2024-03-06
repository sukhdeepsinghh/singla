pipeline {
     agent { label  "singlaagent" }

    environment {
        DATABASE_NAME = 'sukhdeep'
        TABLE_NAME = 'customers'
        TABLE_SCRIPT_FILE = 'sukh1.sql'
    }
 

    stages {
        stage('Checkout') {
            steps {
                // You may need to customize this based on your version control system
                checkout scm
            }
        }

        stage('Create Table') {
            steps {
                script {
                    // Execute the SQL script using the MySQL client
                    sh """
                       sudo mysql ${DATABASE_NAME}  < \${WORKSPACE}/${TABLE_SCRIPT_FILE}
                    """
                }
            }
        }
    }
}

