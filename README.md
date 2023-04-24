# Simple Cloud Deployment on DigitalOcean using Terraform

This example shows a simple example to create an SSH Key, A Droplet (a VM) and a Domain pointing to that Droplet on
DigitalOcean using Terraform.

## How to use

Copy the file `_credentials.auto.tfvars.sample` and save it as `_credentials.auto.tfvars`. Then edit the file setting
the values that are required:

- The `digitalocean_token` must be a Token to use the DigitalOcean API.
- The `local_ssh_key_path` must be the full path of the SSH Public Key, on the server where the Terraform commands will
  be executed.
- The `tutorial_domain_name` must contain the domain you want your VM to have. Notice you must own the domain name, of
  course, and have it pointed to DigitalOcean for this to work.

Then, from this project's root folder, run the following commands:

**To initialize the Terraform project the first time**

```shell
terraform init
```

**To see the execution plan for Terraform based on the project files**

```shell
terraform plan
```

**To execute the plan for Terraform based on the project files**

```shell
terraform apply
```

Then type `yes` to confirm the execution.

## How to test the result

You can check your digitalocean account and see:

- A domain name was added to your networking area, with the name in the `tutorial_domain_name` variable.
- A droplet was added with the same properties defined in the `digitalocean.tf` file, and the domain name points to it.
- An ssh key was added with the name `Terraform Tutorial SSH Key`, with the contents of the file you defined in
  the `local_ssh_key_path` variable.

Now, you should be able to run this command from the machine where you ran Terraform (replacing `xxx` with the domain
name defined in the `tutorial_domain_name` variable) and access the new droplet via SSH:

```shell
ssh root@xxx
```

## To Destroy the applied changes

Run the command:

```shell
terraform destroy
```

And then type `yes` to confirm the action.