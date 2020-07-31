variable "network_name" {
  type        = string
  description = "The name of the Docker network"
}

variable "subnet" {
  type        = string
  description = "Configuration of the custom IP scheme of the network type range Subnet"
}
