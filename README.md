# Connect Flows Module

This module is responsible for deploying contact flows which depend on prompts and queues.

## Resources

- `awscc_connect_contact_flow`

## Prerequisites

None

## Dependencies

The following module(s) must be deployed first:

* [aws-connect-instance](https://github.com/alladove/aws-connect-instance)

Other possible dependencies:

* [aws-connect-resources](https://github.com/alladove/aws-connect-resources) - flows may use prompts
* [aws-connect-flows](https://github.com/alladove/aws-connect-flows) - flows may depend on other flows