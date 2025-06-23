variable "custom_tags_read_env" {
  type        = map(string)
  description = "Custom tags to be matched for the read environment storage accounts."
  default     = {}
}

variable "custom_tags_write_env" {
  type        = map(string)
  description = "Custom tags to be matched for the write environment storage accounts."
  default     = {}
}

variable "disaster_recovery" {
  type        = bool
  default     = false
  description = "Whether to query on the disaster recovery environment."
}

variable "project" {
  type        = string
  description = "Project trigram to query the storage."
}

variable "read_env" {
  type        = string
  description = "Read environment on which the data source should be pointing to."
}

variable "write_env" {
  type        = string
  description = "Write environment on which the data source should be pointing to."
}
