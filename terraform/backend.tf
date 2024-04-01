terraform {
  backend "s3" {
    #bucket name
    bucket = "github-avihu"
    #directory inside that bucket
    key = "terraform.tfstate"
    #region
    region = "eu-north-1"
  }
}
