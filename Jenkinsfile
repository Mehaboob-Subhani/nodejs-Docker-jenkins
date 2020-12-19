properties([pipelineTriggers([githubPush()])])

node { git url:'https://github.com/Mehaboob-Subhani/nodejs-Docker-jenkins.git', branch:'master' }
pipeline {
 environment {
   registry = "mehaboobsubhani/nodejs"
   registryCredential = "mehaboobsubhani"
   dockerImage = ''
 }
 agent any
 stages {
  /* stage('Checkout'){
       checkout scm
   }*/
   stage('Cloning Git') {
    steps {
      git 'https://github.com/Mehaboob-Subhani/nodejs-Docker-jenkins.git'
    }
   }
   stage('Building image') {
     steps{
       script {
         dockerImage=docker.build registry + ":$BUILD_NUMBER"
       }
     }
   }
   stage('Deploy Image') {
     steps{
        script {
           docker.withRegistry( '', registryCredential ) {
           dockerImage.push()
         }
        }
     }
   }
   stage('Check container is running') {
      steps{
        script {
           sh 'docker rm -f nodejs || true'
        }
      }
   }  
   stage('Running the image') {
      steps{
        script {
            docker.image(registry).run('--name nodejs -p 5000:5000')
        }
      }
   }
 }
}
