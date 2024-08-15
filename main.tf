resource "aws_s3_bucket" "srishti" {
  bucket = var.bucketname

  tags = {
    Name        = "srishti"
  }
}


resource "aws_s3_bucket_ownership_controls" "srishti" {
  bucket = aws_s3_bucket.srishti.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "srishti" {
  bucket = aws_s3_bucket.srishti.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "srishti" {
  depends_on = [
  aws_s3_bucket_ownership_controls.srishti,
  aws_s3_bucket_public_access_block.srishti]

  bucket = aws_s3_bucket.srishti.id
  acl    = "public-read"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.srishti.id
  key    = "error.html"
  source = "error.html"
  acl    = "public-read"
  content_type="text/html"
}


resource "aws_s3_object" "yeahh" {
  bucket = aws_s3_bucket.srishti.id
  key    = "yeahh.jpg"
  source = "yeahh.jpg"
  acl    = "public-read"
}
resource "aws_s3_object" "oops" {
  bucket = aws_s3_bucket.srishti.id
  key    = "oops.jpg"
  source = "oops.jpg"
  acl    = "public-read"
}

resource "aws_s3_object" "lala" {
  bucket = aws_s3_bucket.srishti.id
  key    = "lala.jpg"
  source = "lala.jpg"
  acl    = "public-read"
}
  
resource "aws_s3_object" "aww" {
  bucket = aws_s3_bucket.srishti.id
  key    = "aww.jpg"
  source = "aww.jpg"
  acl    = "public-read"
}

resource "aws_s3_object" "huhh" {
  bucket = aws_s3_bucket.srishti.id
  key    = "huhh.jpg"
  source = "huhh.jpg"
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.srishti.id
  key    = "index.html"
  source = "index.html"
  acl    = "public-read"
  content_type="text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.srishti.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on =[aws_s3_bucket_acl.srishti]
}

/*
resource "aws_key_pair" "key" {
  key_name   = "key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
}

resource "aws_instance" "first" {
  ami                     = "ami-04a81a99f5ec58529"
  instance_type           = "t2.micro"
}*/