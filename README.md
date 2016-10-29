[![Build Status](https://travis-ci.org/WheresMyBus/onebusaway.svg?branch=master)](https://travis-ci.org/WheresMyBus/onebusaway)

Building and Testing on the UW CSE Linux VM
==========================================

Install the UW CSE Linux VM
-------------------------
Setup the VM following the instructions listed at: https://github.com/WheresMyBus/android/blob/master/README.md

Installing Dependencies
-----------------------
Install the necessary software by executing the script from the api repository: `https://github.com/WheresMyBus/api/blob/master/install_ruby.sh`

Building and Testing
--------------------
`onebusaway` is a repostiory for library code, and does not execute a rails sever.

To test, make sure rvm is using version 2.2.4 of Ruby: `rvm use 2.2.4` then use the command: `rake`
