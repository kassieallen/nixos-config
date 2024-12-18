# User configuration
{ inputs, username, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  
  users.users.${username} = {
    isNormalUser = true;
    # initialPassword = "12345";
    hashedPasswordFile = "/persist/passwords/user";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.${username} = import ../home-manager;
    useUserPackages = true;
    useGlobalPkgs = true;
  };
}
