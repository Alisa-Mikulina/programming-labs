#!/bin/bash

sudo docker run -dit --name my_web_server -p 0008:80 -v /home/alicemikulina/cs-lab-5-Alisa-Mikulina/web_server/:/usr/local/apache2/htdocs/ httpd:2.4
