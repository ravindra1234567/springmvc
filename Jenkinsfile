node{
  stage('SCM Checkout'){
    git 'https://github.com/ravindra1234567/springmvc'
  }
  stage('Compile-Package'){
    // Get maven home path
    def mvnHome = tool name: 'maven-3', type: 'maven'
    bat "${mvnHome}/bin/mvn package"
  }
}
