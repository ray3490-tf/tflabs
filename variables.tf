variable "vm_name" {
    type = string
    description = "This is the name of the virtual machine"
}

variable "admin_username" {
    type = string
    description = "This is the username of the virtual machine"
}

variable "vm_size" {
    type = string
    description = "this is the size of the machine"
    default = "Standard_B1s"  
}

variable "admin_password" {
    type = string
    description = "This is the admin password for the virtual machine"
    sensitive = true
}