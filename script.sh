#!/bin/bash

function prepare_bastion() {
    sudo yum update -y

    if ! command -v ansible &> /dev/null; then
        sudo yum install -y ansible
    fi

    sudo yum install -y yum-utils

    if ! command -v terraform &> /dev/null; then
        sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
        sudo yum install -y terraform
    fi
}

function create_infra() {
    cd terraform
    terraform init
    terraform apply -auto-approve
}


prepare_bastion
create_infra
