pipeline {
    agent {
        docker {
            image 'dockerapimonedastt'
            label 'apimonedas'
        }
    }
    
    environment {
        // Variables de entorno para Docker y Maven
        DOCKER__NAME     = 'dockerapimonedastt'
        DOCKER__IMAGE    = 'dockerapimonedastt'
        DOCKER_NETWORK   = 'apimonedas-network'
        DOCKER__VERSION  = 'latest'
        CONTAINER_NAME   = 'apimonedas'
        DOCKER__LABEL    = 'apimonedas'
        DOCKER__REGISTRY = 'docker.io'
        DOCKER_BUILD_DIR = 'presentacion'
        HOST_PORT        = '8081'
        CONTAINER_PORT   = '8080'
    }

    stages {

        stage('Construcción con Maven - BUILD') {
            steps {
                echo '🧱 Compilando la aplicación apimonedas con Maven...'
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Construcción de imagen Docker - DEPLOY') {
            steps {
                echo '🐳 Construyendo imagen Docker de apimonedas...'
                dir("${DOCKER_BUILD_DIR}") {
                    echo "📁 Usando directorio: ${DOCKER_BUILD_DIR}"
                    bat "docker build -t ${DOCKER__NAME}:${DOCKER__VERSION} ."
                }
            }
        }

        stage('Despliegue del contenedor Docker') {
            steps {
                echo '🚀 Desplegando contenedor Docker...'
                // Validar si el contenedor existe y eliminarlo si es necesario
                bat "docker rm -f ${CONTAINER_NAME} || echo 'No existe el contenedor, se procede con el despliegue...'"
                bat "docker run -d --name ${CONTAINER_NAME} --network ${DOCKER_NETWORK} -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER__NAME}:${DOCKER__VERSION}"
            }
        }
    }
}
