pipeline {
   agent any


    parameters {
       booleanParam(name: 'destroy', defaultValue: true, description: 'Select the checkbox if you want to destroy the infrastructure')
       booleanParam(name: 'existingvpc', defaultValue: true, description: 'Select the checkbox if you want to use existing vpc')        
        //Azure VM Parameters
        string(name: 'vmname', defaultValue: 'demovm', description: '')
        string(name: 'rgname', defaultValue: 'rg-demo-vm', description: '')
        string(name: 'location', defaultValue: 'eastus', description: '')
        string(name: 'adminuser', defaultValue: 'Standard_D2_v2', description: '')
        string(name: 'adminpassword', defaultValue: 'P@ssW0rd', description: '')
        string(name: 'vmsize', defaultValue: 'Standard_D2_v2', description: '')
        string(name: 'cloud', defaultValue: 'azure', description: '')
        //GCP VM Parameters
        string(name: 'vmname', defaultValue: 'demo-vm', description: '')
        string(name: 'zone', defaultValue: 'Dev', description: '')
        string(name: 'machine_type', defaultValue: 'demo', description: '')
        
    }
    stages {
        stage('Git checkout') { 
            steps{
                sh 'whoami'
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/aliarslangit/cloudagnostic-terraform-azure-gcp'

        }
        }
             stage('Installing Azure Modules') {
                   
            steps {
                    sh 'sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
                    withCredentials([azureServicePrincipal('azcli')]) {
                    sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
                    sh 'pwd'           
               
                    }
                }
        }
             stage('Installing Terraform') {
                 
            steps {
                    
                    sh 'curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -'
                    sh 'sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"'
                    sh 'sudo apt install terraform'
                }
        }
        stage('Azure Login')
        {
            steps{
                             withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'azurevsi', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']])
                             {
                                sh 'az login -u $USERNAME -p $PASSWORD'
                             }
            }
        }
        stage('Terraform Initialization') { 
             when {
                 expression {
        params.cloud==azure
                 }
    }
            steps{
                   
               sh '''#!/bin/bash
               cd ./terraformscript
               terraform init
                '''
    }
        }
        stage('Check Terraform plan') { 
             when {
        expression {
        params.cloud==azure
                 }
    }
            steps {

               sh '''#!/bin/bash
               cd ./terraformscript
               terraform plan -var cloud=$cloud -var vmname=$vmname -var rgname=$rgname -var location=$location -var adminuser=$adminuser -var adminpassword=$adminpassword -var vmsize=$vmsize
              '''
            }
        }
        stage('Apply the terraform code') {
             when {
        expression {
        params.cloud==azure
                 }
    }
            steps{
                

             //   sh 'terraform apply' 
                
            sh '''#!/bin/bash
            cd ./terraformscript
            terraform apply -var cloud=$cloud -var vmname=$vmname -var rgname=$rgname -var location=$location -var adminuser=$adminuser -var adminpassword=$adminpassword -var vmsize=$vmsize
             '''     
            }
        }  
    
 }

 }
