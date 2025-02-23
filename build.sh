#!/usr/bin/env sh

pyinstaller --onefile --add-data "mods/*.jar:mods/" --manifest=minecraft-mod-installer main.py
