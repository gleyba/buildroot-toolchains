#!/bin/bash

set -eux

cd "$(dirname "$0")"

output_prefix="glibc_2_28_x86_64_chroot"

mkdir -p "${output_prefix}"

target_dir="$(realpath ../output/target)"
output_dir="$(pwd)/${output_prefix}"

pushd "${target_dir}"
    for subdir in bin lib lib64 sbin root usr; do
        rsync -av -R "${subdir}" "${output_dir}"
    done 
popd

tar -cvzf "${output_prefix}.tar.gz" "${output_prefix}"
