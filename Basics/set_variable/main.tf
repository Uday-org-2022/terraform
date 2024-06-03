/*
Set is a collection type that holds an unordered list of unique elements.
It is used to represent collections where duplicate values are not allowed.
*/

resource "aws_security_group" "main" {
    name = "demo-sg"
    description = "Example security group"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = var.allowed-cidrs
    }  
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}