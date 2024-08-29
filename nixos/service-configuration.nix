 # Services
 { config, pkgs, ... }:
 
 {
 	services = {
    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    xserver = {
      enable = true;

      # configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
	
	libinput.enable = true; # Enable touchpad support (enabled default in most desktopManager).

    # Enable the KDE Plasma Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    printing.enable = true; # Enable CUPS to print documents.
    blueman.enable = true; # enable bluetooth GUI

    # Enabling Audio using pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      # media-session.enable = true;
	  };
	#   # Hadoop
	#   hadoop = {
    #   hdfs = {
	#   	  namenode.enable = true;
	#   	  datanode.enable = true;
    #   };
    #   yarn = {
    #     resourcemanager.enable = true;
    #     nodemanager.enable = true;
	#     };
    # };
  };
 }