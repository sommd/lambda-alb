#!/usr/bin/env bash

stopLocalstack() {
    pushd tests/mock-aws

    # clear down lambda containers still hanging around
    printf "Removing lambda containers: "
    docker kill $(docker ps -a -q --filter ancestor="lambci/lambda:nodejs8.10" --format="{{.ID}}")

    pipenv run docker-compose down

    popd
}

stopLocalstack