pipeline {
    agent {
        docker {
            image 'dockerapimonedastt'
            label 'apimonedas'
        }
    environment {
        // Define any environment variables here
        DOCKER__NAME = 'dockerapimonedastt'
        DOCKER__IMAGE = 'dockerapimonedastt'
        DOCKER_NETWORK = 'apimonedas-network'
        DOCKER__VERSION = 'latest'
        CONTAINER_NAME = 'apimonedas'
        DOCKER__LABEL = 'apimonedas'
        DOCKER__REGISTRY = 'docker.io'
        DOCKER_BUILD_DIR='presentacion'
        HOST_PORT = '8081'
        CONTAINER_PORT = '8080'
        }
    }
    stages {
        stage('Construcción MAVEN - BUILD') {
            steps {
                echo 'Building the apimonedas applicacion con MVN...'
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
                bat "docker run -d --name ${CONTAINER_NAME} --netkork ${DOCKER_NETWORK} -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER__NAME}"
            }
        }
    }
}