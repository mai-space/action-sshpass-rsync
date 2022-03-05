FROM ubuntu:18.04

LABEL "com.github.actions.name"="ACTION: RSYNC OVER SSHPASS"
LABEL "com.github.actions.description"="RSYNC OVER SSHPASS"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/Inf166/action-sshpass-rsync"
LABEL "homepage"="https://maispace.de"
LABEL "maintainer"="Joel Mai <joel@maispace.de>"

RUN apt-get update && apt-get install -y sshpass rsync openssh-client

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]