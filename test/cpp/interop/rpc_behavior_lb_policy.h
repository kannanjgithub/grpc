//
//
// Copyright 2023 gRPC authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//

#ifndef GRPC_TEST_CPP_INTEROP_RPC_BEHAVIOR_LB_POLICY_H
#define GRPC_TEST_CPP_INTEROP_RPC_BEHAVIOR_LB_POLICY_H

#include <grpc/support/port_platform.h>

#include "src/core/config/core_configuration.h"

namespace grpc {
namespace testing {
void RegisterRpcBehaviorLbPolicy(
    grpc_core::CoreConfiguration::Builder* builder);
}  // namespace testing
}  // namespace grpc

#endif  // GRPC_TEST_CPP_INTEROP_RPC_BEHAVIOR_LB_POLICY_H