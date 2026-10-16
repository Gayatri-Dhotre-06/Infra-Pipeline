pipeline {
    agent any

    stages {
        stage('code pull') {
            steps {
                sh '''
                  git branch: 'main',
                    url: 'https://github.com/Gayatri-Dhotre-06/Infra-Pipeline.git'
                '''
                echo 'code clone successfull.'
            }
        }

        stage('test') {
            steps {
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
