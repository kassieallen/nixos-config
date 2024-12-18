# Home-manager davinci-resolve configuration
{ lib, config, pkgs, username, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.editing.davinci-resolve;
in {
  options.modules.editing.davinci-resolve = {
    enable = mkEnableOption "Davinci Resolve";
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        davinci-resolve
      ];
      persistence."/persist/home/${username}".directories = [
        #
      ];
    };
  };
}
