pipeline {
    agent any

    environment {
        MYSQL_DATABASE = 'sukhdeep'
        SCRIPTS_FOLDER = 'scripts'
        PROCESSED_FOLDER = 'processed'
        scriptNAME = 'sukh1.sql'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run MySQL Scripts') {
            steps {
                script {
                    // Create a list of scripts in the SCRIPTS_FOLDER
                    def scripts = sh(script: "ls \${WORKSPACE}/${SCRIPTS_FOLDER}/*.sql", returnStdout: true).trim().split('\n')

                    // Iterate through each script
                    for (def script in scripts) {
                        // Extract the script name without path
                        def scriptName = script.replaceAll('.*/', '')

                        // Check if the table exists
                        def result = sh(script: """
                            sudo mysql ${MYSQL_DATABASE} < \${WORKSPACE}/${SCRIPTS_FOLDER}/${scriptName} | grep -c "customers"
                        """, returnStatus: true)

                        if (result == 0) {
                            echo "Table in script '${scriptName}' already exists."
                        } else {
                            echo "Creating table from script '${scriptName}'..."
                            // Execute the MySQL script
                            sh "sudo mysql ${MYSQL_DATABASE} < \${WORKSPACE}/${SCRIPTS_FOLDER}/${scriptName}"

                            // Move the processed script to PROCESSED_FOLDER
                            sh "mv \${WORKSPACE}/${SCRIPTS_FOLDER}/${scriptName} \${WORKSPACE}/${PROCESSED_FOLDER}/"
                            echo "Table from script '${scriptNAME}' created successfully."
                        }
                    }
                }
            }
        }
    }
}

