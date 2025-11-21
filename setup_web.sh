#!/bin/bash

sudo apt update -y
sudo apt install nginx -y

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
UPTIME=$(uptime -p)

cat <<EOF | sudo tee /var/www/html/index.html
<!doctype html>
<html>
  <body>
    <h1>DevOps Intern Page</h1>
    <p><strong>Name:</strong> Shashank M</p>
    <p><strong>Instance ID:</strong> $INSTANCE_ID</p>
    <p><strong>Uptime:</strong> $UPTIME</p>
  </body>
</html>
EOF
