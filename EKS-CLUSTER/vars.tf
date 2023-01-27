#provider
variable "region" {
  type    = string
  default = "ap-south-1"
}

#Boolean
variable "true" {
  type    = bool
  default = true
}

variable "false" {
  type    = bool
  default = false
}

#vpcblock
variable "vpc-cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

#avaliabilityZone
variable "az1" {
  type    = string
  default = "ap-south-1a"
}

variable "az2" {
  type    = string
  default = "ap-south-1b"
}

#PublicSubnet01Block
variable "cidr-pub1" {
  type    = string
  default = "192.168.0.0/18"
}

#PublicSubnet02Block
variable "cidr-pub2" {
  type    = string
  default = "192.168.64.0/18"
}

#PublicSubnet02Block
variable "cidr-priv1" {
  type    = string
  default = "192.168.128.0/18"
}

#PublicSubnet02Block
variable "cidr-priv2" {
  type    = string
  default = "192.168.192.0/18"
}

#IAMROLE
variable "role-name" {
  type    = string
  default = "eks-cluster-policy"

}

#securityGroup
variable "sg-cluster-name" {
  type    = string
  default = "Amazon eks cluster security group"
}

variable "protocol" {
  type    = string
  default = "tcp"
}

#cluster
variable "clusrer_name" {
  type    = string
  default = "k8s-production"
}

variable "k8s-version" {
  type    = string
  default = "1.24"
}

variable "addon_name" {
  type    = string
  default = "kube-proxy"
}

variable "addon_version" {
  type    = string
  default = "v1.24.7-eksbuild.2"
}

variable "resolve_conflicts" {
  type    = string
  default = "OVERWRITE"
}

variable "role-node-name" {
  type    = string
  default = "EKS_NODE_POLICY"
}

#nodegroup
variable "node-group" {
  type    = string
  default = "pre-pod"
}

variable "int-type" {
  type    = list(string)
  default = ["t3.micro", "t3.medium"]
}

variable "ami_type" {
  type    = string
  default = "AL2_x86_64"
}

variable "disk_size" {
  type    = number
  default = "20"

}