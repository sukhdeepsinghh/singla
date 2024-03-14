pipeline {
    agent { label  "singlaagent" }

    environment {
        MYSQL_DATABASE = 'sukhdeep'
        SCRIPTS_FOLDER = 'scripts'
        PROCESSED_FOLDER = 'processed'
        GIT_USERNAME = 'sukhdeepsinghh'
        GIT_PASSWORD = 'arintech@12345'
        GIT_REPO_URL = 'https://github.com/sukhdeepsinghh/singla.git'  // Replace with your GitHub repo URL
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
                            sudo mysql ${MYSQL_DATABASE} < \${WORKSPACE}/${SCRIPTS_FOLDER}/${scriptName} | grep -c ${scriptName}
                        """, returnStatus: true)

                        if (result == 1) {
                            echo "Table in script '${scriptName}' already exists."
                            stash includes: "${SCRIPTS_FOLDER}/${scriptName}", name: 'processedFiles'
                        } else {
                            echo "Creating table from script '${scriptName}'..."
                            // Execute the MySQL script
                            sh "sudo mysql ${MYSQL_DATABASE} < \${WORKSPACE}/${SCRIPTS_FOLDER}/${scriptName}"

                            // Move the processed script to PROCESSED_FOLDER on the agent
  // Move the processed script to PROCESSED_FOLDER on the agent

                            
                        }
                    }
                }
            }
        }

        stage('Move to Processed Folder') {
            steps {
               

                // Move the processed scripts to PROCESSED_FOLDER on both agent and master
    
                sh "mv \${WORKSPACE}/${SCRIPTS_FOLDER}/* \${WORKSPACE}/${PROCESSED_FOLDER}/"
             
                 // Stash the processed scripts on the agent
                stash includes: "${PROCESSED_FOLDER}/*", name: 'processedFiles'

           
            }
        }
        stage('Move to harman Folder') {
            steps {
      
             sh "mv processedFiles/* harman"
    }
  }
 }
}

 









