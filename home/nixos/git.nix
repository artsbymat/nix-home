{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "Rahmat Ardiansyah";
    userEmail = "artsbymat@gmail.com";
    extraConfig = {
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
