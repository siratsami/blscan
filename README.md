# blscan
Broken Link Scanner

# what is blscan?
blscan is automated script to find broken link vulnerabilities
# how is that work?
it uses hakrawler to crawl the website and uses curl to extract domains then using whois to find not registered domains
# install
first you have to install https://github.com/hakluke/hakrawler
#### `git clone https://github.com/siratsami/blscan`
#### `cd blscan`
#### `chmod +x blscan.sh`
#### `sudo cp -r blscan.sh /usr/bin/blscan`
# usage
#### `blscan https://target.com/`
####
