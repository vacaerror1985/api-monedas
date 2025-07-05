pipeline {
    agent {
        docker {
            image 'vacaerror/api-monedastt'
            
        }
    }
    
    environment {
        // Variables de entorno para Docker y Maven
        DOCKER__NAME     = 'api-monedastt'
        DOCKER__IMAGE    = 'api-monedastt'
        DOCKER_NETWORK   = 'apimonedas-network'
        DOCKER__VERSION  = 'latest'
        CONTAINER_NAME   = 'api-monedastt'
        DOCKER__REGISTRY = 'docker.io'
        HOST_PORT        = '8081'
        CONTAINER_PORT   = '8080'
    }

    stages {
               stage('Construir imagen Docker') {
            steps {
               
                    bat "docker build . -t ${DOCKER_IMAGE}"
                
            }
        }

        stage('Limpiar contenedor existente') {
            steps {
                script {
                    catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                        bat """
                        docker container inspect ${CONTAINER_NAME} >nul 2>&1 && (
                            docker container stop ${CONTAINER_NAME}
                            docker container rm ${CONTAINER_NAME}
                        ) || echo "No existe el contenedor '${CONTAINER_NAME}'."
                        """
                    }
                }
            }
        }

        stage('Desplegar contenedor') {
            steps {
                bat "docker run --network ${DOCKER_NETWORK} --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -d ${DOCKER_IMAGE}"
            }
        }
    }
}