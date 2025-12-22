pipeline{
    agent any
    environment{
        DOCKERHUB_CREDS=credentials("dockerhub")
        IMAGE_NAME="shyamj90/devops"
    }
    stages{
        stage("Clone Repo"){
            steps{
                git branch: "dev" , url : "https://github.com/shyamj90/devops-build"
            }
        }
        stage("Build Image"){
            steps{
                script{
                    sh "docker build -t $IMAGE_NAME:latest ."
                }
            }
        }
        stage("Login to Dockerhub"){
            steps{
                script{
                    sh "echo $DOCKERHUB_CREDS_PSW | docker login -u $DOCKERHUB_CREDS_USR --password-stdin"
                }
            }
        }
        stage("Push Image to Dockerhub"){
            steps{
                script{
                    sh "docker push $IMAGE_NAME:latest"
                }
            }

        }
        stage('SSH to target') {
            steps {
                sshagent(["ssh-creds"]) {
                    sh 'scp docker-compose.yaml ec2-user@172.31.35.56:/home/ec2-user/app/'
                    sh 'ssh ec2-user@172.31.35.56 "cd /home/ec2-user/app && docker compose up -d"'                }
            }
        }
    }
}