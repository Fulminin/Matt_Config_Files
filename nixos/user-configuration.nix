{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.matt = {
      isNormalUser = true;
      description = "matt";
      extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
      packages = with pkgs; [
        kdePackages.kate
      #  thunderbird
      ];
    };
    groups.vboxusers = {};
    defaultUserShell = pkgs.zsh; # Default Shell
    # extraGroups.vboxusers.members = [ "matt" ]; #vbox members
  };

}
