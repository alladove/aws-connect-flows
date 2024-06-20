output "flows" {
  description = "All outputs of the AWS Connect flows."
  value       = merge(module.first_set_independent_flows, module.second_set_dependent_flows)
}