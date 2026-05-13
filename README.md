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