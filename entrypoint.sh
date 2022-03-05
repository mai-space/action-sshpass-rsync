#!/bin/bash
set -e

echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

# Available env
# echo "INPUT_HOST: ${INPUT_HOST}"
# echo "INPUT_PORT: ${INPUT_PORT}"
# echo "INPUT_USER: ${INPUT_USER}"
# echo "INPUT_PASS: ${INPUT_PASS}"
# echo "INPUT_LOCAL: ${INPUT_LOCAL}"
# echo "INPUT_REMOTE: ${INPUT_REMOTE}"

echo "Exporting Password"
export SSHPASS=$PASS

echo "Trying to connect"
CMD="${INPUT_RUN/$'\n'/' && '}"
sshpass -e ssh -o StrictHostKeyChecking=no -p $INPUT_PORT $INPUT_USER@$INPUT_HOST "$CMD"

echo "Deploying now"
sshpass -p $INPUT_PASS rsync -v -ae "ssh -p $INPUT_PORT" $GITHUB_WORKSPACE/$INPUT_LOCAL $INPUT_USER@$INPUT_HOST:$INPUT_REMOTE

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"