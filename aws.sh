 #!/bin/bash
 
 # uninstall awscli version 1
 pip3 uninstall -y awscli
 # install awscli version 2
 curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
 unzip awscliv2.zip
 ./aws/install --update
 
