terraform {
  cloud {
    organization = "nhvanse"
    workspaces {
      name = "workspace-1"
    }
  }
}