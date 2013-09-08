#!/bin/sh

# deploy all the dotfiles
for f in dotfiles/*
do
	base=`basename $f`
	echo "Deploying ~/.${base}..."
	cp -rf -T $f ~/.${base}
done

echo "Deploying ~/.local/bin/..."
cp -rf -T ./bin/ ~/.local/bin/

# reload X settings
xrdb -merge ~/.Xresources &

echo ""
echo "100% done!"
echo "Enjoy this advanced configuration, sir!"
