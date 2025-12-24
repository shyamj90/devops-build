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
                    sh "./scripts/image_push.sh ${env.GIT_BRANCH}"
                }
            }

        }
        stage('Deploy to App Server') {
            steps {
                sshagent(["ssh-creds"]) {
                    sh "./scripts/deploy.sh"
                }
            }
        }
    }
}