# Minecraft Mod Package Installer

- Install Minecraft mods easily by running a single installer file to the `mods` directory
- I developed it to help newbie Minecraft mod users avoid installing mods incorrectly
- Moreover, It prevents mistakes during installation of Minecraft mods even for experienced users
- Supported OS: macOS, Windows

## How to use installer

1. Go to release page: https://github.com/hojongs/minecraft-mod-package-installer/releases
2. Download the latest installer in the assets
   - macOS: zip file in the asset of macOS release
   - Windows: exe file in the asset of Windows release
3. Run the downloaded file
4. Check the installed mods in mods dir (There's no console output after a successful installation)
   - macOS: `"$HOME/Library/Application Support/minecraft/mods"`
   - Windows: `%appdata%\.minecraft\mods`

## How to build installer

1. pip install -r requirements.txt
2. Move mod jar files you want to package into mods/
3. Run `./build.sh`
4. Check built installer single binary file in the `dist/` directory
