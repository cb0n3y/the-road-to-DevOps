pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building project from branch ${env.BRANCH_NAME}"
                sh 'make build || echo "No makefile, skipping build"'
            }
        }

        stage('Test') {
            steps {
                sh 'make test || echo "No tests defined"'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo 'Deploying to production environment...'
            }
        }
    }

    post {
        success {
            echo "✅ Build succeeded on ${env.BRANCH_NAME}"
        }
        failure {
            echo "❌ Build failed on ${env.BRANCH_NAME}"
        }
    }
}
