pipeline {
   agent any
    environment {
        AZURE_SUBSCRIPTION_ID= credentials('azuresubid') 
        AZURE_TENANT_ID= credentials('azuretenantid')
        AZURE_CLIENT_ID= credentials('azureclientid')
        AZURE_CLIENT_SECRET= credentials('azureclientsecret')
        AZ_USERNAME=credentials('azusername')
        AZ_PASSWORD=credentials('azpassword')
    }
    parameters {
       booleanParam(name: 'destroy', defaultValue: true, description: 'Select the checkbox if you want to destroy the infrastructure')
       booleanParam(name: 'existingvpc', defaultValue: true, description: 'Select the checkbox if you want to use existing vpc')        
        string(name: 'vmname', defaultValue: 'demovm', description: '')
        string(name: 'rgname', defaultValue: 'rg-demo-vm', description: '')
        string(name: 'location', defaultValue: 'eastus', description: '')
        string(name: 'adminuser', defaultValue: 'Standard_D2_v2', description: '')
        string(name: 'adminpassword', defaultValue: 'P@ssW0rd', description: '')
        string(name: 'vmsize', defaultValue: 'Standard_D2_v2', description: '')
        string(name: 'cloud', defaultValue: 'azure', description: '')
        string(name: 'vmname', defaultValue: 'demo-vm', description: '')
        string(name: 'zone', defaultValue: 'Dev', description: '')
        string(name: 'machine_type', defaultValue: 'demo', description: '')
        
    }
    stages {
        stage('Git checkout') { 
            steps{
                sh 'whoami'
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/aliarslangit/terraform-azure-jenkins.git'
        }
        }
             stage('Installing Azure Modules') {
            steps {
                    sh 'sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
                    withCredentials([azureServicePrincipal('azcli')]) {
                    sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
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
        stage('Terraform Initialization') { 
            steps{
                   sh 'terraform init'
    }
        }
        stage('Check Terraform plan') { 
            steps {

               sh 'terraform plan -var clustername=$clustername -var rgname=$rgname -var location=$location -var nodesize=$nodesize -var mincount=$mincount -var maxcount=$maxcount -var dnsprefix=$dnsprefix -var owner=$owner -var environment=$environment'
              //   sh 'terraform plan'
     
            }
        }
        stage('Apply the terraform code') {
            steps{
         
             //   sh 'terraform apply' 
                
            sh 'terraform apply -var clustername=$clustername -var rgname=$rgname -var location=$location -var nodesize=$nodesize -var mincount=$mincount -var maxcount=$maxcount -var dnsprefix=$dnsprefix -var owner=$owner -var environment=$environment -auto-approve'   
                  
            }
        }  
    
 }

 }
