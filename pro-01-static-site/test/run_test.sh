#!/bin/bash

#? Script to perform CRUD integration tests against the Flask API service

set -e

#? The API_BASE_URL is passed in from Github Actions env variables -> http://flask-api:5000/api/v1/users
API_BASE_URL=$API_BASE_URL

echo "Waiting 5 seconds to the Flask API service to start..."
sleep 5

#? ---- Function to test a complex endpoint
#? Takes: endpoint_suffix, http_method, expected_status, json_payload
test_operation() {
    local suffix=$1
    local method=$2
    local expected_status=$3
    local paylod=$4 #? OPTIONAL payload for POST/PUT
    local full_url="${API_BASE_URL}${suffix}"

    echo "--- Testing ${method} ${full_url} (Expected: ${expected_status}) ---"

    #? Build the curl command based on whether a payload is needed
    CURL_CMD="curl -s -S -o /dev/null -w \"%{http_code}\" -X ${method}"
    if[ -n "$payload" ]; then
        CURL_CMD="${CURL_CMD} -H \"Content-Type: application/json\" -d \"${payload}\""
    fi

    CURL_CMD="${CURL_CMD} ${full_url}"

    #? Execute the command
    HTTP_CODE=$(eval "${CURL_CMD}")
}

