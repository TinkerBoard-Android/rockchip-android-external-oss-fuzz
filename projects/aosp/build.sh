#!/bin/bash -eu
# Copyright 2017 Google Inc.
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
#
################################################################################

# build sqlite
$CC -c $CFLAGS sqlite/dist/sqlite3.c -I sqlite/dist
$CC -c $CFLAGS sqlite_fuzz.c -I sqlite/dist
$CXX $CXXFLAGS *.o  $LIB_FUZZING_ENGINE -o $OUT/sqlite
# TODO: add a dictionary, build flags, etc, to better mimic
# https://github.com/google/oss-fuzz/tree/master/projects/sqlite3
