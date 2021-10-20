pipeline {
    agent any
    environment {
        registry = '13290479/for_lcgroup'
        registryCredential = "to_connect_DockerHub"
        imageDocker = ''}
    stages {
        stage('Cloning repo') {
            steps{
                git credentialsId: "test_Node", branch: "main", url:'git@github.com:Serhikozak/NODE.git'

            }
        }
        stage('Build Image') {
            steps{
                script {
                    imageDocker = docker.build registry + ":NODE-$BUILD_NUMBER"
                }
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
