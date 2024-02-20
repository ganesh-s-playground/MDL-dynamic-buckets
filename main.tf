locals {
  bucket_names = csvdecode(file("${path.module}/buckets.csv"))
}

resource "google_storage_bucket" "buckets" {

  count         = length(local.bucket_names)
  name          = local.bucket_names[count.index]["name"]
  location      = local.bucket_names[count.index]["location"]
  storage_class = local.bucket_names[count.index]["storage_class"]
  force_destroy = true
}

