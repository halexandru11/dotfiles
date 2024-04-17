#!/bin/bash

wmctrl -s 1
$(brave-browser https://www.audible.com/library/titles &) > /dev/null 2>&1
