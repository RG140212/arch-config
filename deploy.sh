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

echo ""
echo "100% done!"
echo "Enjoy this advanced configuration, sir!"
