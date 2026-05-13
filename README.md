docker-compose build --no-cache

./run-terraform.sh init components=ec2

./run-terraform.sh plan components=ec2

./run-terraform.sh apply components=ec2

role/web identity/
# create the GitHub OIDC provider in AWS.
AWS Console → IAM → Identity providers
# Create provider:
Provider type: OpenID Connect
Provider URL: https://token.actions.githubusercontent.com
Audience: sts.amazonaws.com

# add inline policy so it can access s3 bucket
AWS Console → IAM → Roles → your GitHub role → Permissions → Add permissions → Create inline policy
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "TerraformStateBucketList",
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::tlp-jou-dev",
      "Condition": {
        "StringLike": {
          "s3:prefix": [
            "terraform/aws/*"
          ]
        }
      }
    },
    {
      "Sid": "TerraformStateObjectAccess",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "arn:aws:s3:::tlp-jou-dev/terraform/aws/*"
    }
  ]
}