#!/bin/sh

PROJECT_DIR=src

# dont change to VAR!
rm -Rf src

mkdir $PROJECT_DIR

composer create-project --repository-url=https://repo.magento.com/ magento/project-enterprise-edition $PROJECT_DIR \
  --ignore-platform-reqs

# set permissions
cd $PROJECT_DIR || exit 1
find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
chown -R :www-data . # Ubuntu
chmod u+x bin/magento
