pipeline {
 environment {
   registry = "mehaboobsubhani/nodejs"
   registryCredential = "mehaboobsubhani"
   dockerImage = ''
 }
 agent any
 stages {
   stage('Checkout'){
       checkout scm
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

 }
}
