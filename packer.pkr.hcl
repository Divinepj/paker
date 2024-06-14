packer {
    required plugins {
        amazon = {
            version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
        }
    }
}

source "amazon-ebs" "ubuntu" {
    access_key = "[access_key_from_aws]"
    secret_key = "[secret_key_from_aws]"
    ami_name = "adebayo_first_ami"
    Instance_type = "t2.micro"
    region = "us-east-1"
    source_ami = "ami-02b35a5ty2w54e15s545"
    ssh_username = "ubuntu"
}

build {
    name = "my-first-build"
    sources = "source.amazon-ebs.ubuntu"

    provisioner "shell" {
        inline = [
            "sudo apt-get update",
            "sudo apt-get install nginx",
            "sudo systemctl enable nginx",
            "sudo systemctl start nginx",
            "sudo ufw allow proto tcp from any to any port 22,80,443",
            "echo 'y' | sudo ufw enable"
        ]
    }

    post-processor "vagrant" {}
    post-processor "compress" {}
}
