# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

echo $*
i=1
for arg in $*; do
    links=$(cat toopen | grep $arg | cut -d' ' -f2)
    for link in $links; do
        start $link
    done
done

cd ..
exit