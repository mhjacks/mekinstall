# MegaMek installer scripts and icons

The ansible playbooks in the scripts directory install MegaMek, MegaMekLab and MekHQ tarballs in a
user directory.

The icons in the icons directory are used to create Linux desktop files for them.

## mekbuild

mekbuild is a shell script that compiles mekhq, megamek, and megameklab. It places the results
of the builds in `~/mm`. It checks for any changes to the git trees first, and normally will not
recompile the programs if it does not see new changes. However, if `~/mm` is empty or missing, it
will build anyway. When it decides to build, it builds all three artifacts.

## newmek

newmek exists to install the most recent MekHQ artifact in `~/mm` to `~/megamek`. This consists
in untarring the .tar.gz file, creating symlinks to custom unit lists and custom unit files,
installing any custom settings and game options, and tweaking the Java heap default in the
MegaMek start script.

## mekdesktop

mekdesktop creates FreeDesktop standard .desktop files and icons for the MegaMek family of games.
It defaults to creating both "stable" (standard names MegaMek, MegaMekLab, and MekHQ) and SNAPSHOT
(MegaMek SNAPSHOT, MegaMekLab SNAPSHOT, and MekHQ SNAPSHOT) games.

## getmwkscripts

getmekscripts downloads the most recent versions of these scripts into the user's `~/bin` directory.
It makes them executable and also removes any old scripts that are no longer needed.
