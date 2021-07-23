import hudson.EnvVars
import groovy.util.AntBuilder
@Library("cp-jenkins-library")_

REPO = "cp-cypress-jenkins-gam"
SKIP_CI=false

setDefaultProperties()

node("build-label-cheekypints") {

    checkout scm

    container("jnlp-agent-build-node") {

        stage("Test") {

            try {

                def customImage = docker.build("cy-image:${env.BUILD_ID}")

                customImage.inside {
                    sh "npm install"
                    sh "\$(npm bin)/cypress --version"
                    sh "\$(npm bin)/cypress run --headless --browser chrome"
                    sh "\$(npm bin)/cypress run --headless --browser firefox"
                }

            } catch(error) {

                throw error

            }

        }

        stage("Publish to QA") {

            sh "sleep 10"
            sh "echo hello world!"

        }

    }

}