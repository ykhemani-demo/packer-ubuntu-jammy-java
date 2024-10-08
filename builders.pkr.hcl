packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    # azure = {
    #   source  = "github.com/hashicorp/azure"
    #   version = "~> 2"
    # }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

build {
  hcp_packer_registry {
    bucket_name = var.bucket_name
    description = var.bucket_description

    bucket_labels = {
      "os" = "linux"
    }

    build_labels = {
      "build-time" = timestamp()
    }
  }

  sources = [
    "source.amazon-ebs.ubuntu-java-us-east-1",
    "source.amazon-ebs.ubuntu-java-us-east-2",
    "source.amazon-ebs.ubuntu-java-us-west-1",
    "source.amazon-ebs.ubuntu-java-us-west-2",
  ]

  provisioner "ansible" {
    playbook_file = "./playbook.yaml"
  }
}
