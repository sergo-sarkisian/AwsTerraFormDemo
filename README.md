# AwsTerraFormDemo

 Infra provisioning in AWS  will be done using  TerraForm.
 
 Software installation and configuration will be done using Ansible .

 Infra is provisioned with AWS IAM user having Admin privileges. 
 
 To provision AWS instances , VPC , subnets and SEC groups run : 
 
 `terraform apply`
 The only prerequisite is to have keypairs generated and IAM user created from WEB interface, rest of the setup in AWS is automated.
 To provision software on instances run the playbook :
 
  1.`ansible-playbook initialize.yaml`
  
  2.`ansible-playbook playbook.yaml`
  
