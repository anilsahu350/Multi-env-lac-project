variable "env" {
  description = "This is env variable like dev,stg,prod"
  type = string
}

variable "instance_type" {
  description = "This is Instance type like t2.micro, t2.medium etc.."
  type = string
}

variable "instance_count" {
  description = "This contain the instance count for the every enviroment"
  type = number
}

variable "ami_id" {
  description = "This is ami image id for instance"
  type = string
}

variable "instance_volume_size" {
  description = "This contain the size of every instance should be"
  type = number
}

