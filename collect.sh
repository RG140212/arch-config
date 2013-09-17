#!/bin/sh

# collect all the dotfiles
for f in dotfiles/*
do
	base=`basename $f`
	echo "Collecting ~/.${base}..."
	rm -rf dotfiles/${base}
	cp -rf ~/.${base} dotfiles/${base}
done

echo "Collecting ~/bin/..."
rm -rf ./bin/
cp -rf -T ~/.local/bin/ ./bin/

echo ""
echo "100% done!"
echo "Ready to commit now, sir!"
