variable "REGION" {
    default="us-west1"
}
variable "ZONE" {
    default="a"
}
variable "CREDENTIAL_FILE" {
    default="devopsprojectal-cb587af8774d.json"
}
variable "VM_USERNAME" {
    default="alep"
}

variable "PUBLIC_SUBNET_CDIR" {
    default="10.26.1.0/24"
}
variable "PRIVATE_SUBNET_CDIR" {
    default="10.26.2.0/24"
}


variable "PROJECT_ID" {
    default="devopsprojectal"
}

variable "VPC_NAME" {
     default="test-vpc"
}

variable "IMAGE" {
    default="debian-cloud/debian-9"
}

variable "SSH_PUB_KEY_FILEPATH" {
    default="~/.ssh/id_rsa.pub"
}

variable "SSH_PRIV_KEY_FILEPATH" {
    default="~/.ssh/id_rsa"
}

variable "BASTION_SSH_PRIV_KEY_FILEPATH" {
    default="~/.ssh/id_rsa"
}

variable "INSTANCE_NAME" {
    default="be-appserver"
}

variable "PRIVATE_SUBNET_REF" {}

variable "APPSERVERS_COUNT" {}
