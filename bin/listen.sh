#!/bin/env bash
if [[ $1 -gt 0 ]]
   then
	 pactl load-module module-loopback
else
    	 pactl unload-module module-loopback
fi

