resource "aws_instance" "web" {
  ami           = "ami-0f1dcc636b69a6438"
  instance_type = "t2.micro"
  tags = {
    name = "terrafrom-pipeline-poc"
  }
  
}

resource "aws_iam_policy" "policies" {
  count  = length(var.policy_files)
  name   = "${basename(replace(var.policy_files[count.index], ".json", ""))}"
  policy = file(var.policy_files[count.index])
}

resource "aws_iam_role" "ec2_iam_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "policy_attachments" {
  count      = length(aws_iam_policy.policies)
  policy_arn = aws_iam_policy.policies[count.index].arn
  role       = aws_iam_role.ec2_iam_role.name
}
