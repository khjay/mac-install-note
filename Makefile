all: help

install: ## Initial Mac Environments
	# Install Package Management Tool
	xcode-select --install
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# Install ZSH tools
	brew install zsh-completion brew-cask-completion zsh-syntax-highlighting

	# Install Development Environments
	brew install git ansible composer docker go htop pipenv python telnet terraform tree unzip wget yarn

	# Install GUI tools 
	brew cask install docker google-chrome notion postman sequel-pro skype slack telegram tunnelblick visual-studio-code iterm2 virtualbox
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# Install Fonts
	brew tap homebrew/cask-fonts
	brew cask install font-fira-code font-fira-mono-for-powerline

	# Reload .zsh setting
	cp ~/.zshrc ~/.zshrc.bkup
	curl -fsSL raw.githubusercontent.com/khjay/mac-install-note/master/.zshrc -o ~/.zshrc

	# Install ZSH Custom Plugins
	git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/autosuggestions
	rm -f ~/.zcompdump; compinit
	source $(HOME)/.zshrc

	# Install vscode plugins
	code --install-extension alexkrechik.cucumberautocomplete
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension eamodio.gitlens
	code --install-extension EditorConfig.EditorConfig
	code --install-extension felixfbecker.php-debug
	code --install-extension felixfbecker.php-intellisense
	code --install-extension johnpapa.vscode-peacock
	code --install-extension karigari.chat
	code --install-extension mauve.terraform \
	code --install-extension mikestead.dotenv
	code --install-extension ms-azuretools.vscode-docker
	code --install-extension ms-python.python
	code --install-extension ms-vscode.cpptools
	code --install-extension ms-vscode.Go
	code --install-extension ms-vsliveshare.vsliveshare
	code --install-extension ms-vsliveshare.vsliveshare-audio
	code --install-extension ms-vsliveshare.vsliveshare-pack
	code --install-extension octref.vetur
	code --install-extension pnp.polacode
	code --install-extension Tyriar.sort-lines
	code --install-extension wholroyd.jinja

test:
	git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/autosuggestions

.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
