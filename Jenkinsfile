pipeline {
    agent any
    environment {
        registry = "939916214044.dkr.ecr.ap-southeast-2.amazonaws.com/my-docker-webserver-repo"
    }
    
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/Queenzlander/basic-webserver-pipeline']]])
            }
        }
// Building Docker image
    stage('Building image') {
        steps{
            script {
                dockerImage = docker.build registry
            }
        }
    }

// Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
        steps{
            sh 'aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 939916214044.dkr.ecr.ap-southeast-2.amazonaws.com | docker push 939916214044.dkr.ecr.ap-southeast-2.amazonaws.com/my-docker-webserver-repo:latest'
            
        }
    }
 }
}
/* job for later
    stage('K8S Deploy') {
        steps{
            script {
                withKubeConfig([credentialsId: 'Kubernetes', serverUrl: '']) {
                sh ('kubectl apply -f eks-deploy-k8s.yaml')
                    }
                }
            }
        }
    }
*/
