node{
  stage('SOM Checkout'){
    git 'https://github.com/ravindra1234567/springmvc'
  }
  stage('Compile-Package'){
    def mvnHome = tool name: 'maven-3', type: 'maven'
    sh "${mvnHome}/bin/mvn package"
  }
}
