terraform {
  backend "s3" {
    bucket = "automateitremotestate"
    key    = "automateitremotestatekey"
    region = "us-east-1"
  }
}
