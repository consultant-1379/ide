#!/bin/bash

users=$( curl -s 'https://er101-eiffel004.lmera.ericsson.se:8443/eventrepository/restapi/events/?eventType=EiffelConfidenceLevelModifiedEvent&eventData.gav.groupId=com.ericsson.de&eventData.gav.artifactId=ide' | jq -r '.items[]|.eiffelMessageVersions|.[]|.eventData|.optionalParameters|.User' | sort -fu )
for u in ${users}; do
    printf ${u}" "
    ldapsearch -LLL sAMAccountName=${u} displayName mail | awk -F ": " '$1 == "displayName" || $1 == "mail" {printf "%s ",$2 }'
    echo
#    ldapsearch -LLL sAMAccountName=${u} displayName | awk -F ": " '$1 == "displayName" {print $2}'
done
