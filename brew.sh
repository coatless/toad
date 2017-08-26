##################################
# Homebrew installation
##################################

source ./helpers.sh

####### Check if brew is installed if not... Install
if test ! $(which brew); then
  log_install "homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

####### Setup taps
brew tap caskroom/fonts
brew tap caskroom/cask     # "To install, drag this icon..." no more!
brew tap caskroom/versions
brew tap homebrew/science

####### House keeping and updates
brew cleanup
brew update

####### Address permission issue to allow linking
sudo chown -R "$USER":admin /usr/local

####### Command line specific tools

cli_tools=(
	imagemagick       # allow for magick package use
	ffmpeg            # animation bindings
	tree              # tree structures of directories
	armadillo         # C++ matrix library
	eigen             # C++ matrix library
	mlpack            # machine learning (dependency on armadillo)
	ssh-copy-id       # easily move SSH keys between machines
	tmux              # amazing multiwindow editor
	vim               # improved version of vim
	mas               # Mac App Store
	pandoc            # Swiss army knife of document conversion
	pandoc-citeproc   # Bibliography extension
	hugo              # Blogging platform
	autoconf          # Configuration checks
	automake          # Generating Makefile.in 
	shtool            # Compile tools
	autogen           
)

log_install "CLI Tools"
brew install ${cli_tools[@]}

####### Applications installers via Cask

apps=(
	alfred                  # Utilities
	1password
	appcleaner
	flux
	caffeine
	the-unarchiver
	spectacle
	omnigraffle
	adium                   # Comms
	slack
	skype
	google-hangouts
	keybase
	google-chrome           # Web Browsers
	firefox
	r-app                   # R/LaTeX
	mactex
	rstudio                 # Code Editors
	textmate                
	iterm2
	sublime-text
	docker                  # Virtualization
	virtualbox
	parallels-desktop
	box-sync                # Syncing
	dropbox
	google-backup-and-sync  # New google drive
	github-desktop
	vlc                     # Media
	amazon-music
	handbrake
)

log_install "Applications"
brew cask install --appdir="/Applications" ${apps[@]}

####### Fonts make the world go round

fonts=(
    font-hack
    font-roboto
	font-fontawesome
)

log_install "Fonts"
brew cask install ${fonts[@]}


echo "Done installing homebrew components!"
