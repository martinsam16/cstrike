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
      "START_MAP"           = "de_aztec"
      "SERVER_NAME"         = "Counter-Strike 1.6 Server"
      "MAXPLAYERS"          = 32
      "START_MONEY"         = 1200
      "BUY_TIME"            = 0.25
      "FRIENDLY_FIRE"       = 1
      "MAP_AUTOKICK"        = 1
      "TIMELIMIT"           = 15
      "MAP_MAXROUNDS"       = 5
      "ROUNDTIME"           = 5
      "WINLIMIT"            = 5
      "MAP_VOTE_RATIO"      = 0.6
      "MAP_FREEZETIME"      = 1
      "ADMIN_STEAM"         = "0:1:1234566"
      "MAP_AUTOTEAMBALANCE" = 1
      "USE_VOTEMAP"         = "y"
      "ADMIN_STEAM"         = "martinsam"
      "RCON_PASSWORD"       = "123456789"
      #"SERVER_PASSWORD"     = "abcdefghijk"
    }
  }

  tags = {
    environment = "gaming"
  }
}
