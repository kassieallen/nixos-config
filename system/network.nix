# Networking configuration
{
  networking = {
    hostName = "NixOS";
    networkmanager = {
      enable = true;
    };
    nameservers = [ "1.1.1.1" "1.0.0.1" ];

    firewall = {
      enable = true;
      allowPing = false;
      logReversePathDrops = true;
    };
  };
}
