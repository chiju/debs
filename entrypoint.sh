#!/bin/bash

version=38

curl -vvf -u 'chiju:32ea322465698d89b0b2844be7d8007527516e6e' -H "Content-Type: application/json" -X POST https://api.bintray.com/packages/chiju/debs/openssh/versions --data "{\"name\": \"$version\", \"github_use_tag_release_notes\": false }"

git clone https://github.com/chiju/debs.git

cd debs

ls -al

#for package in $(find -name "*.deb" -type f)
#do
	echo "Uploading";
	#curl -vvf  -X PUT -T $package -uchiju:32ea322465698d89b0b2844be7d8007527516e6e \
	#											  			-H "X-Bintray-Debian-Distribution:xenial" \
	#											  			-H "X-Bintray-Debian-Component:main" \
	#											  			-H "X-Bintray-Debian-Architecture:amd64" \
	#											  			https://api.bintray.com/content/chiju/debs/openssh/$version/$package;	
#done

for f in $(find -name "*.deb" -type f); do echo; echo "Uploading $f"; curl -X PUT -T $f -u chiju:32ea322465698d89b0b2844be7d8007527516e6e -H "X-Bintray-Version:$version" -H "X-Bintray-Package:openssh"  https://api.bintray.com/content/chiju/debs/openssh/$version/$f; done