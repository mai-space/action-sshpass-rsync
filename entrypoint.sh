#!/bin/bash
set -e

echo "#################################################"
echo "Starting ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"

# Available env
echo "INPUT_HOST: ${INPUT_HOST}"
echo "INPUT_PORT: ${INPUT_PORT}"
echo "INPUT_USER: ${INPUT_USER}"
echo "INPUT_PASS: ${INPUT_PASS}"
echo "INPUT_LOCAL: ${INPUT_LOCAL}"
echo "INPUT_REMOTE: ${INPUT_REMOTE}"

CMD="${INPUT_RUN/$'\n'/' && '}"

export SSHPASS=$PASS

sshpass -p $INPUT_PASS rsync -ae "ssh -p $INPUT_PORT" $GITHUB_WORKSPACE/$INPUT_LOCAL $INPUT_USER@$INPUT_HOST:$INPUT_REMOTE

echo "#################################################"
echo "Completed ${GITHUB_WORKFLOW}:${GITHUB_ACTION}"