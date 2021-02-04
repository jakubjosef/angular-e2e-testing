#!/bin/bash
echo "- Build docker image"
docker build --no-cache -t volterrasystem/angular-e2e-testing .
echo "- Build finished, pushing latest tag to volterrasystem"
docker push volterrasystem/angular-e2e-testing
echo "- Pushing node14 tag to volterrasystem"
docker tag volterrasystem/angular-e2e-testing volterrasystem/angular-e2e-testing:node14
docker push volterrasystem/angular-e2e-testing:node14
