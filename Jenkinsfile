pipeline {
    agent any

    stages {
         stage('Clone Repository') {
            steps {

                git 'https://github.com/bmsbharathi/jmeter-maven.git'

            }
         }
          stage('Run Test Plan 1') {
            steps {

                sh "./mvnw clean verify -DincludeTests='test-plan-1.jmx'"


            }
             post {
                always{
                    publishHTML([allowMissing: true, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'target/reports/test-plan-1/', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: ''])
                    archiveArtifacts 'src/main/resources/*.csv'
                }
            }
          }
        stage('Run Performance Test') {
            steps {

                sh "./mvnw clean verify -DincludeTests='P*.jmx'"
            }

            post {
                always{
                    archiveArtifacts 'src/main/resources/*.csv'
                    publishHTML([allowMissing: true, alwaysLinkToLastBuild: false, keepAll: true, reportDir: 'target/reports/Performance_test/', reportFiles: 'index.html', reportName: 'Per Test report', reportTitles: ''])
                }
            }
        }
    }
}
