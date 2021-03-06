#!/usr/bin/env bash

git config --global credential.helper 'cache --timeout=3600'

composer global update joomlatools/console
joomla plugin:install joomlatools/console-joomlatools:dev-master

[ ! -d ~/Projects/joomlatools-framework ] && git clone -b master https://github.com/joomlatools/joomlatools-framework.git ~/Projects/joomlatools-framework

[ ! -d ~/Projects/joomlatools-framework-files ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-files.git ~/Projects/joomlatools-framework-files
[ ! -d ~/Projects/joomlatools-framework-activities ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-activities.git ~/Projects/joomlatools-framework-activities
[ ! -d ~/Projects/joomlatools-framework-scheduler ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-scheduler.git ~/Projects/joomlatools-framework-scheduler
[ ! -d ~/Projects/joomlatools-framework-migrator ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-migrator.git ~/Projects/joomlatools-framework-migrator
[ ! -d ~/Projects/joomlatools-framework-ckeditor ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-ckeditor.git ~/Projects/joomlatools-framework-ckeditor
[ ! -d ~/Projects/joomlatools-framework-tags ] && git clone -b master https://github.com/joomlatools/joomlatools-framework-tags.git ~/Projects/joomlatools-framework-tags

[ ! -d ~/Projects/kodekit-ui ] && git clone -b master https://github.com/timble/kodekit-ui.git ~/Projects/kodekit-ui

[ ! -d ~/Projects/docman ] && git clone -b master https://github.com/joomlatools/docman.git ~/Projects/docman
[ ! -d ~/Projects/fileman ] && git clone -b master https://github.com/joomlatools/fileman.git ~/Projects/fileman
[ ! -d ~/Projects/leadman ] && git clone -b master https://github.com/joomlatools/leadman.git ~/Projects/leadman
[ ! -d ~/Projects/logman ] && git clone -b master https://github.com/joomlatools/logman.git ~/Projects/logman
[ ! -d ~/Projects/textman ] && git clone -b master https://github.com/joomlatools/textman.git ~/Projects/textman
[ ! -d ~/Projects/connect ] && git clone -b master https://github.com/joomlatools/connect.git ~/Projects/connect

[ ! -d ~/Projects/build-scripts ] && git clone -b master https://github.com/joomlatools/build-scripts.git ~/Projects/build-scripts

if ! joomla plugin:list | grep -cq console-joomlatools; then 
  echo "ERROR: console-joomlatools plugin is not installed!"; exit 1; 
fi

[ ! -d /var/www/joomlatools ] && echo "Creating http://joomla.box/joomlatools" && joomla site:create joomlatools --symlink=docman,fileman,logman,textman
