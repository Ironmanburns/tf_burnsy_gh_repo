resource "github_repository" "mynewrepo" {
  name        = "created-from-template"
  description = "My awesome codebase"
  archive_on_destroy   = true
  visibility = "public"

  template {
    owner                = "ironmanburns"
    repository           = "burnsy-github-template"
    include_all_branches = true
    
  }
}

resource "github_branch_protection" "example" {
  #repository_id = github_repository.example.node_id
  # also accepts repository name
  repository_id  = github_repository.mynewrepo.name

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true


  required_status_checks {
    strict   = false
    contexts = ["ci/test"]
  }
}