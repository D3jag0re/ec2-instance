variable "do_spaces_access_key" {
  description = "The access key for DigitalOcean Spaces."
  type        = string
  sensitive   = true
  default     = "tmp"
}

variable "do_spaces_secret_key" {
  description = "The secret key for DigitalOcean Spaces."
  type        = string
  sensitive   = true
  default     = "tmp"
}


variable "aws_access_key_id" {
  description = "The secret key for AWS."
  type        = string
  sensitive   = true
}


variable "aws_secret_access_key" {
  description = "The secret key for AWS."
  type        = string
  sensitive   = true
}
