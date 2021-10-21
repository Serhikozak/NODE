pipeline {
    agent any
    environment {
        registry = '13290479/for_lcgroup'
        registryCredential = "to_connect_DockerHub"
        dockerImage = ''}
    stages {
        stage('Cloning repo') {
            steps{
                git credentialsId: "test_Node", branch: "main", url:'git@github.com:Serhikozak/NODE.git'

            }
        }
        stage('Build Image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":NODE-$BUILD_NUMBER"
                }
            }
        }
        stage ('Push Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push(env.NODE-$BUILD_NUMBER)
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage ('Delete Image') {
            steps{
                delete()
            }
        }
    }
}
