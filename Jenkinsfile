pipeline {
    agent any

    environment {
        TF_FOLDER = ''
    }

    stages {
        stage('Setup') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'main') {
                        TF_FOLDER = 'EC2'
                    } else if (env.BRANCH_NAME == 'dev') {
                        TF_FOLDER = 'S3'
                    } else {
                        error("Unsupported branch: ${env.BRANCH_NAME}. Expected 'main' or 'dev'")
                    }
                    echo "Running pipeline for branch: ${env.BRANCH_NAME}"
                    echo "Terraform folder: ${TF_FOLDER}"
                }
            }
        }

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_FOLDER}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_FOLDER}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_FOLDER}") {
                    sh 'terraform plan -no-color'
                }
            }
        }
    }

    post {
        success {
            echo " Success: ${TF_FOLDER} Terraform validated and planned on branch ${env.BRANCH_NAME}"
        }
        failure {
            echo " Failed: Issue in ${TF_FOLDER} on branch ${env.BRANCH_NAME}"
        }
    }
}
