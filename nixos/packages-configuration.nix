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

  	thefuck.enable = true; # Install thefuck console corrent tool
    firefox.enable = true; # Install FireFox

    # GitHub Configuration
    git = {
      enable = true;
      config = {
        user = {
          name = "fulminin";
          email = "mattcarlile590@gmail.com";
        };
      };
    };
  };

  # Installing System Packages
  environment.systemPackages = with pkgs; [
	appflowy # Note taking App
	libreoffice # test editors
    virtualbox # Virtual Environment Runner
    krita # Painting
    gimp # Image Editing
    blender # #D modelling
    gparted # To manage Partitions/format partitions
    discord # Discord Chat
    vscode # Visual Studio Code
    android-studio # Android Studio Code
    unityhub # Unity Game Engine
    godot_4 # Better Game Engine
    semeru-bin # Java Development Kit
    clang_18 # C++ Compiler
    hdf5 # Data model, library, and file format for storing and managing data
	hadoop # Cluster File System Software
	hbase # Big Data Store
	pig # high level language for Apache Hadoop
	spark # Spark Data modeling (in-memory)
    (python3.withPackages (pkgs: with pkgs; [ # python scripting language
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
      hbase # Big Data Store
      pig # high level language for Apache Hadoop
    #   torch # PyTorch machine learning
	#   torchaudio # PyTorch Audio machine learning
	#   torchvision # PyTorch Vision machine learning
      tensorflow # TensorFlow Machine Learning
      keras # Keras Machine Learning
      matplotlib # Data Plotting
      seaborn # Data Plotting
	]))
    
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
                    # Installing Hive
                    (self: super: {
                    Hive = super.Hive.overrideAttrs (
                    _:{
                                    src = builtins.fetchTarball https://dlcdn.apache.org/hive/hive-4.0.0/apache-hive-4.0.0-src.tar.gz;
                                });})
  ];
} 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
