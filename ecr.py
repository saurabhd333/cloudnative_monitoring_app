import boto3

ecr_client = boto3.client('ecr')

repository_name = "my-cloud-native-repo"
response = ecr_client.create_repository(repositoryName=repository_name)

repository_uri = response['repository']['repositoryUri']
print(repository_uri)

# Did not run in first attempt due to outdated boto3 version
# Used below commands to upgrade
# pip install boto3 --upgrade
# pip install awscli --upgrade