pipeline {
 
  agent { 
    node {
      label 'any'
 }
}

options {
  timestamps()
}

 stages {
  stage('Destroy EC2') {
      steps {
      withCredentials([
            usernamePassword(credentialsId: 'AWS_KEY', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
            usernamePassword(credentialsId: 'github_account', passwordVariable: 'REPO_PASS', usernameVariable: 'REPO_USER'),
          ]) {
      sh 'git clone https://github.com/andrewwaters00/packer-terraform'
      sh '''
         cd packer-terraform
         terraform init
         terraform destroy --auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
	 terraform show
         '''
      }
     }
    }
  }
}

   
