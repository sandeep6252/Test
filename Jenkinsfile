pipeline{
    agent any
    stages{
        stage('scm checkout'){
            steps{
                script{
                     checkout([
                        $class: 'GitSCM',
                        branches: [[name: 'master']], // Replace 'main' with your branch name
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [],
                        userRemoteConfigs: [[
                            url: 'https://github.com/jenkins-docs/simple-java-maven-app.git',
                            credentialsId: 'DefaultGithub'
                        ]]
                    ])
                }
            }
        }
        stage('Build'){
            steps{
                script{
                    withEnv(['MYTOOL_HOME=C:\\Program Files\\apache-maven-3.9.7\\bin']) {
                        sh '$MYTOOL_HOME\\mvn validate'
                        }
                    
                }
            }
        }
       
    }
}
