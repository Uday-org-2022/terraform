# Creating the EKS cluster
resource "aws_eks_cluster" "k8s-cluster" {
  name     = var.clusrer_name
  role_arn = aws_iam_role.eks-cluster-policy.arn
  version  = var.k8s-version
  # Adding VPC Configuration

  vpc_config {
    security_group_ids      = [aws_security_group.eks-cluster-sg.id]
    subnet_ids              = [aws_subnet.public1.id, aws_subnet.private1.id, aws_subnet.public2.id, aws_subnet.private2.id]
    endpoint_private_access = var.true
    endpoint_public_access  = var.true
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-AmazonEKSServicePolicy,
    aws_vpc.vpc,
    aws_security_group.eks-cluster-sg,
    aws_subnet.public1,
    aws_subnet.public2,
    aws_subnet.private1,
    aws_subnet.private2
  ]
}
#adds-ons
/**resource "aws_eks_addon" "kube-proxy" {
  cluster_name      = aws_eks_cluster.k8s-cluster.name
  addon_name        = "kube-proxy"
  addon_version     = "v1.24.7-eksbuild.2"
  resolve_conflicts = "OVERWRITE"
  depends_on = [
    aws_eks_cluster.k8s-cluster
  ]
}**/