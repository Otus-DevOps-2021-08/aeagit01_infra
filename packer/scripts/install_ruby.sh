#!/bin/bash
apt-get update
sleep 85   #aded for repair lock error
apt-get install -y ruby-full ruby-bundler build-essential apt-transport-https ca-certificates
