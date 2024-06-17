resource "azurerm_virtual_machine_extension" "install_docker" {
  name                 = "install-docker"
  virtual_machine_id   = azurerm_linux_virtual_machine.my_terraform_vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.1"

  settings = <<SETTINGS
    {
        "commandToExecute": "curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh ./get-docker.sh"
    }
SETTINGS
}
