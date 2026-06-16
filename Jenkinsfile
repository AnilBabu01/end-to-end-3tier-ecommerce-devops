pipeline {

  agent any

  environment {

      DOCKER_USER='dockerhubuser'
      FRONTEND='cricket-frontend'
      ADMIN='cricket-admin'
      BACKEND='cricket-backend'
  }

  stages {

    stage('Clone') {
      steps {
        git branch: 'main',
        url: 'https://github.com/user/repo.git'
      }
    }

    stage('Build') {
      steps {

        sh '''
        docker build -t $DOCKER_USER/$FRONTEND frontend/
        docker build -t $DOCKER_USER/$ADMIN admin/
        docker build -t $DOCKER_USER/$BACKEND backend/
        '''
      }
    }

    stage('Push') {
      steps {

        sh '''
        docker push $DOCKER_USER/$FRONTEND
        docker push $DOCKER_USER/$ADMIN
        docker push $DOCKER_USER/$BACKEND
        '''
      }
    }

    stage('Deploy') {

      steps {

        sh '''

        docker pull $DOCKER_USER/$FRONTEND
        docker pull $DOCKER_USER/$ADMIN
        docker pull $DOCKER_USER/$BACKEND

        docker stop frontend || true
        docker stop admin || true
        docker stop backend || true

        docker rm frontend || true
        docker rm admin || true
        docker rm backend || true

        docker run -d \
        --name frontend \
        -p 3000:3000 \
        $DOCKER_USER/$FRONTEND

        docker run -d \
        --name admin \
        -p 3001:3001 \
        $DOCKER_USER/$ADMIN

        docker run -d \
        --name backend \
        -p 5000:5000 \
        $DOCKER_USER/$BACKEND

        '''
      }
    }
  }
}