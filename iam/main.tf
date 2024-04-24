resource "aws_iam_user" "admin-user" {
  name = "ahmed"
  tags = {
    Description = "admins"
  }
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = file("policy_file.json")
}

resource "aws_iam_policy_attachment" "ahmed_admin_access" {
  name       = "example-attach"
  users      = [aws_iam_user.admin-user.name]
  policy_arn = aws_iam_policy.adminUser.arn
}

