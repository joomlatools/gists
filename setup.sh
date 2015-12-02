#!/usr/bin/env bash

git config --global credential.helper 'cache --timeout=3600'

composer global update joomlatools/console

joomla plugin:install joomlatools/console-joomlatools

[ -d ~/Projects/koowa ] && mv ~/Projects/koowa ~/Projects/nooku-framework
[ -d ~/Projects/nooku-framework-joomla ]    && mv ~/Projects/nooku-framework-joomla    ~/Projects/joomlatools-framework
[ -d ~/Projects/nooku-framework-wordpress ] && mv ~/Projects/nooku-framework-wordpress ~/Projects/wordplugs-framework

[ ! -d ~/Projects/nooku-framework ] && git clone -b develop https://github.com/nooku/nooku-framework.git ~/Projects/nooku-framework
[ ! -d ~/Projects/com_files ] && git clone -b develop https://github.com/nooku/nooku-files.git ~/Projects/com_files
[ ! -d ~/Projects/com_activities ] && git clone -b develop https://github.com/nooku/nooku-activities.git ~/Projects/com_activities

[ ! -d ~/Projects/joomlatools-framework ] && git clone -b develop https://github.com/joomlatools/joomlatools-framework.git ~/Projects/joomlatools-framework
[ ! -d ~/Projects/joomla-todo ] && git clone -b develop https://github.com/nooku/joomla-todo.git ~/Projects/joomla-todo

[ ! -d ~/Projects/wordplugs-framework ] && git clone https://github.com/wordplugs/wordplugs-framework.git ~/Projects/wordplugs-framework
[ ! -d ~/Projects/wordpress-todo ] && git clone https://github.com/nooku/wordpress-todo.git ~/Projects/wordpress-todo

[ ! -d ~/Projects/docman ] && git clone -b develop https://git.assembla.com/joomlatools-docman.git ~/Projects/docman
[ ! -d ~/Projects/fileman ] && git clone -b develop https://git.assembla.com/joomlatools-fileman.git ~/Projects/fileman
[ ! -d ~/Projects/logman ] && git clone -b develop https://git.assembla.com/joomlatools-logman.git ~/Projects/logman
[ ! -d ~/Projects/extman ] && git clone -b develop https://git.assembla.com/joomlatools-extman.git ~/Projects/extman

if ! joomla plugin:list | grep -cq console-joomlatools; then 
  echo "ERROR: console-joomlatools plugin is not installed!"; exit 1; 
fi

[ ! -d /var/www/joomlatools ] && echo "Creating http://joomla.box/joomlatools" && joomla site:create joomlatools --symlink=extman,docman,fileman,logman
