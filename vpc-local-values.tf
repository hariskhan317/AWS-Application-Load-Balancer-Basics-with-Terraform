locals {
    owners = var.business_division
    environment = var.enviroment
    name = "${var.business_division}-${var.enviroment}"
    comman_tags = {
        owners = local.owners
        environment = local.environment
    }
}