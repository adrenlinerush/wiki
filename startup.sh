#!/bin/bash

/etc/init.d/php8.2-fpm start
nginx -g "daemon off;"
