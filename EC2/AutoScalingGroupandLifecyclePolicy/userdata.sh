


#!/bin/bash
yum install httpd -y && \
service httpd start && \
INSTANCE_ID="`wget -q -0 - http://instance-data/latest/meta-data/instance-id`" && \
aws autoscaling complete-lifecycle-action --lifecycle-action-result CONTINUE --instance-id
$INSTANCE_ ID --lifecycle-hook-name myFirstHook --auto-scaling-group-name myASG --region us-west-1 || \
aws autoscaling complete-lifecycle-action --lifecycle-action-result ABANDON --instance-id
SINSTANCE ID - - lifecycle-hook-name myFirstHook --auto-scaling-group-name myASG --region us-west-1
