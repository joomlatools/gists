#!/usr/bin/env bash

git config --global credential.helper 'cache --timeout=3600'

composer global update joomlatools/console
cd ~/.composer/vendor/joomlatools/console/plugins/ && composer require joomlatools/console-joomlatools:dev-develop

[ ! -d ~/Projects/joomlatools-framework ] && git clone -b master https://github.com/joomlatools/joomlatools-framework.git ~/Projects/joomlatools-framework

[ ! -d ~/Projects/joomlatools-framework-files ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-files.git ~/Projects/joomlatools-framework-files
[ ! -d ~/Projects/joomlatools-framework-activities ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-activities.git ~/Projects/joomlatools-framework-activities
[ ! -d ~/Projects/joomlatools-framework-scheduler ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-scheduler.git ~/Projects/joomlatools-framework-scheduler
[ ! -d ~/Projects/joomlatools-framework-migrator ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-migrator.git ~/Projects/joomlatools-framework-migrator

[ ! -d ~/Projects/docman ] && git clone -b master https://git.assembla.com/joomlatools-docman.git ~/Projects/docman
[ ! -d ~/Projects/fileman ] && git clone -b master https://git.assembla.com/joomlatools-fileman.git ~/Projects/fileman
[ ! -d ~/Projects/logman ] && git clone -b master https://git.assembla.com/joomlatools-logman.git ~/Projects/logman

if ! joomla plugin:list | grep -cq console-joomlatools; then 
  echo "ERROR: console-joomlatools plugin is not installed!"; exit 1; 
fi

[ ! -d /var/www/joomlatools ] && echo "Creating http://joomla.box/joomlatools" && joomla site:create joomlatools --symlink=docman,fileman,logman
