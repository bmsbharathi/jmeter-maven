pipeline {
    agent any

    stages {
         stage('Clone Repository') {
            steps {

                git 'https://github.com/bmsbharathi/jmeter-maven.git'

            }
         }
          stage('Run TPerformance Test 1') {
            steps {

                sh " mvn clean verify -DincludeTests='test-plan-1.jmx'"

            post {
                archiveArtifacts 'src/main/resources/*.csv'
            }
            }
          }
        stage('Run Performance Test 2') {
            steps {

                sh "mvn clean verify -DincludeTests='P*.jmx'"
            }

            post {
                archiveArtifacts 'src/main/resources/*.csv'
            }
        }
    }
}
