resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key # note: each.key and each.value are the same for a set
}

# nota: each.key e each.value são iguais para um conjunto