def projectName = 'EDA-tool'
def version = "0.0.${currentBuild.number}"
def dockerImageTag = "${projectName}:${version}"

pipeline {
  agent any

  stages {

    stage('Build') {
      steps {
        sh """
        chmod +x -R ${env.WORKSPACE}
        ./dev/Scripts/activate
        pwd
        cd ./dev/Lib/site-packages
        python --version
        apt install python3 -y
        docker build -t ${dockerImageTag} .
        python -m pip install -r /var/lib/jenkins/workspace/EDA_pipeline/requirements.txt
        cd ../..
        python app.py"""
        }        
      }
    

    stage('Build Container') {
      steps {
        sh "docker build -t ${dockerImageTag} ."
      }
    }

    stage('Deploy Container To Openshift') {
      steps {
        sh "oc login https://localhost:8443 --username admin --password admin --insecure-skip-tls-verify=true"
        sh "oc project ${projectName} || oc new-project ${projectName}"
        sh "oc delete all --selector app=${projectName} || echo 'Unable to delete all previous openshift resources'"
        sh "oc new-app ${dockerImageTag} -l version=${version}"
        sh "oc expose svc/${projectName}"
      }
    }
  }
}
