pipeline {
    agent any

    environment {
        // Defines the SSH credential ID set up in Jenkins
        SSH_CRED_ID = 'ec2-server-key' 
        SERVER_USER = 'ubuntu'
        SERVER_HOST = 'your-ec2-ip-or-domain' // Replace with your EC2 IP
    }

    triggers {
        // Triggers the pipeline automatically when a push happens on the main branch
        githubPush() 
    }

    stages {
        stage('Checkout') {
            steps {
                // Pulls the latest code from your repository
                checkout scm
            }
        }

        stage('Deploy to EC2') {
            steps {
                // Uses the Jenkins SSH Agent plugin to securely handle your private key
                sshagent(credentials: [env.SSH_CRED_ID]) {
                    sh """
                        ssh -o StrictHostKeyChecking=no ${env.SERVER_USER}@${env.SERVER_HOST} '
                            cd /home/ubuntu/ecommerce-cicd-github-actions

                            echo "Pulling latest code from main..."
                            git pull origin main

                            echo "Updating Backend..."
                            cd Cricket-backend
                            npm install
                            pm2 restart cricket-backend

                            echo "Updating Frontend..."
                            cd ../Cricket-frontend
                            npm install
                            npm run build
                            pm2 restart cricket-frontend

                            echo "Updating Admin..."
                            cd ../Cricket-Admin
                            npm install
                            npm run build
                            pm2 restart cricket-admin

                            echo "Saving PM2 state..."
                            pm2 save
                        '
                    """
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed. Check the logs above.'
        }
    }
}