# terraform-aurora-alarms
Terraform module to automate creating Aurora Cluster alarms

## Example usage
```terraform
module "sqs-alarms" {
  source       = "github.com/TourRadar/terraform-aurora-alarms"
  cluster_identifier     = "cluster-name"
  actions      = ["snsarn etc"]
  alarm_prefix = "MyAlarmPrefix"
  tags = {
    Project = "SomeProject"
  }
}
```
