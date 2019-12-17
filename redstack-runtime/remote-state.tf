terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "redstack"

    workspaces {
      name = "runtime-consul"
    }
  }
}
