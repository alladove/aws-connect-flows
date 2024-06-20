output "flows" {
  value = var.enable_contact_instance ? {
    for idx, flow in awscc_connect_contact_flow.this :
    idx => {
      arn         = flow.contact_flow_arn
      description = flow.description
    }
  } : null
  description = "All flows with key, arn, and description."
}