#!/bin/bash

# Set Variables
APP_NAME="laravel"
APP_REPO="https://github.com/laravel/laravel"
DB_NAME="DB"
DB_PORT=3306
DB_HOST=127.0.0.1
DB_USERNAME=root
DB_CONNECTION=mysql

# Update Packages
sudo apt-get update

sudo apt-get install apache2 git composer -y

# Add Apache to firewall
sudo ufw allow "Apache Full"

# MySQL Installation
sudo apt-get install mysql-server -y

sudo mysql -u root -e "CREATE DATABASE $DB_NAME"

# PHP Installation
sudo apt-get install php libapache2-mod-php php-mbstring php-xmlrpc php-soap php-gd php-xml php-cli php-zip php-bcmath php-tokenizer php-json php-pear php-curl -y

sudo systemctl restart apache2

# Clone Laravel to machine
cd /var/www/html

git clone $APP_REPO $APP_NAME
cd $APP_NAME
git checkout 10.x

# Install Laravel
export COMPOSER_ALLOW_SUPERUSER=1
composer install --ignore-platform-reqs
export COMPOSER_ALLOW_SUPERUSER=0

# Set Environment Variables
echo "DB_CONNECTION=$DB_CONNECTION
DB_DATABASE=$DB_NAME
DB_PORT=$DB_PORT
DB_HOST=$DB_HOST
DB_USERNAME=$DB_USERNAME
DB_PASSWORD=
APP_KEY=" > .env

# Generate App Key
php artisan key:generate

# Configure Apache
sudo chown -R www-data:www-data /var/www/html/$APP_NAME

sudo touch /etc/apache2/sites-available/$APP_NAME.conf

echo "<VirtualHost *:80>
	DocumentRoot /var/www/html/$APP_NAME/public
	<Directory /var/www/html/$APP_NAME/public>
		Options Indexes FollowSymlinks
		AllowOverride All
		Require all granted
	</Directory>

	ErrorLog /var/log/apache2/$APP_NAME-error.log
	CustomLog /var/log/apache2/$APP_NAME-access.log combined
</VirtualHost>" | sudo tee /etc/apache2/sites-available/$APP_NAME.conf

sudo a2dissite 000-default.conf
sudo a2enmod rewrite
sudo a2ensite $APP_NAME.conf

sudo systemctl restart apache2
