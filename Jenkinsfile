pipeline {
    agent any
	tools{
		maven "mymaven"
	}
    environment {
        DOCKER_IMAGE_NAME = "mrtienvu/endprojectimage"
    }
    stages {
        stage('Packaging') {
            steps {
				echo "Cloning..."
		        git branch: 'main', url: 'https://github.com/mrtienvu/endproject_kubernetes.git'
				echo "Packaging..."
				sh 'mvn package'
				sh 'cp target/addressbook.war ./'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    app = docker.build(DOCKER_IMAGE_NAME)
                    app.inside {
                        sh 'echo Buiding new image...'
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub', url: '') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
	stage('Deploy To Staging') {
            environment { 
                CANARY_REPLICAS = 1
            }
            steps {
                kubernetesDeploy(
                    kubeconfigId: 'kubeconfig',
                    configs: 'mydeployment.yml',
                    enableConfigSubstitution: true
                )
            }
        }
    }
}
