pipeline {
    agent any sukh
  checkout scm


    stages {
        stage('Checkout') {
            steps {
                // You may need to customize this based on your version control system
                git credentialsId: 'github-credentials', url: 'git@github.com:sukhdeepsinghh/singla.git'
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    // Your SQL script to create the table
                    def createTableScript = """
                        CREATE TABLE $TABLE_NAME (
                            // Define your table columns and data types here
                            // For example: id INT PRIMARY KEY, name VARCHAR(255), ...
                        );
                    """

                    // Execute the SQL script using the MySQL client
                    sh """
                        mysql -h$MYSQL_HOST -P$MYSQL_PORT -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE -e "${createTableScript}"
                    """
                }
            }
        }
    }
}

