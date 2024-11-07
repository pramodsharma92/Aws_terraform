pipeline {
    agent any

    /*environment {
        AWS_CREDENTIALS = credentials('67a378a0-0aa9-4569-9dbd-8d97c963bc3e')
    }*/

    stages {
        stage('Setup') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
                                      accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
                                      secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                                      credentialsId: '67a378a0-0aa9-4569-9dbd-8d97c963bc3e']]) {
                        // Your code that requires AWS credentials goes here
                        // For example, print the credentials (avoid doing this in production for security reasons)
                        sh 'echo $AWS_ACCESS_KEY_ID'
                        sh 'echo $AWS_SECRET_ACCESS_KEY'
                        sh 'echo "AWS Credentials Loaded Successfully"'
                    }
                }
            }
        }
       stage('Checkout') {
            steps {
                //git 'https://github.com/pramodsharma92/aws_terraform.git'
                git branch: 'main', url: 'https://github.com/pramodsharma92/aws_terraform.git', credentialsId: '9462c79e-ca8d-41d3-83f3-344f62ab9d42'
            }
        }
      stage('Terraform Init') {
            steps {
                sh '''
                    terraform init 
                    #-backend-config="access_key=${AWS_CREDENTIALS_USR}" \
                    #-backend-config="secret_key=${AWS_CREDENTIALS_PSW}"
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                    #terraform plan \
                    #-var "aws_access_key=${AWS_CREDENTIALS_USR}" \
                    #-var "aws_secret_key=${AWS_CREDENTIALS_PSW}" 
                    terraform plan -var "aws_access_key=${AWS_ACCESS_KEY_ID}" -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"

                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh '''
                    #terraform apply -auto-approve \
                    #-var "aws_access_key=${AWS_CREDENTIALS_USR}" \
                    #-var "aws_secret_key=${AWS_CREDENTIALS_PSW}" 
                    terraform apply -auto-approve -var "aws_access_key=${AWS_ACCESS_KEY_ID}" -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
                '''
            }
        }
        stage('Terraform Destroy') {
            steps {
                sh '''
                    #terraform destroy -auto-approve \
                    #-var "aws_access_key=${AWS_CREDENTIALS_USR}" \
                    #-var "aws_secret_key=${AWS_CREDENTIALS_PSW}" 
                    terraform destroy -auto-approve -var "aws_access_key=${AWS_ACCESS_KEY_ID}" -var "aws_secret_key=${AWS_SECRET_ACCESS_KEY}"
                '''
            }
        }
    }
}
