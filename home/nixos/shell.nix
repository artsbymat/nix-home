{ config, ... }:
{
  programs.bash = {
    enable = true;
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    historyFile = "$HOME/.bash_history";
    historyFileSize = 1000000;
    historySize = 1000000;
    historyIgnore = [
      "ls"
      "cd"
      "exit"
      "clear"
    ];
    shellAliases = {
      ls = "eza --group-directories-first";
      ".." = "cd ..";
      "..." = "cd ../..";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      rm = "trash-put";
      "5173" = "ngrok http 5173";
      "4321" = "ngrok http 4321";
      "4173" = "ngrok http 4173";
      "3000" = "ngrok http 3000";
      glt = "git log --graph --all --decorate --oneline";
      quartz-sync = "npx quartz sync";
      tldrf = "tldr --list | fzf --preview 'tldr {1} --color=always' --preview-window=right,70% | xargs tldr";
    };

    bashrcExtra = ''
      bind "set completion-ignore-case on"
      shopt -s autocd

      function set_win_title() {
          echo -ne "\033]0;$PWD\007"
      }
      starship_precmd_user_func="set_win_title"
    '';

    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
      QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    profileExtra = ''
      if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };

  home.sessionPath = [
    "$HOME/.bin"
  ];

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.tealdeer = {
    enable = true;
    settings = {
      updates = {
        auto_update = true;
      };
    };
  };

  services.ssh-agent.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      character = {
        success_symbol = "[➜](bold green)";
        vimcmd_symbol = "[➜](bold yellow)";
        error_symbol = "[✗](bold red)";
      };
      username = {
        style_user = "bold white";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "on [$hostname](bold red) at ";
        disabled = false;
      };
    };
  };
}
