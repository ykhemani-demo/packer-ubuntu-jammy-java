# packer-ubuntu-jammy-java

This repo provides a [HashiCorp](https://hashicorp.com) [Packer](https://packer.io) template that builds off of [packer-ubuntu-jammy](https://github.com/ykhemani-demo/packer-ubuntu-jammy), adding java related packages and registering the resulting machine image with HCP Packer.

## Usage

### Prerequisites

#### Ubuntu Jammy Golden Image

As mentioned above, this Packer template builds off of [packer-ubuntu-jammy](https://github.com/ykhemani-demo/packer-ubuntu-jammy). Build and register images from that Packer template if you haven't already done so.

#### Software

This Packer template has been tested with the following software on a Mac running macOS on Apple Silicon.

* [Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli) version 1.11.2
* [Ansible](https://www.ansible.com/) version 2.17.2.

For the Ansible provisioner, please add the following to your `.ansible.cfg` file:

```
[ssh_connection]
transfer_method = smart
```

#### Cloud Credentials

For provisioning to AWS, you will need AWS clould credentials. Set these as environment variables:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_SESSION_TOKEN` # if needed for your AWS account

For registering the image with the HCP Packer Registry, you will need HCP cloud credentials. Set these as environment variables as follows:

* `HCP_CLIENT_ID`
* `HCP_CLIENT_SECRET`

#### Packer Variables

Set the values for Packer variables. See [example.pkrvars.hcl](example.pkrvars.hcl) for an example.

### Running Packer

#### Initialize Packer

```
packer init -var-file=<variables file> .
```

#### Check and correct formatting of the Packer configuration

```
packer fmt -var-file=<variables file> .
```

#### Validate the Packer configuration

```
packer validate -var-file=<variables file> .
```

#### Build the machine image(s)

```
packer build -var-file=<variables file> .
```

---
