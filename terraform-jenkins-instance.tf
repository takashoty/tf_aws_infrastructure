resource "aws_instance" "web" {
  ami             = var.image_id
  instance_type   = var.instance_type
  key_name        = "jenkins-server"
  security_groups = [aws_security_group.jenkins_sg.name]
  user_data       = "${file("install_jenkins.sh")}"
  tags = {
    Name = "Jenkins"
  }
}