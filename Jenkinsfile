pipeline {
    agent {
        kubernetes {
        cloud 'kubernetes-staging'    
        defaultContainer 'jnlp'
        yaml """
apiVersion: v1
kind: Pod
metadata:
  name: rocky-pod
  namespace: jenkins
spec:
  containers:
    - name: rocky
      image: ghcr.io/juancamilocc/builders:rocky8-docker
      imagePullPolicy: IfNotPresent
      tty: true
      securityContext:
        runAsUser: 0
        privileged: true
      resources:
        limits:
          memory: "2Gi"
          cpu: "750m"
        requests:
          memory: "1Gi"
          cpu: "500m"
      volumeMounts:
        - name: docker-graph-storage
          mountPath: /var/lib/docker
  volumes:
    - name: docker-graph-storage
      emptyDir: {}
            """
            containerTemplate {
                name 'jnlp'
                image 'jenkins/inbound-agent'
                resourceRequestCpu '256m'
                resourceRequestMemory '500Mi'
                resourceLimitCpu '512m'
                resourceLimitMemory '1000Mi'
            }
        }
    }
    stages {
        stage('Hello Jenkins') {
            steps {
                container('rocky') {
                    
                    echo "Hello Jenkins!!!"
                }
            }
        }
    }
    post {
        success {
            echo "Success"
        }
        failure {           
            echo "Failure"
        }
    }
}