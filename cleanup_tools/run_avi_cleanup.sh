#!/bin/bash
ansible-playbook avi_cleanup_vs.yml
ansible-playbook avi_cleanup_vip.yml
ansible-playbook avi_cleanup_pool.yml
ansible-playbook avi_cleanup_se.yml