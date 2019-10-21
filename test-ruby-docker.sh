#!/bin/sh

ruby_tags="2.3-alpine 2.4-alpine 2.5-alpine 2.6-alpine 2.7-rc-alpine"
ruby_test="$(pwd)/wouldproxy.rb"
http_proxy="http://localhost:3128"
no_proxy="google.com"

echo '*** CONFIG ***'
echo "* http_proxy=$http_proxy"
echo "* no_proxy=$no_proxy"

for tag in $ruby_tags ; do
  echo
  echo "*** testing ruby version: ruby:$tag"
  docker run \
    --interactive \
    --tty \
    --rm \
    --volume "$ruby_test:/mnt/test.rb" \
    --user=1000 \
    --env "http_proxy"="$http_proxy" \
    --env "no_proxy"="$no_proxy" \
    --workdir="/mnt" \
    ruby:$tag \
    /mnt/test.rb \
    "$@"
done 
