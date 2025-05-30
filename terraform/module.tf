module "aws_iam_role" {
source = "./iam.tf"  
}
module "apigateway" {
    source = "./apigateway.tf" 
}
module "lambda" {
    source = "./lambda"
}
module "ecr" {
    source = "./ecr.tf"
}
