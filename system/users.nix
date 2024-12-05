# User configuration
{ inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  
  users.users = { 
    kassie = {
      isNormalUser = true;
      # initialPassword = "12345";
      hashedPasswordFile = "/persist/passwords/user";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
  
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."kassie" = import ../home;
  };
}
