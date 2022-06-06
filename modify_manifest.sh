#!/usr/bin/bash
wget https://github.com/vega-d/WebCord_flatpak_build/releases/latest
wget https://github.com$(cat latest | grep tar.gz | grep href | awk 'BEGIN { FS = "\"" }; { print $2 }')
NEW_URL=$(cat latest | grep tar.gz | grep href | awk 'BEGIN { FS = "\"" }; { print $2 }')
NEW_SHASUM=$(sha256sum v3.2.0.tar.gz | awk 'BEGIN { FS = " " }; { print $1 }') 
sed -i "s\.*url: https://github.com/vega-d.*\        url: https://github.com${NEW_URL}\g" io.github.spacingbat3.webcord.yml
sed -i "s\.*sha256:.*\        sha256: ${NEW_SHASUM}\g" io.github.spacingbat3.webcord.yml
cat io.github.spacingbat3.webcord.yml
git config user.name "Github manifest bot"
git config user.email "<>"
git add io.github.spacingbat3.webcord.yml
git commit -m "modify manifest with new release and sha256sum"
git push origin master

