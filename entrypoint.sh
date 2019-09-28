#!/bin/bash

version=40
curl -svvf -u 'chiju:32ea322465698d89b0b2844be7d8007527516e6e' -H "Content-Type: application/json" -X POST https://api.bintray.com/packages/chiju/debs/openssh/versions --data "{\"name\": \"$version\", \"github_use_tag_release_notes\": false }"
git clone https://github.com/chiju/debs.git
cd debs
for f in $(find -name "*.deb" -type f); 
do 
	echo "Uploading $f"; 
	curl -svvf -X PUT -T $f -u chiju:32ea322465698d89b0b2844be7d8007527516e6e \
										-H "X-Bintray-Version:$version" \
										-H "X-Bintray-Package:openssh"  \
										https://api.bintray.com/content/chiju/debs/openssh/$version/$f; 
done