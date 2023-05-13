locals {
  name = var.env != "" ? "${var.component_name}-${var.env}" : var.component_name
  db-commands=[
  "rm -rf roboshop-shell",
  "git clone https://github.com/geethikagrace/roboshop-shell",
"cd roboshop-shell",
"sudo bash ${var.component_name}.sh ${var.password}"
]
  app_commands=[
    "sudo labauto ansible"
    "ansible-pull -i localhost, -u https://github.com/geethikagrace/roboshop-ansible roboshop.yml -e  env=${var.env} -e role_name=${var.component_name}"

  ]
}
