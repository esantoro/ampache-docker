# esantoro fork

This fork of ampache-docker has been created to fix some things that in my opinion are anti-patterns.

Things like:
- running as root (WIP)
- embedding a mysql database (DONE)
- unclear way to customize settings (DONE)
- configuration hard to inspect without exec-ing into the container

## How to run this image

- use docker-compose (see the included sample file)
- either link the ampache container to a mariadb container or
  link to some other mysql-compatible container running elsewhere
- set configruatin in the environment section of docker-compose


## Customizable settings:

In ampache.cfg.php: 

- web_path = "WEB_PATH"
- local_web_path = "http://LOCAL_WEB_PATH"
- database_hostname = DATABASE_HOSTNAME
- database_port = DATABASE_PORT (default 3306)
- database_name = DATABASE_NAME (default ampache)
- database_username = DATABASE_USERNAME (default ampache)
- database_password = DATABASE_PASSWORD
- secret_key = "SECRET_KEY"

How to use the ampache.cfg.php file? Map it to `/var/www/config/ampache.cfg.php` inside the ampache container.


## example docker-compose file:

```
WIP
```


# ampache-docker

Docker container for Ampache, a web based audio/video streaming application and file manager allowing you to access your music & videos from anywhere, using almost any internet enabled device.

**build status**

![travis status](https://travis-ci.org/ampache/ampache-docker.svg?branch=master)

**Develop build status**

![travis status](https://travis-ci.org/ampache/ampache-docker.svg?branch=develop)

## Usage

To run official builds from docker hub you can run these commands:

To run the current Ampache master (stable) branch
```bash
docker run --name=ampache -d -v /path/to/your/music:/media:ro -p 80:80 ampache/ampache
```

To run the current Ampache develop branch
```bash
docker run --name=ampache -d -v /path/to/your/music:/media:ro -p 80:80 ampache/ampache:develop
```

The develop tag is set up to use git updates so you don't have to rebuild your images to stay up to date with development.

## Running on ARM

The automated builds for the official repo are now built for linux/amd64, linux/arm/v7 and linux/arm64.

## Installation
- MySQL Administrative Username: root    # leave alone
- MySQL Administrative Password: (blank) # leave alone
- Check "Create Database User"
- Ampache Database Username: ampache
- Ampache Database User Password: ampache # or whatever you want, but remember it on the next page
- next page fill out MySQL Username / Password
- Click the "Write" buttons from BOTTOM to TOP
- Do this because it is the last one that needs the username and password and they get blanked out on every click

## Thanks to
- @ericfrederich for his original work
- @velocity303 and @goldy for the other ampache-docker inspiration

## Current Release

4.1.1
