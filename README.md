# Bat to the Heavens Archipelago Mod + APWorld
### Relevant Links:
- [Bat to the Heavens Steam Store Page](https://store.steampowered.com/app/3044100/Bat_to_the_Heavens/)
- [Discord thread in main Archipelago Dicord](https://discord.com/channels/731205301247803413/1531099671685239009) (for feedback/help)

## Install Instructions
### What you'll need:
- Own the game on Steam, have the installation folder handy
- Download the latest version of the Wonton-BTTHArchipelago zip file from the [releases](https://github.com/NathanW001/BTTHArchipelago/releases/) page
- Download the latest version of the [Godot Mod Loader](https://wiki.godotmodding.com/) from the [releases page on their Github Repo](https://github.com/GodotModding/godot-mod-loader/releases/)

1. Unzip the download of the Godot Mod loader and move the `addons` folder into the base directory of the Bat to the Heavens game
2. In the Bat to the Heavens base directory, make a new folder called `mods`.
3. Drag the Wonton-BTTHArchipelago zip file into the mods directory you just created. **Do not unzip this folder.**
4. Finally, in Steam, open the Properties of Bat to the Heavens and add the line `--script addons/mod_loader/mod_loader_setup.gd` to Launch Options.

When you're finished, the install directory should look like this:
```
Bat to the Heavens/
├── addons/
│   ├── JSON_Schema_Validator/
│   │   └── internal files...
│   └── mod_loader
│       └── internal files...
├── mods/
│   └── Wonton-BTTHArchipelago-<version>.zip
├── battoheaven.exe
├── battoheaven.pck
└── other internal .dll files...
```

Once this is all setup, launch the game. It will load for a while before popping up with a message saying "The Godot ModLoader has been setup. The game needs to be restarted to apply the changes. Confirm to restart". Click OK.

After this, you should be done! The game will relaunch and you should see a tab for Archipelago on the menu. From here, just connect to your Archipelago server and start a new game.
