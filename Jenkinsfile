pipeline {
    agent { label 'devops1-zainun' }

    stages {
        stage('Pull-SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/zainunkamal/simple-apps.git'
            }
        }c
        
        stage('Build') {
            steps {
                sh'''
                cd app
                npm install
                '''
            }
        }
        
        stage('Testing') {
            steps {
                sh'''
                cd app
                npm test
                npm run test:coverage
                '''
            }
        }
        
        stage('Code Review') {
            steps {
                sh'''
                cd app
                sonar-scanner \
                    -Dsonar.projectKey=simple-apps \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://172.23.13.201:9000 \
                    -Dsonar.login=sqp_f20b5fa15c6b916f67898d8245459bdefa001a47
                '''
            }
        }
        
        stage('Deploy') {
            steps {
                sh'''
                docker compose up --build -d
                '''
            }
        }
        
        stage('Backup') {
            steps {
                 sh 'docker compose push' 
            }
        }
    }
}