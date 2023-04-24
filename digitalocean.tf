variable "local_ssh_key_path" {}

resource "digitalocean_ssh_key" "terraform-tutorial-ssh-key" {
  name       = "Terraform Tutorial SSH Key"
  public_key = file(var.local_ssh_key_path)
}

resource "digitalocean_droplet" "terraform-tutorial-web" {
  image    = "ubuntu-22-10-x64"
  name     = "terraform-tutorial-web-1"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.terraform-tutorial-ssh-key.fingerprint]
}


variable "tutorial_domain_name" {}
resource "digitalocean_domain" "tutorial-domain-1" {
  name       = var.tutorial_domain_name
  ip_address = digitalocean_droplet.terraform-tutorial-web.ipv4_address
}