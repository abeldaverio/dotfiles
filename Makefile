PACKAGES	=	\
	zed	\
	zip	\
	wofi	\
	rofi	\
	vim	\
	unzip	\
	nerd-fonts	\
	tree	\
	tar	\
	python3	\
	gzip	\
	firefox	\
	fish	\
	kitty	\
	bluez	\
	bluez-utils	\
	libnotify	\
	wl-clipboard	\
	swaync	\
	hypridle	\
	hyprlock	\
	hyprpaper	\
	brightnessctl	\
	waybar	\
	feh	\
	mpv	\
	rofi-wayland	\
	grim	\

all: packages

packages:
	sudo pacman -S $(PACKAGES)

.PHONY: packages
