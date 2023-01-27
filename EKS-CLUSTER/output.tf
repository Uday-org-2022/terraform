output "cluster-id" {
  value = aws_eks_cluster.k8s-cluster.id
}

output "cluster-arn" {
  value = aws_eks_cluster.k8s-cluster.arn
}

output "cluster-status" {
  value = aws_eks_cluster.k8s-cluster.status
}

output "cluster-endpoint" {
  value = aws_eks_cluster.k8s-cluster.endpoint
}

output "cluster-platformversion" {
  value = aws_eks_cluster.k8s-cluster.platform_version
}

output "cluster-name" {
  value = aws_eks_cluster.k8s-cluster.name
}

output "cluster-node-k8s-cluste-name" {
  value = aws_eks_node_group.eks-node-group.cluster_name
}

output "cluster-node-subnets" {
  value = aws_eks_node_group.eks-node-group.subnet_ids
}

output "cluster-node-role" {
  value = aws_eks_node_group.eks-node-group.node_role_arn
}