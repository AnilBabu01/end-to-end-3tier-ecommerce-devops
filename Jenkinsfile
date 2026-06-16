pipeline {

    agent any

    environment {
        DOCKER_USER = 'abdocker409'
        FRONTEND = 'cricket-frontend'
        ADMIN = 'cricket-admin'
        API = 'cricket-api'
    }

    stages {

        stage('Clone') {
            steps {
                git branch: 'main',
                url: 'https://github.com/AnilBabu01/end-to-end-3tier-ecommerce-devops.git'
            }
        }



       stage('Docker Login') {
    steps {
        withCredentials([
            usernamePassword(
                credentialsId: 'dockerhub-creds',
                usernameVariable: 'DOCKER_USERNAME',
                passwordVariable: 'DOCKER_PASSWORD'
            )
        ]) {
            sh '''
            echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
            '''
        }
    }
   }


        stage('Build Images') {
            steps {

                sh '''
                docker build -f docker/frontend.Dockerfile -t $DOCKER_USER/$FRONTEND:latest .
                docker build -f docker/admin.Dockerfile -t $DOCKER_USER/$ADMIN:latest .
                docker build -f docker/backend.Dockerfile -t $DOCKER_USER/$API:latest .
                '''
            }
        }

        stage('Push Images') {
            steps {

                sh '''
                docker push $DOCKER_USER/$FRONTEND:latest
                docker push $DOCKER_USER/$ADMIN:latest
                docker push $DOCKER_USER/$API:latest
                '''
            }
        }

        // sdsdsd

        stage('Deploy') {
            steps {

                sh '''
                docker pull $DOCKER_USER/$FRONTEND:latest
                docker pull $DOCKER_USER/$ADMIN:latest
                docker pull $DOCKER_USER/$API:latest

                docker rm -f frontend || true
                docker rm -f admin || true
                docker rm -f api || true

                docker run -d \
                --name frontend \
                --restart always \
                -p 5173:5173 \
                $DOCKER_USER/$FRONTEND:latest

                docker run -d \
                --name admin \
                --restart always \
                -p 3000:3000 \
                $DOCKER_USER/$ADMIN:latest

                docker run -d \
                --name api \
                --restart always \
                -p 5000:5000 \
                $DOCKER_USER/$API:latest
                '''
            }
        }
    }
}