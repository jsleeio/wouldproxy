package main

import (
	"flag"
	"fmt"
	"net/url"

	"golang.org/x/net/http/httpproxy"
)

func main() {
	flag.Parse()
	config := httpproxy.FromEnvironment()
	pfunc := config.ProxyFunc()
	for _, urltext := range flag.Args() {
		u, err := url.Parse(urltext)
		if err != nil {
			fmt.Printf("error parsing URL '%s': %v\n", urltext, err)
			continue
		}
		proxyu, err := pfunc(u)
		if err != nil {
			fmt.Printf("error discovering proxy for URL '%s': %v\n", urltext, err)
			continue
		}
		if proxyu == nil {
			fmt.Printf("no proxy for URL '%s'\n", urltext)
			continue
		}
		fmt.Printf("would use proxy %s for URL '%s'\n", proxyu.String(), urltext)
	}
}
