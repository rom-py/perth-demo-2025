#!/bin/bash

export version="v0.1.1"
image_name="perth-demo"
registry="us-central1-docker.pkg.dev/oceanum-prod/prax-user-oceanum"
image="${registry}/${image_name}:${version}"
docker build -f Dockerfile.notebook -t ${image} .
docker push ${image}
