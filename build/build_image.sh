#!/usr/bin/env bash

./build/build.sh

buildah from --name puzzleindentlangserver-working-container scratch
buildah copy puzzleindentlangserver-working-container $HOME/go/bin/puzzleindentlangserver /bin/puzzleindentlangserver
buildah copy puzzleindentlangserver-working-container ./templates /templates
buildah config --env TEMPLATE_PATH=/templates puzzleindentlangserver-working-container
buildah config --env SERVICE_PORT=50051 puzzleindentlangserver-working-container
buildah config --port 50051 puzzleindentlangserver-working-container
buildah config --entrypoint '["/bin/puzzleindentlangserver"]' puzzleindentlangserver-working-container
buildah commit puzzleindentlangserver-working-container puzzleindentlangserver
buildah rm puzzleindentlangserver-working-container

buildah push puzzleindentlangserver docker-daemon:puzzleindentlangserver:latest
