pipeline {
    agent any

    stages {
        stage('code clone') {
            steps {
                echo 'code clone successfull.'
            }
        }

        stage('test') {
            steps {
                withCredentials([
    string(credentialsId: 'aws-access-key-id',
           variable: 'AWS_ACCESS_KEY_ID'),
    string(credentialsId: 'aws-secret-access-key',
           variable: 'AWS_SECRET_ACCESS_KEY')
])}
                {
                sh '''
                  terraform --version
                    terraform init
                    terraform validate 
                    terraform plan
                '''
                echo 'test successfull.'
            }
        }

        stage('deploy') {
            steps {
                sh '''
                   terraform apply --auto-approve
                '''
                echo 'deploy successfull.'
            }
        }

        stage('Monitor') {
            steps {
                sh '''
                   terraform output
                '''
                echo 'run successfull.'
            }
        }
    }
}
