provider "github" {
  token = " "
  owner = " "
}


resource "github_repository_collaborator" "a_repo_collaborator" {
  repository = "github-terraform-task-gigabyte11"
  username   = "softservedata"
  permission = "push"
}

resource "github_branch" "develop" {
  repository = "github-terraform-task-gigabyte11"
  branch     = "develop"
}

resource "github_branch_default" "develop" {
  repository = "github-terraform-task-gigabyte11"
  branch     = github_branch.develop.branch
}

resource "github_branch_protection" "main" {
  repository_id = "github-terraform-task-gigabyte11"
  pattern       = "main"

  required_pull_request_reviews {
    require_code_owner_reviews      = true
    required_approving_review_count = 0
  }
}

resource "github_branch_protection" "develop" {
  repository_id  = "github-terraform-task-gigabyte11"
  pattern        = "develop"
  enforce_admins = false
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = false
    required_approving_review_count = 2
  }
}
