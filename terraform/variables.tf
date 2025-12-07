variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "vockey"
}

variable "public_key_content" {
  description = "SSH public key content"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCx2pR8UorrFWK7anPAxIxL6QnYBpE9pl6++66lgrMevWI+ORoQf6yBbl7Sn1KNHjnYwmg/ygMSP9nUka/ix8KK9KuWX2BJSmMZvsUeJcTLcVxcNcpZyMtHRQN8aJIPFUnohGLy2XQMv16FwQdQyxYJtnxJT2I2y03LMN0LEb7OBmRojoF/MUZp8xyt2ICgkjrCwAv6Zv48QRPZ54+AwuC7fLYRr7dB0SS9cOF13JbRGPSKu0sZ80MVLPhY30hZwKcXgLKkUGFvg8xjpNWKdq5suZL4Va1hTzYz+Pd9zYW0Qse33komrEB/2RTW5aj++WGDO4b/5zBac9DcySt4fmu+fC+JVhOj2imhmJPLkCazrwW53fOZC99oBkqUTsr5KdLj6W715ke3OGrvMtfEcPjEV2CyaJ9qyP+orrryRLhQ+0fuQAZOnDy+4DqRUGVY4ajHLlVVb0lezzZwA1pzqVodQDKRIYRffUFvwbO6HIrSPN/2H3lM2Qo+9Q1mo2NOpUm+DB6JrqMNaxX2u7/tGdS9KrDO1286eSY9pOJiFg/umpMG9OorNsICVajE+uLZtWZm+s5cpaO6+BoQU4sx6jz9uWiSYhLeOXb1PJPB4cls99v2TwKN/RK1jFVz9SJZyr2Kv31x/mkZYwqM96s0b/p2YKt3LtprQSDFD2ca9GmXxw== sean1@sean"  
}
variable "public_key_path" {
  description = "Path to public SSH key file"
  type        = string
  default     = "~/.ssh/exercise_manager_key.pub"
}