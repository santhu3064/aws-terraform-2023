

output "arn" {
    value = aws_vpc.aws_vpc.arn
    description = "arn of the aws vpc"
}

output "id" {
    value = aws_vpc.aws_vpc.id
    description = "id  of the vpc"
}

output "cidr_block" {
    value = aws_vpc.aws_vpc.cidr_block
    description = "CIDR block of the vpc"
}