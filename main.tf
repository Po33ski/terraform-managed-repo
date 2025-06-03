terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}


provider "aws" {
   region = var.regions[0]
}

# define rest of providers, each for the regions you specified, do not forget about the alias option that must be a string
# provider alias with us_west_2 region
provider "aws" {
  alias  = "us_west_2"
  region = var.regions[1]
}
