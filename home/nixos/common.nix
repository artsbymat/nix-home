{
  config,
  lib,
  pkgs,
  ...
}:
let
  extraNodePackages = import ./node/default.nix { inherit pkgs; };
in
{
  nixpkgs.config = {
    allowUnfree = true;
  };
  home.username = lib.mkDefault "rahmat";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    gvfs
    keepassxc
    nodejs_22
    ripgrep
    fd
    gcc
    obsidian
    unzip
    stylua
    shfmt
    tree-sitter
    wl-clipboard
    prismlauncher
    jdk21_headless
    vscode
    discord-canary
    nixfmt-rfc-style
    trash-cli
    htop
    btop
    scrcpy
    obs-studio
    telegram-desktop
    gimp
    postman
    newsboat
    yazi
    rclone
    ngrok
    lazygit
    translate-shell
    aria2
    pwgen
    lua-language-server
    yt-dlp
    google-chrome
    file-roller
    p7zip
    flameshot
    node2nix
    libreoffice
    extraNodePackages.prettier-plugin-astro
    extraNodePackages.typescript
    extraNodePackages.typescript-language-server
    extraNodePackages.prettier
    extraNodePackages.vscode-langservers-extracted
    extraNodePackages.prettier-plugin-astro
    extraNodePackages.eslint_d
    extraNodePackages.live-server
    extraNodePackages."@olrtg/emmet-language-server"
    extraNodePackages."@astrojs/language-server"
    extraNodePackages."@tailwindcss/language-server"
    extraNodePackages."@fsouza/prettierd"
    kdePackages.qt6ct
    waybar
    hyprpaper
    hyprpicker
    networkmanagerapplet
    nwg-look
    hypridle
    hyprlock
    mako
    cliphist
    papirus-icon-theme
    grim
    slurp
    satty
    imv
    evince
    jq
    gh
    gh-copilot
    nil
    gnome-calculator
  ];

  home.file = { };

  home.file.".icons/default".source =
    "${pkgs.comixcursors.Opaque_White}/share/icons/ComixCursors-Opaque-White";

  # user directories
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gnome-themes-extra;
      name = "Adwaita-dark";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    cursorTheme = {
      package = pkgs.comixcursors.Opaque_White;
      name = "ComixCursors-Opaque-White";
      size = 24;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  programs.home-manager.enable = true;
}
