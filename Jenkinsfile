pipeline {
    agent any
    environment {
        imageDocker = ''}
    stages {
        stage('Cloning repo') {
            steps{
                git credentialsId: "test_Node", branch: "main", url:'git@github.com:Serhikozak/NODE.git'

            }
        }
        stage('Build Image') {
            steps{
                imageDocker = docker.build test_run + "$BUILD_NUMBER"
            }
        }
        stage ('Push Image') {
            steps{
                push(env.$BUILD_NUMBER)
                push('latest')
            }
        }
        stage ('Delete Image') {
            steps{
                delete()
            }
        }
    }
}
