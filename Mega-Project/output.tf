output "public_ip_address" {
  value = "${azurerm_linux_virtual_machine.vm-cli.name} : ${azurerm_linux_virtual_machine.vm-cli.public_ip_address}"
}