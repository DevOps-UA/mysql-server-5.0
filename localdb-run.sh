#!/bin/bash
set -e # fail on any error

echo '* Working around permission errors locally by making sure that "mysql" uses the same uid and gid as the host volume'
TARGET_UID=$(id -u mysql)
echo '-- Setting mysql user to use uid '$TARGET_UID
usermod -u $TARGET_UID mysql || true
TARGET_GID=$(id -g mysql)
echo '-- Setting mysql group to use gid '$TARGET_GID
groupmod -g $TARGET_GID mysql || true
echo
#echo '* Starting MySQL'
chown -R mysql:root /var/run/mysqld/
#/entrypoint.sh mysqld --user=mysql --console
