pipeline {
     agent { label  "singlaagent" }

    environment {
        DATABASE_NAME = 'sukhdeep'
        TABLE_NAME = 'customers'
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
                    
                    def createTableScript = """
                        USE $DATABASE_NAME;
                        CREATE TABLE $TABLE_NAME(
                            CustomerID INT AUTO_INCREMENT PRIMARY KEY,
                            FirstName VARCHAR(50),
                            LastName VARCHAR(50),
                            Email VARCHAR(100),
                            Phone VARCHAR(20)
                        );
                    """

                    // Execute the SQL script using the MySQL client
                    sh """
                       sudo mysql  -e "${createTableScript}"
                    """
                }
            }
        }
    }
}

