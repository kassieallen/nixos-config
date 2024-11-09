# Nvidia drivers
{ pkgs, ... }: {
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;
    # NVIDIA power management causes problems
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    # NVIDIA open-source kernel module (not to be confused with Nouveau)
    open = false;
    # NVIDIA settings menu
    nvidiaSettings = true;
    # Optionally, select the appropriate driver version
    # package = config.boot.kernelPackages.nvidiaPackages.stable;
    # Force full composition pipeline - reported to reduce performance of some OpenGL applications and may produce issues in WebGL
    # forceFullCompositionPipeline = true;
  }; 
}
