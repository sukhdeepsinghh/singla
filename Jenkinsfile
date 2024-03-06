pipeline {
     agent { label  "singlaagent" }

    environment {
        DATABASE_NAME = 'sukhdeep'
        TABLE_NAME = 'customers'
        TABLE_SCRIPT_FILE = 'create_table.sql'
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
       
                    sh "cp ${TABLE_SCRIPT_FILE} \${WORKSPACE}/${TABLE_SCRIPT_FILE}"
                    // Execute the SQL script using the MySQL client
                    sh """
                       sudo mysql  -e "${TABLE_SCRIPT_FILE}"
                    """
                }
            }
        }
    }
}

