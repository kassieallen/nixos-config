# Home-manager git configuration
{ pkgs, ... }: {
  home.packages = [ pkgs.gh ];
  programs.git = {
    enable = true;
    userName = "kassieallen";
    userEmail = "kasallen.21@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.help = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };
}
