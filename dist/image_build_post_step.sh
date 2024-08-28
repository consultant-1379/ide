#!/bin/bash

printf '========================================\n'
printf '==== Search Nexus for latest image =====\n'
printf '========================================\n'
NEXUS_HOST="arm1s11-eiffel004.eiffel.gic.ericsson.se:8443"
IDE_GROUP="com.ericsson.de"
IDE_ARTIFACT="ENM_IDE_Base"
IDE_BASE_VERSION=$( curl -s --noproxy \* "https://${NEXUS_HOST}/nexus/service/local/lucene/search?g=${IDE_GROUP}&a=${IDE_ARTIFACT}" | sed -n 's|<latestRelease>\(.*\)</latestRelease>|\1|p' | sed -e 's/^[ \t]*//' | tail -1 )
echo 'LATEST ENM_IDE_Base: '$IDE_BASE_VERSION

printf '\n========================================\n'
printf '=== Update Box URL with latest image ===\n'
printf '========================================\n'

IDE_BASE_URL="config.vm.box_url = \"https://arm1s11-eiffel004.eiffel.gic.ericsson.se:8443/nexus/service/local/repositories/releases/content/com/ericsson/de/ENM_IDE_Base/$IDE_BASE_VERSION/ENM_IDE_Base-$IDE_BASE_VERSION.box\""
echo 'IDE_BASE_URL: '$IDE_BASE_URL

printf '\n========================================\n'
printf '=== Update Vagrantfile with Base URL ===\n'
printf '========================================\n'

#sed -i "s#config.vm.box_url.*#$IDE_BASE_URL#g" $WORKSPACE/test/Vagrantfile && echo OK: test/Vagrantfile updated || echo Failed: test/Vagrantfile not updated
sed -i "s#config.vm.box_url.*#$IDE_BASE_URL#g" $WORKSPACE/vagrant/Vagrantfile && echo OK: vagrant/Vagrantfile updated || echo Failed: vagrant/Vagrantfile not updated

printf '\n========================================\n'
printf '===== Add, Commit & Push Vagrantfiles ====\n'
printf '==========================================\n'

cd $WORKSPACE
git add $WORKSPACE/vagrant/Vagrantfile 
git commit -m "DE Infra: Vagrantfiles Updated to latest available ENM_IDE_Base.box"
git push gcn master
