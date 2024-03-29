# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "ca_public_key_file_path" {
  type    = string
  default = "/root/hashicorp-packer/aws-vault-ami/private-tls-cert/ca.crt.pem"
  description = "Write the PEM-encoded CA certificate public key to this path (e.g. /etc/tls/ca.crt.pem)."
}

variable "public_key_file_path" {
  type    = string
  default = "/root/hashicorp-packer/aws-vault-ami/private-tls-cert/vault.crt.pem"
  description = "Write the PEM-encoded certificate public key to this path (e.g. /etc/tls/vault.crt.pem)."
}

variable "private_key_file_path" {
  type    = string
  default = "/root/hashicorp-packer/aws-vault-ami/private-tls-cert/vault.key.pem"
  description = "Write the PEM-encoded certificate private key to this path (e.g. /etc/tls/vault.key.pem)."
}

variable "owner" {
  type    = string
  default = "root"
  description = "The OS user who should be given ownership over the certificate files."
}

variable "organization_name" {
  type    = string
  default = "Organization"
  description = "The name of the organization to associate with the certificates (e.g. Acme Co)."
}

variable "ca_common_name" {
  type    = string
  default = "cert"
  description = "The common name to use in the subject of the CA certificate (e.g. acme.co cert)."
}

variable "common_name" {
  type    = string
  default = "cert"
  description = "The common name to use in the subject of the certificate (e.g. acme.co cert)."
}

variable "dns_names" {
  type        = list(string)
  default = ["vault.service.consul"]
  description = "List of DNS names for which the certificate will be valid (e.g. vault.service.consul, foo.example.com)."
}

variable "ip_addresses" {
  type        = list(string)
  default = ["127.0.0.1"]
  description = "List of IP addresses for which the certificate will be valid (e.g. 127.0.0.1)."
}

variable "validity_period_hours" {
  type    = string
  default = 3600
  description = "The number of hours after initial issuing that the certificate will become invalid."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ca_allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the CA certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type        = list(string)

  default = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
  ]
}

variable "allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the issued certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type        = list(string)

  default = [
    "key_encipherment",
    "digital_signature",
  ]
}

variable "permissions" {
  description = "The Unix file permission to assign to the cert files (e.g. 0600)."
  default     = "0600"
}

variable "private_key_algorithm" {
  description = "The name of the algorithm to use for private keys. Must be one of: RSA or ECDSA."
  default     = "RSA"
}

variable "private_key_ecdsa_curve" {
  description = "The name of the elliptic curve to use. Should only be used if var.private_key_algorithm is ECDSA. Must be one of P224, P256, P384 or P521."
  default     = "P256"
}

variable "private_key_rsa_bits" {
  description = "The size of the generated RSA key in bits. Should only be used if var.private_key_algorithm is RSA."
  default     = "2048"
}

