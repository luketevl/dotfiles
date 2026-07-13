#!/bin/bash

# Ookla (recomendado)
RESULT=$(speedtest --simple 2>/dev/null)

PING=$(echo "$RESULT" | grep Ping | awk '{print $2}')
DOWN=$(echo "$RESULT" | grep Download | awk '{print $2}')
UP=$(echo "$RESULT" | grep Upload | awk '{print $2}')

echo " ${DOWN}↓ ${UP}↑ ${PING}ms"

