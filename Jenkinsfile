pipeline {
	agent none 
	
	environment {
		HOME = "/tmp"
		DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
	}

	stages {
		parallel {
			stage('Build dotnet') {
				agent {
					docker { image 'mcr.microsoft.com/dotnet/sdk:latest' }
				}
				steps {
					echo 'Building dotnet...'
					sh 'pwd'
					dir("DotnetTemplate.Web") {
						sh 'pwd'
						sh 'dotnet build'
						sh 'dotnet test'
					}
				}
			}
			stage('Build npm') {
				agent {
					docker { image 'node:17-bullseye' }
				}
				steps {
					echo 'Building npm...'
					sh 'pwd'
					dir("DotnetTemplate.Web") {
						sh 'pwd'
						sh 'npm ci'
						sh 'npm run build'
						sh 'npm run lint'
						sh 'npm t'
					}
				}
			}
		}
	}
}
