resource "aws_instance" "web" {
  ami           = "ami-0f1dcc636b69a6438"
  instance_type = "t2.micro"
  tags = {
    name = "terrafrom-pipeline-poc"
  }
  
}
resource "aws_instance" "web_2" {
  ami           = "ami-0f1dcc636b69a6438" 
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-pipeline-poc-2"
  }
}

