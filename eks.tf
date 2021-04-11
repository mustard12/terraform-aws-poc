module "eks" {
  source           = "terraform-aws-modules/eks/aws"
  cluster_name     = "csaavedra-gitops-eks"
  cluster_version  = "1.19"
  subnets          = module.vpc.public_subnets
  write_kubeconfig = "false"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  vpc_id = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type    = "m4.large"
      root_volume_type = "gp2"
      asg_max_size     = 5
      asg_min_size     = 1
      tags = [{
        key                 = "Terraform"
        value               = "true"
        propagate_at_launch = true
      }]
    }
  ]
}

output "env-dynamic-url" {
  value = module.eks.cluster_endpoint
}
