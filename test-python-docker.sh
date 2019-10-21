#!/bin/sh

python_tags="2.7-alpine 3.5-alpine 3.6-alpine 3.7-alpine 3.8-alpine"
python_test="$(pwd)/wouldproxy.py"
http_proxy="http://localhost:3128"
no_proxy="google.com"

echo '*** CONFIG ***'
echo "* http_proxy=$http_proxy"
echo "* no_proxy=$no_proxy"

for tag in $python_tags ; do
  echo
  echo "*** testing python version: python:$tag"
  docker run \
    --interactive \
    --tty \
    --rm \
    --volume "$python_test:/mnt/test.rb" \
    --env "http_proxy"="$http_proxy" \
    --env "no_proxy"="$no_proxy" \
    --workdir="/mnt" \
    --entrypoint="sh" \
    python:$tag \
    -c \
    "pip -q install requests && python /mnt/test.rb $*"
done 
