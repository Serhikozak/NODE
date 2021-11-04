pipeline {
    agent any
    environment {
//         TAG = sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()
        TAG = 'v10.0.0'
        registry = '13290479/for_lcgroup'
        registryCredential = "to_connect_DockerHub"
        dockerImage = ''}
    stages {
        stage('Checkout') {
          steps {
            checkout scm: [$class: 'GitSCM', userRemoteConfigs: [[url: 'git@github.com:Serhikozak/NODE.git', credentialsId: "test_Node" ]], branches: [[name: 'refs/tags/${TAG}']]], poll: false
          }
        }
        stage('Cloning repo') {
            steps{
                git credentialsId: "test_Node", branch: 'refs/remotes/origin/tags/${TAG}' , url:'git@github.com:Serhikozak/NODE.git'

            }
        }
        stage('Build Image') {
            steps{
                script {
                    dockerImage = docker.build registry + ":NODE-${TAG}"
                }
            }
        }
        stage ('Push Image') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push('NODE-$BUILD_NUMBER')
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage ('Delete Image') {
            steps{
                 sh''' docker rmi $registry:NODE-$BUILD_NUMBER
                       docker rmi $registry:latest '''


            }
        }
    }
}
