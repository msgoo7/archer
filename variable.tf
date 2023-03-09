variable "profile" {
  description = "The AWS authentication profile"
  type        = string
  default     = "mohit"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment for the app"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Name of the project"
  type        = string
  default     = "project-archer-01"
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {
    "managed_by"  = "Terraform"
    "application" = "Archer"
  }
}

variable "subnet1" {
  description = "subnets"
  type        = string
  default     = "subnet-0e114dbee943d87fc"
}

variable "subnet2" {
  description = "subnets"
  type        = string
  default     = "subnet-0a44dc2ea5fe1fd39"
}

variable "subnet3" {
  description = "subnets"
  type        = string
  default     = "subnet-0e14f9bd5a7df05ee"
}

variable "subnet4" {
  description = "subnets"
  type        = string
  default     = "subnet-071b100eda39a47bb"
}

variable "subnet5" {
  description = "subnets"
  type        = string
  default     = "subnet-0c440a8bf360a0543"
}

variable "subnet6" {
  description = "subnets"
  type        = string
  default     = "subnet-027a522dcaac57f4c"
}

variable "engine" {
  description = "Name of the Engine"
  type        = string
  default     = "redis"
}

variable "engine_version" {
  description = "Engine Version"
  type        = string
  default     = "7.0"
}

variable "node_type" {
  description = "instance type of node"
  type        = string
  default     = "cache.t3.micro"
}

variable "nodes" {
  description = "number of nodes"
  type        = string
  default     = "3"
}

variable "parameter_group_name" {
  description = "parameter group name"
  type        = string
  default     = "default.redis7.cluster.on"
}

variable "transit_encryption" {
  description = "transit encryption"
  type        = string
  default     = "false"
}

variable "at_rest_encryption" {
  description = "encryption at rest"
  type        = string
  default     = "false"
}


variable "port" {
  description = "port number of redis"
  type        = string
  default     = "6379"
}

variable "replicas_per_node_group" {
  description = "Enter the number of replicas for each shard, from 0 to 5"
  type        = string
  default     = "1"
}

variable "sg_id" {
  description = "security group id"
  type        = string
  default     = "sg-007ec033e4cd43780"
}
