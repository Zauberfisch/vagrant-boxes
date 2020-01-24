#!/bin/bash

vagrant destroy -f
vagrant up --provider virtualbox
vagrant package --vagrantfile provision/_Vagrantfile
