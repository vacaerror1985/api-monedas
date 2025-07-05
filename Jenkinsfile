pipeline {
    agent {
        docker {
            image 'dockerapimonedastt'
        }
        label 'apimonedas' // Label should be outside the docker block
    }
    environment { // This block should be directly under 'pipeline', not nested within 'agent'
        // Define any environment variables here
        DOCKER__NAME = 'dockerapimonedastt'
        DOCKER__IMAGE = 'dockerapimonedastt'
        DOCKER_NETWORK = 'apimonedas-network'
        DOCKER__VERSION = 'latest'
        CONTAINER_NAME = 'apimonedas'
        DOCKER__LABEL = 'apimonedas'
        DOCKER__REGISTRY = 'docker.io'
        DOCKER_BUILD_DIR = 'presentacion'
        HOST_PORT = '8081'
        CONTAINER_PORT = '8080'
    }
    stages {
        stage('Construcción MAVEN - BUILD') {
            steps {
                echo 'Building the apimonedas applicacion con MVN...'
                // Assuming Maven is available on the agent or configured via 'tools'
                bat 'mvn clean package -DskipTests'
            }
        }
        stage('Construir imagen Docker - DEPLOY') {
            steps {
                echo 'Deploying the apimonedas application with Docker...'
                dir ("${DOCKER_BUILD_DIR}") {
                    echo "Building Docker image from ${DOCKER_BUILD_DIR}..."
                    bat "docker build -t ${DOCKER__NAME} ."
                }
            }
        }
        stage('Desplegar el contenedor - DEPLOY') {
            steps {
                echo 'Deploying apimonedas...'
                // Corrected typo: --netkork -> --network
                bat "docker run -d --name ${CONTAINER_NAME} --network ${DOCKER_NETWORK} -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER__NAME}"
            }
        }
    }
    post { // Optional: Add a post section for cleanup or notifications
        always {
            echo 'Pipeline finished.'
            // Example cleanup: Stop and remove the container
            // bat "docker stop ${CONTAINER_NAME}"
            // bat "docker rm ${CONTAINER_NAME}"
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
