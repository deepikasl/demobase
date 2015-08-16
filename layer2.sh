#!/bin/bash -e

cd /opt/gcloud/google-cloud-sdk && ./install.sh --usage-reporting=false --bash-completion=true --path-update=true
export PATH=$PATH:/opt/gcloud/google-cloud-sdk/bin
cd /
/opt/gcloud/google-cloud-sdk/bin/gcloud components update preview
