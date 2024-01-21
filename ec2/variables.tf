variable "name" {
  description = "name of the instance"
  type        = string
  default     = null
}
variable "ami" {
  type        = string
  default     = null
  description = "AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template."
}
variable "instance_type" {
  type        = string
  default     = null
  description = "The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance."
}
variable "subnet_id" {
  type        = string
  default     = null
  description = "VPC Subnet ID to launch in."
}
variable "availability_zone" {
  type        = string
  default     = null
  description = "AZ to start the instance in."
}
variable "iam_instance_profile" {
  type        = string
  default     = null
  description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation(https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2.html#roles-usingrole-ec2instance-permissions), notably iam:PassRole."
}
variable "key_name" {
  type        = string
  default     = null
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
}
variable "get_password_data" {
  type        = bool
  default     = null
  description = "If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information."
}
variable "vpc_security_group_ids" {
  type        = list(string)
  default     = null
  description = "A list of security group IDs to associate with. (VPC only)"
}
variable "private_ip" {
  type        = string
  default     = null
  description = "Private IP address to associate with the instance in a VPC."
}
variable "associate_public_ip_address" {
  type        = bool
  default     = null
  description = "Whether to associate a public IP address with an instance in a VPC."
}
variable "instance_initiated_shutdown_behavior" {
  type        = string
  default     = null
  description = "Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information."
}
variable "user_data" {
  type        = string
  default     = null
  description = "User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
}
variable "user_data_base64" {
  type        = string
  default     = null
  description = ") Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
}
variable "disable_api_termination" {
  type        = bool
  default     = null
  description = "If true, enables EC2 Instance Termination Protection."
}
variable "hibernation" {
  type        = bool
  default     = null
  description = "If true, the launched EC2 instance will support hibernation."
}
variable "host_id" {
  type        = string
  default     = null
  description = "If true, the launched EC2 instance will support hibernation."
}
variable "monitoring" {
  type        = bool
  default     = null
  description = "If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)"
}
variable "placement_group" {
  type        = string
  default     = null
  description = "Placement Group to start the instance in."
}
variable "placement_partition_number" {
  type        = number
  default     = null
  description = "The number of the partition the instance is in. Valid only if the aws_placement_group resource's strategy argument is set to 'partition'."
}
variable "secondary_private_ips" {
  type        = list(string)
  default     = null
  description = "A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e., referenced in a network_interface block. Refer to the Elastic network interfaces documentation to see the maximum number of private IP addresses allowed per instance type."
}
variable "tenancy" {
  type        = string
  default     = null
  description = "Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command."
}
variable "tags" {
  type        = map(any)
  default     = null
  description = "A map of tags to assign to the instance."
}
variable "volume_tags" {
  type        = map(any)
  default     = null
  description = "A map of tags to assign, at instance-creation time, to root and EBS volumes."
}
variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(any)
  default     = []
  validation {
    condition = length(var.root_block_device) <= 1
    error_message = "You can only attach one root block device per ec2 instance."
  }
}
variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}
variable "metadata_options" {
  description = "Customize the metadata options of the instance"
  type        = map(any)
  default     = {}
}
variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(map(string))
  default     = []
}
variable "launch_template" {
  description = "Specifies a Launch Template to configure the instance. Parameters configured on this resource will override the corresponding parameters in the Launch Template"
  type        = map(string)
  default     = null
}
variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  type        = bool
  default     = true
}
variable "timeouts" {
  description = "Define maximum timeout for creating, updating, and deleting EC2 instance resources"
  type        = map(any)
  default     = {}
}
