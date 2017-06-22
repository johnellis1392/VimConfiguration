
# Makefile for initializing vim dependencies

bundle_dir=bundle

$(bundle_dir):
	@mkdir -p $(bundle_dir)

NeoBundle:
	@git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

NeoBundleInstall: NeoBundle
	@vim -c "NeoBundleInstall|NeoBundleUpdate|q!"

Vundle:
	@git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

VundleInstall: Vundle
	@vim -c "PluginInstall|q!"

PluginInstall: VundleInstall NeoBundleInstall

all: $(bundle_dir) PluginInstall

.Phony: PluginInstall

