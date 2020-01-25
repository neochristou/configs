#!/bin/bash
WHEREAMI=$(cat /tmp/whereami)
echo $WHEREAMI
sh -c "cd $WHEREAMI ; st"

