#!/bin/bash
apt-get update
apt-get install -y ruby-full ruby-bundler build-essential apt-transport-https ca-certificates
ruby -v >> rubyversion.txt
bundler -v >> rubyversion.txt
