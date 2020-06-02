#!/usr/bin/python
import subprocess
import sys
import collections
import os

arguments = sys.argv[1:]

with open("{}/.bash_history".format(os.environ.get("HOME")), 'r') as history_handle:
    contents = history_handle.read()

cdlist = []

for line in contents.split('\n'):
    if line.startswith("cd"):
        directory = line[3:].replace("~", os.environ.get("HOME"))
        if os.path.exists(directory):
            cdlist.append(directory)

matching_directories = []

for directory in cdlist:
    matching = False
    for argument in arguments:
        if argument.lower() in directory.lower():
            matching = True
    if matching:
        matching_directories.append(directory)

popular_matches = collections.Counter(matching_directories)

if len(popular_matches) > 0:
    print popular_matches.most_common()[0][0]
else:
    print os.getcwd()