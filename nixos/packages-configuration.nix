# Programs/Packages
{ config, pkgs, ... }:

{  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install Programs
  programs = {
    # Install zsh
	  zsh = {
		  enable = true;
		  enableCompletion = true;
		  syntaxHighlighting.enable = true;

		  shellAliases = {
			  ll = "ls -l";
			  update = "sudo nixos-rebuild switch";
		  };
      # Install OhMyZsh
  		ohMyZsh = {
    		enable = true;
    		plugins = [ "git" "thefuck" ];
    		theme = "jispwoso";
		  };
  	};
    firefox.enable = true; # Install FireFox
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
	appflowy # Note taking App
	libreoffice # test editors
    virtualbox # Virtual Environment Runner
    krita # Painting
    gimp # Image Editing
    blender # #D modelling
    gparted # To manage Partitions/format partitions
    git # Git Version Control
    discord # Discord Chat
    vscode # Visual Studio Code
    android-studio # Android Studio Code
    unityhub # Unity Game Engine
    godot_4 # Better Game Engine
    semeru-bin # Java Development Kit
    clang_18 # C++ Compiler
    thefuck # corrects your previous console command
    hdf5 # Data model, library, and file format for storing and managing data
	hadoop # Cluster File System Software
    (python3.withPackages (pkgs: with pkgs; [
	  pip # python package manager
	  ipykernel # python kernel for jupyter
	  h5py # some kind of interface for hdf5
      autopep8 # python code style tool
      python-lsp-server # lsp for autocompletion
      numpy # NumPy data analysis
      scipy # SciPy data analysis
      pandas # Panadas data modelling
      jupyter # Python runtime environment
      scikitlearn # Scikit-Learn Data Modelling
      spark # Spark Data modeling (in-memory)
      hadoop # Hadood Data modeling (persistant storage)
    #   torch # PyTorch machine learning
	#   torchaudio # PyTorch Audio machine learning
	#   torchvision # PyTorch Vision machine learning
      tensorflow # TensorFlow Machine Learning
      keras # Keras Machine Learning
      matplotlib # Data Plotting
      seaborn # Data Plotting
	])) # python scripting language
    
  ];
  
  # Tarball Updating links
  nixpkgs.overlays = [
					# Installing latest discord
					(self: super: {
             discord = super.discord.overrideAttrs (
              _: { 
									src = builtins.fetchTarball https://discord.com/api/download/stable?platform=linux&format=tar.gz; 
								});})
					# Installing latest vscode
					(
            self: super: { 
              vscode = super.vscode.overrideAttrs (
                _: { 
									src = builtins.fetchTarball https://update.code.visualstudio.com/1.92.2/linux-x64/stable; 
								});}) 
  ];
} 
