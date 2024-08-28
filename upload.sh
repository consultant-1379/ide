#!/bin/bash

for f in *.jar; do
    bn=$(basename  $f .jar)
    mvn deploy:deploy-file -DrepositoryId=releases \
        -DgroupId=org.eclipse.plugins \
        -Durl=https://arm1s11-eiffel004.eiffel.gic.ericsson.se:8443/nexus/content/repositories/3pptools/ \
        -DartifactId=${f%%_*} \
        -Dversion=${bn##*_} \
        -Dfile=$f
done
