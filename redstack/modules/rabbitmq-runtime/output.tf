output "password" {
  description = "Admin Password"
  value       = random_password.admin_password.result
}
