pipeline {
    agent any
    environment {
        DOCKER_IMAGE_NAME = "mrtienvu/myendproject"
    }
    stages {
        stage('Packaging') {
            steps {
		echo "Cloning..."
		git branch: 'main', url: 'https://github.com/mrtienvu/endproject_kubernetes.git'
		echo "Packaging..."
		sh 'mvn package'
            }
        }
    }
}
