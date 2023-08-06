provider "github" {
  token = " "
  owner = " "
}


resource "github_repository_file" "main_code_owner" {
  repository = "github-terraform-task-gigabyte11"
  branch     = "main"
  file       = ".github/CODEOWNERS"
  content    = "/* @softservedata"
}

variable "pull_request_template_content" {
  type    = string
  default = <<EOF
Describe your changes
Issue ticket number and link
Checklist before requesting a review
[ ] I have performed a self-review of my code
[ ] If it is a core feature, I have added thorough tests
[ ] Do we need to implement analytics?
[ ] Will this be part of a product update? If yes, please write one phrase about this update
EOF
}

resource "github_repository_file" "pull_request_template" {
  repository          = "github-terraform-task-Taras-Olkhovyk"
  branch              = "main"
  file                = ".github/pull_request_template.md"
  content             = var.pull_request_template_content
  overwrite_on_create = true
}

resource "github_repository_deploy_key" "deploy_key" {
  repository = "github-terraform-task-gigabyte11"
  title      = "DEPLOY_KEY"
  key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC5jSD/MB4QZOJBZ/ZARo5QgTu3/5o97hTIXsuQfCYB3hrsc6vcF70JHUhw/GG1yVY8tE1JsuFr9HdMKLf+fUn+DhZzSUCY0DOtS8ocMzb5QcMlt8IA85ZPvexk332zT21BzKcXe7IlV2KVKysQoS4feReYnWfOO9APSbbe0dWM/G21xXr2VTls89v2Vwu/KAkBqn2eSvs8= taras_olkhovyk@HP-ProBook-650-G1"
  read_only  = true
}

resource "github_repository_webhook" "discord_webhook" {
  repository = "github-terraform-task-gigabyte11"
  configuration {
    url          = "https://discord.com/api/webhooks/1132373900194480210/fTlnDrLo2znUGfY_nZJ6knTsl_fSndphfz8lNoHXX_16-SUa6VdheDmoXvNj0Qgpn105"
    content_type = "json"
  }
  events = ["pull_request"]
  active = true
}

resource "github_actions_secret" "pat" {
  repository      = "github-terraform-task-gigabyte11"
  secret_name     = "PAT"
  plaintext_value = "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"
}
