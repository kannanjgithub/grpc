#!/bin/bash
#curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
#tar -xf google-cloud-cli-linux-x86_64.tar.gz
#./google-cloud-sdk/install.sh --quiet
#./google-cloud-sdk/bin/gcloud init
#send "1"
#send "1"
#send "kannanj-psm-interop-testing"
export GRPC_XDS_BOOTSTRAP=/tmp/td-grpc-bootstrap.json
# Create the bootstrap file
curl -L https://storage.googleapis.com/td-grpc-bootstrap/td-grpc-bootstrap-0.18.1.tar.gz | tar -xz
./td-grpc-bootstrap-0.18.1/td-grpc-bootstrap --config-mesh $1 --is-trusted-xds-server-experimental=true > $GRPC_XDS_BOOTSTRAP
./xds_greeter_client --xds_creds xds:///$2
