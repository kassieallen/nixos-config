# Home-manager minecraft configuration
{ config, lib, pkgs, inputs, ... }: {
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  options = {
    mc.enable =
      lib.mkEnableOption "enables Minecraft";
  };

  config = lib.mkIf config.mc.enable {
    home = {
      packages = with pkgs; [
        prismlauncher
      ];
      persistence."/persist/home/kassie" = {
        directories = [
          ".local/share/PrismLauncher"
          # ".var/app/io.mrarm.mcpelauncher"
        ];
      };
    };

    services.flatpak.packages = [
      "io.mrarm.mcpelauncher"
    ];
  };
}
