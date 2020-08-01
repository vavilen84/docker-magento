# M2 EE Docker based installation guide for Linux

This environment is only for development purpose. Don`t use it for production. 

## Composer

In order to use this workflow for development, you must first [install Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

## Env

Make a copy from ".env.dist" file and name it ".env". Set correct env vars values in it.

## Install EE edition skeleton locally

```
cd /project/root/path
sudo chmod +x composer_install_ee.sh
./composer_install_ee.sh
```

Bash script will create "src" folder and install application skeleton there.

## Run docker

```
docker-compose up
```

## FAQ

1) ERROR: for db  Cannot start service db: ... listen tcp 0.0.0.0:3306: bind: address already in use

Perhaps mysql daemon already use 3306 port. Shutdown daemon.

```
mysqladmin -u root -p shutdown
```

2) ERROR: for nginx  Cannot start service db: ... listen tcp 0.0.0.0:80: bind: address already in use

Perhaps nginx daemon already use 80 port. Shutdown daemon.

```
sudo service nginx stop
```

3) ERROR: Warning from repo.magento.com: You haven't provided your Magento authentication keys

You should set correct credentials in .env file for vars:
- MAGENTO_ACCOUNT_USERNAME
- MAGENTO_ACCOUNT_PASSWORD

Please, read how to [Get your authentication keys](https://devdocs.magento.com/guides/v2.4/install-gde/prereq/connect-auth.html)


