#!/bin/sh

DOWNLOAD_URL=$(curl --silent "https://api.github.com/repos/datreeio/datree/releases/latest" | grep -o "browser_download_url.*\_Linux_x86_64.zip")
DOWNLOAD_URL=${DOWNLOAD_URL//\"}
DOWNLOAD_URL=${DOWNLOAD_URL/browser_download_url: /}

OUTPUT_BASENAME=datree-latest
OUTPUT_BASENAME_WITH_POSTFIX=$OUTPUT_BASENAME.zip

curl -L $DOWNLOAD_URL -o $OUTPUT_BASENAME_WITH_POSTFIX
unzip $OUTPUT_BASENAME_WITH_POSTFIX -d $OUTPUT_BASENAME

cp $OUTPUT_BASENAME/datree /usr/local/bin
chmod +x /usr/local/bin/datree