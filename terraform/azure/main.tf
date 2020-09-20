provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "cstrike" {
  name     = "cstrike"
  location = "${var.location}"
}


resource "azurerm_container_group" "cstrike" {
  name                = "cstrike"
  location            = azurerm_resource_group.cstrike.location
  resource_group_name = azurerm_resource_group.cstrike.name
  ip_address_type     = "public"
  dns_name_label      = "cstrike"
  os_type             = "linux"

  container {
    name   = "counter-strike"
    image  = "malditoidealismo/counter-strike:latest"
    cpu    = "${var.cpu}"
    memory = "${var.ram}"

    ports {
      port     = 26900
      protocol = "UDP"
    }
    ports {
      port     = 27020
      protocol = "UDP"
    }
    ports {
      port     = 27015
      protocol = "UDP"
    }

    environment_variables = {
      "START_MAP"      = "de_cfport2"
      "MAXPLAYERS"     = 32
      "START_MONEY"    = 800
      "BUY_TIME"       = 0.25
      "FRIENDLY_FIRE"  = 1
      "ROUNDTIME"      = 3
      "TIMELIMIT"      = 15
      "WINLIMIT"       = 5
      "MAP_VOTE_RATIO" = 0.6
    }
  }

  tags = {
    environment = "gaming"
  }
}
