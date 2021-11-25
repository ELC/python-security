#!/usr/bin/env bash

function trigger_binder() {
    local URL="${1}"

    curl -L --connect-timeout 10 --max-time 45 "${URL}"
    
    curl_return=$?

    if [ $curl_return -eq 0 ] || [ $curl_return -eq 28 ]; then
        return 0
    fi

    return $curl_return

}

trigger_binder "$@" || exit 1
