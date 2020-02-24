import json
import os
from github import Github

def lambda_handler(event, context):

    g = Github(os.environ['github_token'])
    repo = g.get_repo("aduyko/test-lambda-github")
    pr = repo.create_pull(title="Testing lambda", body="Sample body text", head="ad-test", base="master")

    return {
        'statusCode': 200,
        'body': json.dumps(pr.id)
    }


