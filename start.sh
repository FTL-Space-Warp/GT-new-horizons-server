 #!/usr/bin/env bash

git_url=git@github.com:FTL-Space-Warp/GT-new-horizons-server.git

if ! git pull
then
    git clone $git_url || exit 2
    rm $0
    cd mcserver
fi

echo url="https://www.duckdns.org/update?domains=scemochilegge&token=f61d37e2-6f14-4f5e-96c4-8baa00042737&ip=" | curl -kK -
java -Xms6G -Xmx6G -XX:+UseStringDeduplication -XX:+UseCompressedOops -XX:+UseCodeCacheFlushing -Dfml.readTimeout=180 -jar forge-1.7.10-10.13.4.1614-1.7.10-universal.jar nogui
   
git add .
git commit -m `date -Iminutes`
git push
