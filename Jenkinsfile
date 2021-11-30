pipeline {
	agent none 
	
	stages {
		stage('Build dotnet') {
			agent {
				docker { image 'mcr.microsoft.com/dotnet/sdk:latest' }
			}
			steps {
				echo 'Building dotnet...'
				sh 'export DOTNET_CLI_HOME="/tmp/dotnet_cli_home"'
				sh 'pwd'
				dir("DotnetTemplate.Web") {
					sh 'pwd'
					sh 'echo $DOTNET_CLI_HOME'
					sh 'dotnet build'
				}
			}
		}
		stage('Build npm') {
			agent {
				docker { image 'node:17-alpine' }
			}
			steps {
				echo 'Building npm...'
				sh 'pwd'
				dir("DotnetTemplate.Web") {
					sh 'pwd'
					sh 'npm install'
					sh 'npm run build'
				}
			}
		}
		stage('Test') {
			steps {
				echo 'Testing...'
			}
		}
	}
}
