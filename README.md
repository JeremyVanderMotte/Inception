# Inception

Score : <img width="198" alt="+6" src="https://user-images.githubusercontent.com/107465256/224007436-c5aad203-ce7a-4739-814c-3503af26d9c5.png">

___

This is a 19 school project where we need to learn docker and containerization.

The goal is to display the basic wordpress website but skipping the installation process.
All the installation process is done at the installation of the container by a script.

* Nginx.  
&emsp; Write a simple nginx server used to display wordpress.

* Mariadb.  
&emsp; Write a container using mariadb to have the database needed for wordpress.

* Wordpress.  
&emsp;Write a container which download wordpress. Install it and install also php-fpm.  
&emsp;The wordpress container will use the mariadb database to use data and the nginx server as server.  
&emsp;The subject mentionned that we need to skip the installation page and have the website by default.  
&emsp;The config is skipped by using wp-cli and by changing de `wp-config-sample.php` file `in wp-config.php`.  
