# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # External File Imports
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	  # Include the servicesto start
	  ./service-configuration.nix
	  # Include what programs and packages to include
	  ./packages-configuration.nix
	  # Include User Configurations
	  ./user-configuration.nix
	  # Include Localisation Configuration
	  ./localisation-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    hostName = "WifuBox"; # Define your hostname.
    networkmanager.enable = true; # Enable networking

    # wireless.enable = true; # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy = {
    # 	default = "http://user:password@proxy:port/";
      # 	noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  # Hardware
  hardware = {
    # Enable bluetooth
    bluetooth = {
      enable = true; # enables support for Bluetooth
      powerOnBoot = true; # powers up the default Bluetooth controller on boot
    };
    pulseaudio.enable = false; # Enable Audio Hardware
  };
  
  # Security
  security.rtkit.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  # Virtualisation settings
  virtualisation.virtualbox = {  # VirtualBox Settings
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest = {
      enable = true;
      draganddrop = true;
      clipboard = true;
    };
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
