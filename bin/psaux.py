#!/usr/bin/python
import os
import sys


while True:
    os.system("ps aux | grep {}".format(sys.argv[1]))
