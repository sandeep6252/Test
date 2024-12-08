pipeline{
    agent any
    environment {
        MAVEN_HOME = 'C:\\Program Files\\apache-maven-3.9.7' // Update this path
        PATH = "${env.PATH};${MAVEN_HOME}\\bin"
    }
    stages{
        stage('scm checkout'){
            steps{
                script{
                     checkout([
                        $class: 'GitSCM',
                        branches: [[name: '${Branch}']], // Replace 'main' with your branch name
                        doGenerateSubmoduleConfigurations: false,
                        extensions: [],
                        userRemoteConfigs: [[
                            url: 'https://github.com/jenkins-docs/${RepoName}.git',
                            credentialsId: 'DefaultGithub'
                        ]]
                    ])
                }
            }
        }
        stage('Build'){
            steps{
                script{
                bat 'mvn install'
   
                }
            }
        }
       
    }
}
