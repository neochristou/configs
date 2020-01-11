#!/bin/bash
WHEREAMI=$(cat /tmp/whereami)
echo $WHEREAMI
sh -c '$WHEREAMI ; st'

