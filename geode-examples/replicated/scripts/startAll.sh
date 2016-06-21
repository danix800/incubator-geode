#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#!/bin/bash

set -e

cd `dirname $0`

. ./setEnv.sh

# start a locator
gfsh start locator --name=locator1 --mcast-port=0

# start 2 servers on a random available port
for N in {1..2}
do
 gfsh start server --locators=localhost[10334] --name=server$N  --server-port=0 --mcast-port=0
done

# create a region using GFSH
gfsh -e "connect" -e "create region --name=myRegion --type=REPLICATE"

gfsh -e "connect" -e "list members"

exit 0
