variable "command" {
  default = "echo 'Hello World'"
}

variable "commandJim" {
  default = "echo 'Hello Jim'"
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "${var.command}"
  }
  provisioner "local-exec" {
    command = "${var.commandJim}"
  }
}
