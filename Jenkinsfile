pipeline{
    agent any
    environment{
        DOCKERHUB_CREDS=credentials("dockerhub")
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
                    sh "./scripts/build.sh ${env.GIT_BRANCH}"
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
                    sh "./scripts/deploy.sh ${env.GIT_BRANCH}"
                }
            }

        }
        stage('SSH to target') {
            steps {
                sshagent(["ssh-creds"]) {
                    sh 'scp -o StrictHostKeyChecking=no docker-compose.yaml prometheus.yml blackbox.yml ec2-user@172.31.35.56:/home/ec2-user/app/'
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@172.31.35.56 "cd /home/ec2-user/app && docker compose up -d"'                }
            }
        }
    }
}