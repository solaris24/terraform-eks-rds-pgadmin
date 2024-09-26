
---
# Set env1
```bash
export ENV=dev <!--{.center}-->
export REGION=us-east-2 <!--{.center}-->
```

---
# Init Local State
```yaml
terraform init -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars"
terraform plan -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars"
terraform apply -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars" --auto-approve
```
---
# Uncomment backend "s3" in provider.tf file
```yml
terraform init -backend-config="./enviroments/${ENV}/${REGION}/backend.tfvars"
terraform init -migrate-state -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars"
terraform init -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars"
terraform plan -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars"
terraform apply -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars" --auto-approve
terraform destroy -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars" --auto-approve
```

---
# Sometime is needed
```yml
terraform init -reconfigure -var-file="./enviroments/${ENV}/${REGION}/terraform.tfvars"
```

---
# Get the Kubectl context
```yml
aws eks update-kubeconfig --region=${REGION} --name=${ENV}-demo --profile=eks
```
---
# Checking access
```yml
SA_NAME=eks-pgadmin-sa-1 kubectl -n dev-pgadmin run tmp-shell --rm -i --tty --image=amazonlinux:latest --overrides '{"spec":{"serviceAccountName":"'$SA_NAME'"}}' -- sh
kubectl exec -it -n dev-pgadmin pod-identity-app-pod -- aws rds describe-db-instances
kubectl exec -it -n dev-pgadmin pod-identity-app-pod -- aws sts get-caller-identity --no-cli-pager# terraform-eks-rds-pgadmin
```