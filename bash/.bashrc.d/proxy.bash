## Proxy
# https://about.gitlab.com/blog/2021/01/27/we-need-to-talk-no-proxy/
export http_proxy="http://127.0.0.1:7890/"
export https_proxy=$http_proxy
export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy
export ALL_PROXY=$http_proxy
export no_proxy="127.0.0.1, routerlogin.net, router.asus.com, lan, localdomain, example, invalid, localhost, test, local"
