# !/bin/bash
# https://github.com/RickBarretto/Github-cli-scrapy

open=$'false'

if ['$2' == '-o']; then
    open=$'true'
fi

# Catching Github's explore
curl 'https://github.com/explore' > temp

# Picking relative link
links=$(cat temp | grep 'class="text-bold"' | cut -d '=' -f5 | cut -d'"' -f2)

i=1

for link in $links;do
    # User/Project
    desc=$(cat temp | grep '<p class="color-text-secondary mb-0"><div>' | cut -d'>' -f3 | cut -d'<' -f1|cut -d$'\n' -f$i)
    echo $(echo $link | cut -d'/' -f2-3)
    # Href
    echo '    https://github.com/'$link
    echo '    >' $desc
    echo
    if [$ == $(1)]; then
        staecho 'https://github.com/'$userlink > toopen
    else
        echo 'https://github.com/'$userlink >> toopen
    fi
    i=$((i+1))
done

cd ..

exit