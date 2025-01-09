resource "azurerm_resource_group" "rg-cli" {
  name     = "test-rg"
  location = "East US"
  tags = {
    "enviroment" = "dev"
  }
}

resource "azurerm_virtual_network" "vn-cli" {
  name                = "test-vn"
  resource_group_name = azurerm_resource_group.rg-cli.name
  location            = azurerm_resource_group.rg-cli.location
  address_space       = ["10.123.0.0/16"]

  tags = {
    enviroment = "dev"
  }
}

resource "azurerm_subnet" "subnet-cli" {
  name                 = "test-subnet"
  resource_group_name  = azurerm_resource_group.rg-cli.name
  virtual_network_name = azurerm_virtual_network.vn-cli.name
  address_prefixes     = ["10.123.1.0/24"]
}

resource "azurerm_network_security_group" "nsg-cli" {
  name                = "test-nsg"
  location            = azurerm_resource_group.rg-cli.location
  resource_group_name = azurerm_resource_group.rg-cli.name

  security_rule {
    name                       = "nsg-cli-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsga-cli" {
  subnet_id                 = azurerm_subnet.subnet-cli.id
  network_security_group_id = azurerm_network_security_group.nsg-cli.id
}

resource "azurerm_public_ip" "pub-ip-cli" {
  name                = "test-pub-ip"
  resource_group_name = azurerm_resource_group.rg-cli.name
  location            = azurerm_resource_group.rg-cli.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_interface" "nic-cli" {
  name                = "test-nic"
  location            = azurerm_resource_group.rg-cli.location
  resource_group_name = azurerm_resource_group.rg-cli.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet-cli.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pub-ip-cli.id
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_linux_virtual_machine" "vm-cli" {
  name                = "test-vm"
  resource_group_name = azurerm_resource_group.rg-cli.name
  location            = azurerm_resource_group.rg-cli.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic-cli.id,
  ]

  custom_data = filebase64("customdata.tpl")

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/azuressh.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}