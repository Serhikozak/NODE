pipeline {
    agent any
    stages {
        stage('Cloning repo') {
            steps{
                git credentialsId: "test_Node", branch: "main", url:'git@github.com:Serhikozak/NODE.git'

            }
        }
        stage('Build Image') {
            steps{
                image = docker.build test_run + "$BUILD_NUMBER"
            }
        }
    }
}
