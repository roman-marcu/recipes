### Problem:
According to 12 factor app https://12factor.net/config we should stores app config in environment variables.
Elastic Beanstalk has no native support for integrating with Secrets Manager or SSM Parameter store for secured value. Only SSM Parameter Store simple strings are supported.

### Solution:
Create and deploy a custom zip with the following content:
 - startup.sh: logic that will be executed when deploying app to eb
 - application.jar: the executable packaged code
 - env: file that contains all the secrets in a key=value format
 - Procfile: definition on how to execute startup.sh when deploying to eb

The logic to build and deploy the package is described in deploy.sh file.