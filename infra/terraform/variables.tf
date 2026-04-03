variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string

}

variable "pm_api_token_secret" {
  description = "Proxmox API Token Secret"
  type        = string
  sensitive   = true
}

variable "ci_user" {
  description = "Cloud-Init User"
  type        = string
}

variable "ci_password" {
  description = "Cloud-Init Password"
  type        = string
  sensitive   = true
}

variable "ci_ssh_public_key" {
  description = "Cloud-Init SSH Public Key"
  type        = string
}

variable "ci_ssh_private_key" {
  description = "Cloud-Init SSH Private Key"
  type        = string
}
