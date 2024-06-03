variable "tuple_vars" {
  type    = tuple([string, string, bool])
  default = ["10.0.0.0/16", "default", true]
}