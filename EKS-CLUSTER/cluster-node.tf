resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.k8s-cluster.name
  node_group_name = var.node-group
  node_role_arn   = aws_iam_role.eks-cluster-node-policy.arn
  subnet_ids      = [aws_subnet.public1.id, aws_subnet.private1.id, aws_subnet.public2.id, aws_subnet.private2.id]

  ami_type       = var.ami_type
  disk_size      = var.disk_size
  instance_types = var.int-type

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 2
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role.eks-cluster-node-policy,
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_eks_cluster.k8s-cluster
  ]

}