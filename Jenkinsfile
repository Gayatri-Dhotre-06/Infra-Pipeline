pipeline {
    agent any

    stages {
        stage('code clone') {
            steps {
                echo 'Code clone successful.'
            }
        }

        stage('test') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id',
                           variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key',
                           variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh '''
                        export AWS_DEFAULT_REGION=ap-south-1

                        terraform --version
                        terraform init
                        terraform validate
                        terraform plan
                    '''
                }
                echo 'Test successful.'
            }
        }

        stage('deploy') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id',
                           variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key',
                           variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh '''
                        export AWS_DEFAULT_REGION=ap-south-1
                        terraform apply --auto-approve
                    '''
                }
                echo 'Deploy successful.'
            }
        }

        stage('Monitor') {
            steps {
                withCredentials([
                    string(credentialsId: 'aws-access-key-id',
                           variable: 'AWS_ACCESS_KEY_ID'),
                    string(credentialsId: 'aws-secret-access-key',
                           variable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    sh '''
                        export AWS_DEFAULT_REGION=ap-south-1
                        terraform output
                    '''
                }
                echo 'Run successful.'
            }
        }
    }
}
