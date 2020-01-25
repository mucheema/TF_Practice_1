resource "aws_key_pair" "tf-demo" {
  key_name   = "tf-demo"
  public_key = "${file("tf-demo.pub")}"
}

resource "aws_instance" "my-instance" {
  count         = var.instance_count
  ami           = lookup(var.ami, var.aws_region)
  instance_type = var.instance_type
  key_name      = "${aws_key_pair.tf-demo.key_name}"
  user_data     = "${file("install_httpd.sh")}"

  tags = {
    Name = "${element(var.instance_tags, count.index)}"
  }
}
# Display the public ip address for all instances. 
output "ip" {
  value = aws_instance.my-instance.*.public_ip
}