// Generics Variables

// Variable for aws
variable "awsRegion" {
    type        = string
    default     = "us-east-2"  
    description = "aws Region"
}
// Variable for Enviroment
variable "enviroment" {
    type    = string
    default = "dev"   
}
// Variable for Business Division
variable "business_division" {
    type    = string
    default = "SAP"   
}
