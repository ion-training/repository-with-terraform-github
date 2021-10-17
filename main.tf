terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.16.0"
    }
  }
}

provider "github" {
  token = var.token
}

resource "github_repository" "repository-with-terraform-github" {
  name        = "repo-from-terraform"
  description = "My awesome brilliant fantastic marvelous quick efficient"
  visibility = "public"
}