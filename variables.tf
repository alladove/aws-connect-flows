variable "enable_contact_instance" {
  description = "Enable the creation of the AWS Connect instance."
  type        = bool
  default     = true
}

variable "connect_instance_arn" {
  description = "The ARN of the AWS Connect instance."
  type        = string
}

variable "flows" {
  description = "A map of flows."
  type = map(object({
    type : string # Example types: 'CONTACT_FLOW', 'CUSTOMER_QUEUE', 'CUSTOMER_HOLD', 'CUSTOMER_WHISPER', 'AGENT_HOLD', 'AGENT_WHISPER', 'OUTBOUND_WHISPER', 'AGENT_TRANSFER', 'QUEUE_TRANSFER'
    path_to_json_file : string
    variables_map : optional(map(any))
    description : optional(string)
    state : optional(string) # Example states: 'ACTIVE', 'ARCHIVED'
    tags : optional(list(object({
      key   = string
      value = string
    })))
  }))
  default = {}
}

# Other
variable "tags" {
  description = "A list of tags, where each tag is an object with a key and a value."
  type = list(object({
    key   = string
    value = string
  }))
  default = []
}
