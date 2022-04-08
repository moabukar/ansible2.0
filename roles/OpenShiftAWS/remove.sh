#!/bin/bash

ansible-playbook -i environments/dev --extra-vars "admin_password=$1" remove.yml
