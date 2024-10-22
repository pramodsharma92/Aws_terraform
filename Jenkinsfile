pipeline {
    agent any

    environment {
        AWS_CREDENTIALS = credentials('67a378a0-0aa9-4569-9dbd-8d97c963bc3e')
    }

    stages {
       /* stage('Checkout') {
            steps {
                git 'https://github.com/pramodsharma92/aws_terraform.git'
            }
        }*/
      stage('Terraform Init') {
            steps {
                sh '''
                    terraform init \
                    -backend-config="access_key=${AWS_CREDENTIALS_USR}" \
                    -backend-config="secret_key=${AWS_CREDENTIALS_PSW}"
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                    terraform plan \
                    -var "aws_access_key=${AWS_CREDENTIALS_USR}" \
                    -var "aws_secret_key=${AWS_CREDENTIALS_PSW}" 
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh '''
                    terraform apply -auto-approve \
                    -var "aws_access_key=${AWS_CREDENTIALS_USR}" \
                    -var "aws_secret_key=${AWS_CREDENTIALS_PSW}" 
                '''
            }
        }
    }
}
