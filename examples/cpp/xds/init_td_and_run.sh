#!/bin/bash
export GRPC_XDS_BOOTSTRAP=/tmp/td-grpc-bootstrap.json
# Create the bootstrap file
curl -L https://storage.googleapis.com/traffic-director/td-grpc-bootstrap-0.18.0.tar.gz | tar -xz
./td-grpc-bootstrap-0.18.0/td-grpc-bootstrap --config-mesh $1 --is-trusted-xds-server-experimental=true > $GRPC_XDS_BOOTSTRAP
./xds_greeter_client --xds_creds xds:///$2
