#!/bin/bash

for x in hq lab startup mm-startup mml-startup mhq-startup; do
    if [ -f "$x" ] && [ ! -x "$x" ]; then
        echo "Making $x executable..."
        chmod 755 $x
    fi
done

if [ -f mm -a ! -f mm-startup ]; then
    echo "Linking mm to mm-startup..."
    ln -s mm mm-startup
fi

echo "Bumping -Xmx in mm-startup"
sed -i 's/-Xmx2048m/-Xmx2568m/g' mm-startup

echo "Backing up and Copying in config directory..."
cp -a mmconf mmconf-orig
#rm -rf mmconf
cp -a ~/gitwork/meks/mmconf-standard/* mmconf

echo "Linking in unit lists..."
ln -s ~/gitwork/meks/units .

if [ ! -d savegames ]; then
	echo "Creating savegames dir"
	mkdir savegames
fi

# Fixed in 0.47.1
# Patch out bogus Hercules dropship image for Hercules mech
#sed -i '/^chassis "Hercules" "defaults\/dropship_spheroid.png"/d' \
#	data/images/units/mechset.txt

echo "Linking in custom unit definitions..."
cd data/mechfiles
ln -s ~/gitwork/meks/custom_mtf .
cd ..

if [ -f sentry.properties ]; then
    echo "Enabling sentry"
    echo "enabled=true" > sentry.properties
fi

echo "Enabling sentry"
# Temp - reconfigure maps
#echo "Linking boards directory..."
#mv boards boards-orig
#ln -s ~/gitwork/meks/boards .

echo "Updating meks git repo..."
cd ~/gitwork/meks
git up

if [ ~/gitwork/meks/applauncher/setup_mm.sh -nt ~/bin/setup_mm.sh ]; then
    echo 'Copying setup_mm.sh...'
    cp ~/gitwork/meks/applauncher/setup_mm.sh ~/bin
fi
