while IFS= read -r line; do
  export $line
done < env

exec java -jar application.jar