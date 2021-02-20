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
                    publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/reports/test-plan-1/', reportFiles: 'index.html', reportName: 'Report  For Test Plan 1', reportTitles: ''])
                    archiveArtifacts 'target/reports/test-plan-1.csv'
                    perfReport filterRegex: '', sourceDataFiles: '/target/reports/error-summary-request-1.csv'
                }
            }
          }
        stage('Run Performance Test') {
            steps {

                sh "./mvnw clean verify -DincludeTests='P*.jmx'"
            }

            post {
                always{
                    publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/reports/Performance_test/', reportFiles: 'index.html', reportName: 'Report for Performance test', reportTitles: ''])
                    archiveArtifacts 'target/reports/Performance_test.csv'
                    archiveArtifacts allowEmptyArchive: true, artifacts:'target/reports/error-summary-request-2.csv'
                    perfReport filterRegex: '', sourceDataFiles: '/target/reports/Performance_test.csv'
                }
            }
        }
    }
}
