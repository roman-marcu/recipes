
MY_SECRET=ARN:URL
echo "Deploy webapp to elasticbeanstalk"

echo "Prepare package"
echo "Copy spring boot jar"
mv ./target/Test*.jar application.jar

echo "Read asw secrets and add them to file"
aws secretsmanager get-secret-value --secret-id $MY_SECRET --query SecretString --output text | jq -r 'to_entries | .[] | "APP_\(.key)=\(.value)"' >> env

echo "Package all to a zip"
zip application.zip application.jar Procfile startup.sh env

echo "Deploy to eb"
eb init $EB_SANDBOX_APP --region eu-west-1 --platform Corretto
eb deploy -v