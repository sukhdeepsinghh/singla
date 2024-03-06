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
                    // Execute the MySQL script using the MySQL command-line tool
                    def result = sh(script: """
                        sudo mysql  ${DATABASE_NAME} < \${WORKSPACE}/${TABLE_SCRIPT_FILE} | grep -c "customers"
                    """, returnStatus: true)

                    if (result == 0) {
                        echo "Table 'customers' already exists."
                    } else {
                        echo "Creating table 'customers'..."
                        sh """
                            sudo mysql ${DATABASE_NAME} < \${WORKSPACE}/${TABLE_SCRIPT_FILE}
                        """
                        echo "Table 'customers' created successfully."
                    }
                }
            }
        }
    }
}

              

