# wouldproxy

This repository contains a collection of small test scripts that indicate the
effect of `http_proxy`, `https_proxy` and `no_proxy` environment variables
with common HTTP client libraries.

## usage

```
$ urls="https://google.com/ https://arf.google.com/"
$ export http_proxy=http://localhost:3128 no_proxy=arf.google.com
$ ./test-ruby-docker.sh $urls
$ go run wouldproxy.go $urls
$ python3 wouldproxy.py $urls
```

## todo

- consistent output format
- test harness to run all variants
- test harness to assess multiple Python versions
- test harness to assess multiple Go versions
- something to do collate the results
