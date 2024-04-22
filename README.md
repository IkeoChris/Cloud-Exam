# Cloud Engineering Second Semester Examination Project

## Automate the provisioning of two Ubuntu-based servers, named “Master” and “Slave”, using Vagrant.
  * ![VagrantFile](img/VAGRANTFILE_IMG.jpg)

## On the Master node, create a bash script to automate the deployment of a LAMP (Linux, Apache, MySQL, PHP) stack.
  * ![Bash Script](img/BASH_SCRIPT.jpg)
  * ![Bash Script](img/BASH_SCRIPT-2.jpg)

## This script should:
      Clone a PHP application from GitHub.
  ![Clone Repo](img/CLONE_REPO.jpg)

      Install all necessary packages.
  ![Install Packages](img/INSTALL_PACKAGES.jpg)

      Configure Apache web server.
  ![Configure Apache](img/CONFIGURE_APACHE.jpg)

      Configure MySQL.
  * ![Configure MySQL 1](img/CONFIGURE_MYSQL-1.jpg)
  * ![Configure MySQL 2](img/CONFIGURE_MYSQL-2.jpg)

---

## Using an Ansible playbook:

     Execute the bash script on the Slave node and verify that the PHP application is accessible through the VM’s IP address (take screenshot of this as evidence)
* ![PLAYBOOK](img/PLAYBOOK.jpg)
* ![PLAYBOOK SUCCESS](img/PLAYBOOK_SUCCESS.jpg)
* ![ACCESSIBLE BY TERMINAL](img/ACCESSIBLE_BY_TERMINAL_ON_MASTER.jpg)
* ![ACCESIBLE BY BROWSER](img/ACCESSIBLE_BY_BROWSER.jpg)

     Create a cron job to check the server’s uptime every 12 am.
* ![CRON JOB](img/CRON.jpg)