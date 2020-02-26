import boto3

def lambda_handler(event, context):
    sc = 200
    body = "Successfully Triggered a Lambda Function"

    #If we want to do the whole organization, something like this:
    #if event.repository.owner.login == "rearc":
    if event.has_key("repository") and event["repository"]["name"] == "test-lambda-github":
        if event["action"] in ["opened", "synchronize"]:
            pr = event["pull_request"]
            branch = pr["head"]["ref"]
            print(branch)
            #Figure out what needs to be done so codepipeline uses "branch" to build and trigger a test job?
            # Looks like something like this should work:
            #codepipeline_client = boto3.client('codepipeline')
            #codepipeline_response = codepipeline_client.start_pipeline_execution(
            #    name="codepipeline-customization-sandbox-pipeline"
            #)
        else:
            body = "Event is not a PR opening or updating"
    else:
        sc = 400
        body = "Request didn't contain a repository key"

    return {
        'statusCode': sc,
        'body': body
    }


