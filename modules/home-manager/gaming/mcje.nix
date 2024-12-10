# Home-manager minecraft configuration
{ config, lib, pkgs, inputs, ... }: {
  options = {
    mc.enable =
      lib.mkEnableOption "enables Minecraft: Java Edition";
  };

  config = lib.mkIf config.mc.enable {
    home = {
      packages = with pkgs; [
        prismlauncher
      ];
      persistence."/persist/home/kassie" = {
        directories = [
          ".local/share/PrismLauncher"
        ];
      };
    };
  };
}
