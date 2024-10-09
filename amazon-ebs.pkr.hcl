locals {
  encrypted = var.encrypt_boot && var.aws_kms_key_id != "" ? "encrypted-" : ""
  timestamp = formatdate("YYYYMMDD-hhmmss", timestamp())
}

data "hcp-packer-artifact" "ubuntu-jammy-golden-image-us-east-1" {
  bucket_name  = "ubuntu-jammy-golden-image"
  channel_name = "prod"
  platform     = "aws"
  region       = "us-east-1"
}

data "hcp-packer-artifact" "ubuntu-jammy-golden-image-us-east-2" {
  bucket_name  = "ubuntu-jammy-golden-image"
  channel_name = "prod"
  platform     = "aws"
  region       = "us-east-2"
}

data "hcp-packer-artifact" "ubuntu-jammy-golden-image-us-west-1" {
  bucket_name  = "ubuntu-jammy-golden-image"
  channel_name = "prod"
  platform     = "aws"
  region       = "us-west-1"
}

data "hcp-packer-artifact" "ubuntu-jammy-golden-image-us-west-2" {
  bucket_name  = "ubuntu-jammy-golden-image"
  channel_name = "prod"
  platform     = "aws"
  region       = "us-west-2"
}

source "amazon-ebs" "ubuntu-java-us-east-1" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-east-1"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""
  source_ami    = data.hcp-packer-artifact.ubuntu-jammy-golden-image-us-east-1.external_identifier
  communicator  = var.amazon_communicator
  ssh_username  = var.amazon_ssh_username
  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}

source "amazon-ebs" "ubuntu-java-us-east-2" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-east-2"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""
  source_ami    = data.hcp-packer-artifact.ubuntu-jammy-golden-image-us-east-2.external_identifier
  communicator  = var.amazon_communicator
  ssh_username  = var.amazon_ssh_username
  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}

source "amazon-ebs" "ubuntu-java-us-west-1" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-west-1"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""
  source_ami    = data.hcp-packer-artifact.ubuntu-jammy-golden-image-us-west-1.external_identifier
  communicator  = var.amazon_communicator
  ssh_username  = var.amazon_ssh_username
  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}

source "amazon-ebs" "ubuntu-java-us-west-2" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-west-2"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""
  source_ami    = data.hcp-packer-artifact.ubuntu-jammy-golden-image-us-west-2.external_identifier
  communicator  = var.amazon_communicator
  ssh_username  = var.amazon_ssh_username
  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}
