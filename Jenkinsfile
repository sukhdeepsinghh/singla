pipeline {
    agent { label  "singlaagent" }

    stages {
        stage('Create a table') {
            steps {
                echo "Currenti Directory: ${pwd()}"
                sh "ls -la"
            }
        }

        // Rest of your pipeline...
    }
}
pipeline {
     agent { label  "singlaagent" }

    environment {
        DATABASE_NAME = 'sukhdeep'
        TABLE_NAME = 'students'
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
                    // Your SQL script to create the table
                    def createTableScript = """
                        USE $DATABASE_NAME;
                        CREATE TABLE $TABLE_NAME (
                            // Define your table columns and data types here
                            // For example: id INT PRIMARY KEY, name VARCHAR(255), ...
                            CustomerID INT AUTO_INCREMENT PRIMARY KEY,
                            FirstName VARCHAR(50),
                            LastName VARCHAR(50),
                            Email VARCHAR(100),
                            Phone VARCHAR(20)
                        );
                    """

                    // Execute the SQL script using the MySQL client
                    sh """
                        mysql -h  -e "${createTableScript}"
                    """
                }
            }
        }
    }
}

