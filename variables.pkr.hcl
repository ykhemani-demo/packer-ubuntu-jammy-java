################################################################################
# AWS Specific

variable "aws_instance_type" {
  type        = string
  description = "Instance on which to build image."
  default     = "t2.micro"
}

variable "encrypt_boot" {
  type        = bool
  description = "Encrypt boot volume?"
  default     = false
}

variable "aws_kms_key_id" {
  type        = string
  description = "ARN for KMS Key ID to use for encrypting volume."
  default     = ""
}

variable "amazon_communicator" {
  type        = string
  description = "Communicator for Amazon builder."
  default     = "ssh"
}

variable "amazon_ssh_username" {
  type        = string
  description = "SSH username for Amazon builder."
  default     = "ubuntu"
  #default     = "ec2-user"
}

variable "amazon_image_name" {
  type        = string
  description = "Value to use for naming Amazon image."
  default     = "Ubuntu Jammy (22.04) Java Image"
}

################################################################################
variable "prefix" {
  type        = string
  description = "Prefix for naming image"
  default     = "ubuntu-jammy-java"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "owner" {
  type        = string
  description = "The person or group who launched these resources.  Must be a valid HashiCorp email prefix."
}

################################################################################
# HCP Packer

variable "bucket_name" {
  type        = string
  description = "The image name when published to the HCP Packer registry. Will be overwritten if HCP_PACKER_BUCKET_NAME is set."
}

variable "bucket_description" {
  type        = string
  description = "The image description. Useful to provide a summary about the image. The description will appear at the image's main page and will be updated whenever it is changed and a new build is pushed to the HCP Packer registry. Should contain a maximum of 255 characters."
  default     = ""
}
