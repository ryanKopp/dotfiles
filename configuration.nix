# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #./hardware-configuration.nix
      #./nvidia.nix
      ./laptop-hardware.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixOS"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  programs.tmux = {
    enable = true;
    shortcut = "a";
    plugins = with pkgs; [
        tmuxPlugins.pain-control
        tmuxPlugins.resurrect
        tmuxPlugins.continuum
    ];
  };

  programs.sway.enable = true;
  xdg.portal = {
    config = {
      sway = {
        default = ["gtk"];
      };
    };
    enable = true;
    wlr.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;
  
  security.polkit.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ryan = {
    isNormalUser = true;
    description = "ryan";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    packages = with pkgs; [];
  };
  
# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.neovim = {
    enable = true;
    configure = {
      customRC = '' 
        " Source the init.lua from ~/.config/nvim
        source ~/.config/nvim/init.lua
        '';
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [ 
          onedark-nvim
          harpoon
          telescope-nvim
          plenary-nvim
          nvim-treesitter
          undotree
          vim-fugitive
          lsp-zero-nvim
          nvim-lspconfig
          nvim-cmp
          cmp-buffer
          cmp-path
          cmp-nvim-lsp
          cmp-nvim-lua
        ];
      };
    };
  };

  fonts.packages = with pkgs; [
      iosevka
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      nerd-fonts.fira-code
  ]; 

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    alacritty
    alsa-utils
    discord
    firefox
    gnome-disk-utility
    lm_sensors 
    networkmanagerapplet
    nextcloud-client
    pamixer
    pavucontrol
    remmina
    spotify
    waybar
    xdg-desktop-portal-gtk

    #nvim lang servers
    lua-language-server

    #File explorer
    xfce.thunar
    xfce.thunar-volman
    xfce.tumbler

    #screenshot combo breaker
    grim
    slurp
    swappy
    wl-clipboard
    
    # Dev tools
    git
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
