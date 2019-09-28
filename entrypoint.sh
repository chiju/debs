#!/bin/bash

version=35

curl -vvf -u 'chiju:32ea322465698d89b0b2844be7d8007527516e6e' -H "Content-Type: application/json" -X POST https://api.bintray.com/packages/chiju/debs/openssh/versions --data "{\"name\": \"$version\", \"github_use_tag_release_notes\": false }"

git clone https://github.com/chiju/debs.git

ls -al

for package in $(find -name "*.deb" -type f)
do
	echo "Uploading";
	curl -vvf  -X PUT -T $f -uchiju:32ea322465698d89b0b2844be7d8007527516e6e \
												  -H "X-Bintray-Debian-Distribution:xenial" \
												  -H "X-Bintray-Debian-Component:main" \
												  -H "X-Bintray-Debian-Architecture:amd64" \
												  https://api.bintray.com/content/chiju/debs/openssh/$version/$package;
done
