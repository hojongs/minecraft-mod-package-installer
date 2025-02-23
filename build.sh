#!/usr/bin/env sh

pyinstaller --onefile --add-data "mods/*.jar:mods/" --name=minecraft-mod-installer main.py

