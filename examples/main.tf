locals {
  tags = {
    project = "important-project"
  }

  # awscc modules prefer lists to maps
  tags_list = [for key, value in local.tags : { key = key, value = value }]
}

module "first_set_independent_flows" {
  source                  = "./.."
  enable_contact_instance = true
  connect_instance_arn    = var.connect_instance_arn

  flows = {
    "Flow - Interruptible Queue" = {
      type              = "CUSTOMER_QUEUE"
      path_to_json_file = "flows/interruptable-queue-flow.json"
      variables_map = {
        wait_music_file_name = "CustomerGreetingMusic"
        wait_music_arn       = "prompts-arn-from-aws-connect-resources"
      }
    }
  }

  tags = local.tags_list
}

module "second_set_dependent_flows" {
  source                  = "./.."
  enable_contact_instance = true
  connect_instance_arn    = var.connect_instance_arn

  flows = {
    "General Flow" = {
      type              = "CONTACT_FLOW"
      path_to_json_file = "flows/general-flow.json"
      variables_map = {
        # JSON will contain placeholders, like {flow_arn_interruptible_queue} - dependency on the 1st set of flows
        flow_arn_interruptible_queue  = module.first_set_independent_flows.flows["Flow - Interruptible Queue"].arn
        flow_name_interruptible_queue = "Flow - Interruptible Queue"
      }
    }
  }

  depends_on = [module.first_set_independent_flows]
  tags       = local.tags_list
}