#!/bin/sh
set -e

namespace=$1
wd=$2

params=""

if [ ! -z "$OKTETO_CA_CERT" ]; then
   echo "Custom certificate is provided"
   echo "$OKTETO_CA_CERT" > /usr/local/share/ca-certificates/okteto_ca_cert.crt
   update-ca-certificates
fi

if [ ! -z "$namespace" ]; then
params="${params} $namespace"
fi

if [ ! -z "$wd" ]; then
cd $wd
fi

echo running: okteto namespace wake $params on $(pwd)
okteto namespace wake $params