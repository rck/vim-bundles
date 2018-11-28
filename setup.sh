#!/bin/sh

rm -rf ../../.vimrc
ln -s "$PWD"/vimrc ~/.vimrc

rm -rf ../bundle
mkdir -p ../bundle

if [ "$1" = "youcompleteme" ]; then
	vam install -t ./youcompleteme.vim.vam youcompleteme
fi

(cd .. && ln -s ./bundles/nerdtree_plugin)
(cd ../bundle && find ../bundles -maxdepth 1 -type d -name "*.vim.*" -exec ln -s {} \;)
