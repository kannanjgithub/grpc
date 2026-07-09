#!/bin/bash
# Copyright 2016 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

# cd to gRPC root
cd "$(dirname "$0")/../../.."
grpc_root="$(pwd)"

# Install gRPC C core
make -j4 shared_c static_c

# Build gRPC PHP native extension
pushd src/php/ext/grpc
phpize
GRPC_LIB_SUBDIR=libs/opt ./configure --enable-grpc="${grpc_root}"
make -j4
popd

cd src/php

DONE=0
for ((i = 0; i < 5; i++)); do
  php -d extension=ext/grpc/modules/grpc.so /usr/local/bin/composer install && DONE=1 && break
done

if [ "$DONE" != "1" ]
then
  echo "Failed to do composer install"
  exit 1
fi
