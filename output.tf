
output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "worker_node_role_arn" {
  value = aws_iam_role.node_role.arn
}

output "node_group_name" {
  value = aws_eks_node_group.workers.node_group_name
}
