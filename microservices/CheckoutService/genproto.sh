#!/bin/bash -eu
#
# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START gke_checkoutservice_genproto]
export GOPATH=$HOME/go

PATH=$PATH:$GOPATH/bin
protodir=../../protos

protoc --go_out=genproto -I $protodir $protodir/demo.proto
protoc --go-grpc_out=./genproto -I $protodir $protodir/demo.proto
# mv src/checkoutservice/demo.pb.go ./genproto
# rm -f -r src

# [END gke_checkoutservice_genproto]