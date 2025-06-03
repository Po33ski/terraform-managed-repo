output "repository_url" {
  value       = github_repository.example.html_url
  description = "URL of the created repository"
}

# output "repository_visibility" {
#   value       = local.visibility
#   description = "Visibility of the created repository"
# }