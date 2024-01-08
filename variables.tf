variable "custom_tags_read_env" {
  type = map(string)
  default = {}
}

variable "custom_tags_write_env" {
  type = map(string)
  default = {}
}

variable "read_env" {
  type = string
  description = "Read environment on which the private endpoint/data source should be pointing to"
}

variable "write_env" {
  type = string
  description = "Write environment on which the private endpoint/data source should be pointing to"
}

variable "disaster_recovery" {
  type = bool
  default = false
  description = "Whether to query/create private endpoints on the disaster recovery environment"
}

variable "project" {
  type = string
  description = "Project trigram to query/create the storage private endpoints upon"
}
