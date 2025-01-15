#!/bin/bash
#curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
#tar -xf google-cloud-cli-linux-x86_64.tar.gz
#./google-cloud-sdk/install.sh --quiet
#./google-cloud-sdk/bin/gcloud init
#send "1"
#send "1"
#send "kannanj-psm-interop-testing"
export GRPC_XDS_BOOTSTRAP=/tmp/td-grpc-bootstrap.json
export GRPC_EXPERIMENTAL_XDS_AUTHORITY_REWRITE=true
export GRPC_EXPERIMENTAL_XDS_SYSTEM_ROOT_CERTS=true
export GRPC_EXPERIMENTAL_XDS_GCP_AUTHENTICATION_FILTER=true
export GRPC_TRACE=xds_client

# Create the bootstrap file
#https://pantheon.corp.google.com/storage/browser/grpc-bazel-mirror/github.com/twisted/twisted?pageState=(%22StorageObjectListTable%22:(%22f%22:%22%255B%255D%22))&project=grpc-testing
curl -L https://storage.googleapis.com/grpc-bazel-mirror/github.com/twisted/twisted/td-grpc-bootstrap-0.18.1.tar.gz | tar -xz
./td-grpc-bootstrap-0.18.1/td-grpc-bootstrap --config-mesh $1 --is-trusted-xds-server-experimental=true > $GRPC_XDS_BOOTSTRAP
./xds_greeter_client --xds_creds --target=xds:///$2
