{ ... }:
{
  home.sessionPath = [
    "$HOME/.bin"
  ];

  programs = {
    bash = {
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
        pastefile = "curl -F 'file=@-' 0x0.st <";
        pastecmd = "curl -F 'file=@-' 0x0.st";
        pasteclip = "wl-paste | curl -F 'file=@-' 0x0.st";
        nsf = "ls /nix/store | fzf";
        cat = "bat --style=plain --pager=never";
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

    direnv = {
      enable = true;
      enableBashIntegration = true;
    };

    eza = {
      enable = true;
      enableBashIntegration = true;
    };

    bat = {
      enable = true;
    };

    tealdeer = {
      enable = true;
      settings = {
        updates = {
          auto_update = true;
        };
      };
    };

    fzf = {
      enable = true;
      defaultOptions = [
        "--border 'rounded'"
        "--border-label 'fzf'"
        "--border-label-pos '0'"
        "--preview-window 'border-rounded'"
        "--prompt '$ '"
        "--marker '>'"
        "--pointer '◆'"
        "--separator '─'"
        "--scrollbar '│'"
        "--layout 'reverse'"
        "--info 'right'"
      ];
      fileWidgetCommand = "fd --type f";
      changeDirWidgetCommand = "fd --type d";
    };

    starship = {
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
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };

  services.ssh-agent.enable = true;

}
