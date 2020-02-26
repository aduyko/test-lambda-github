Test lambda function to trigger github commands

Depends on there being a "github_token" variable set in lambda to authenticate with github. Ideally this flow would have its own dedicated bot user/token that only has access to the repos the lambda needs access to.

The actual function being run is somewhat arbitrary at this point and this is more of a proof of concept of lambda triggering github api events than anything.

test pr update 4
