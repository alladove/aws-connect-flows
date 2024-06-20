locals {
  flows = var.enable_contact_instance ? var.flows : {}
}

resource "awscc_connect_contact_flow" "this" {
  for_each = local.flows

  instance_arn = var.connect_instance_arn
  name         = each.key
  description  = each.value.description
  type         = each.value.type
  content      = each.value.variables_map != null ? templatefile(each.value.path_to_json_file, each.value.variables_map) : file(each.value.path_to_json_file)
  state        = each.value.state
  tags         = each.value.tags != null ? concat(var.tags, each.value.tags) : var.tags
}