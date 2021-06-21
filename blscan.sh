#!/bin/bash

echo "Broken Link scanner by b4gg3r"
echo "Usage: blscanner targeturl"
echo ""
echo "Running hakrawler"
hakrawler -url $1 -depth 3 -plain | grep -Ev -e '\.js' -e '\.css' -e '\.pdf' | sort -u | tee urls
echo ""
echo "Running curl to extract domains"
for url in $(cat urls); do curl -s $url -L | grep -oP '[a-z0-9]+\.com'; done | sort -u >> hrefdomains
for url in $(cat urls); do curl -s $url -L | grep -oP '[a-z0-9]+\.org'; done | sort -u >> hrefdomains
for url in $(cat urls); do curl -s $url -L | grep -oP '[a-z0-9]+\.net'; done | sort -u >> hrefdomains
echo ""
echo "Running whois to extract not found domains"
for a in $(cat hrefdomains); do sleep 1 && whois $a | grep -e 'NOT FOUND' -e 'No match for domain' && echo "Domain: $a"; done | tee nfdomains
