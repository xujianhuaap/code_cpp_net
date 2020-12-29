#!/bin/bash
echo "========post.sh============="
 project_dir="$(pwd)"
 cd "${project_dir}/build"
make package