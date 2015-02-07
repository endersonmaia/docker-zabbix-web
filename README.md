# Dockerized Zabbix Web

This is a Zabbix Web Dockerfile base on the [baseimage-docker from phusion](http://phusion.github.io/baseimage-docker/).

Features :

* zabbix-web only;
* Links to official [MySQL Dockerfile](https://registry.hub.docker.com/_/mysql/)

-----------------------------------------

**Related resources**:
  [library/mysql](https://registry.hub.docker.com/u/library/mysql/)
  [enderson/zabbix-server](https://index.docker.io/u/enderson/zabbix-server)
  [phusion/baseimage-docker](http://phusion.github.io/baseimage-docker/) |
  [Docker registry](https://index.docker.io/u/phusion/baseimage/)

**Table of contents**

 * [Introduction](#intro)
   * [Version](#version)
   * [Contributing?](#contrib)
 * [Quickstart](#quickstart)

-----------------------------------------

<a name="intro"></a>
## Introduction

This is a Zabbix Web Dockerfile base on the [baseimage-docker from phusion](http://phusion.github.io/baseimage-docker/).

Features :

* zabbix-web only;
* Links to official [MySQL Dockerfile](https://registry.hub.docker.com/_/mysql/)

<a name="intro"></a>
### Version

The current version of the zabbix-web is 2.4. I'll try to keep upgrades inside new docker tags.

<a name="contrib"></a>
### Contributing

If you find this image useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with [Issues](https://github.com/enderson/docker-zabbix-web/issues) they may encounter

<a name="quickstart"></a>
## Quickstart

Considering you already have a MySQL server for your actual zabbix-server daemon configured and running, just pass the correct variables, and zabbix-web will start running.

Change the variable values to your situation.

    $ docker run --name=zabbix-web -it --rm -p 80:80 \
    -e DB_HOST=169.254.0.1 \
    -e DB_NAME=zabbix-database \
    -e DB_USER=zabbix \
    -e DB_PASS=password \
    enderson/zabbix-web:2.4
