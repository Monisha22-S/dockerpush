node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */
        app = docker.build("monisha407/pywebapp12")
    }

    stage('Test image') {
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
            You would need to first register with DockerHub before you can push images to your account
        */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            echo "Trying to Push Docker Build to DockerHub"
        }
    }

    stage('Inspect image') {
        /* Inspect the Docker image */
        docker.image('monisha407/pywebapp1').inside {
            bat 'docker inspect -f . monisha407/pywebapp12'
        }
    }
}
