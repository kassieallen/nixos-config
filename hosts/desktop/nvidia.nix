# Nvidia Configuation
{ lib, config, ... }: 
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.graphics.nvidia;
in {
  options.modules.graphics.nvidia = {
    enable = mkEnableOption "Nvidia Drivers";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    boot.initrd.kernelModules = [ "nvidia" ];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = false;
      };
    };
  };
}
