# Disko configuration
{
  disko.devices = {
    disk.main = {
      device = "/dev/nvme0n1";
      type = "disk";
      content = {
        type = "gpt";
        partitions = {
          boot = {
            type = "EF02";
            size = "1M";
          };
      	  ESP = {
      	    type = "EF00";
      	    size = "500M";
      	    content = {
      	      type = "filesystem";
      	      format = "vfat";
      	      mountpoint = "/boot";
      	    };
      	  };
      	  root = {
      	    size = "100%";
      	    content = {
      	      type = "lvm_pv";
      	      vg = "root_vg";
      	    };
      	  };
        };
      };
    };
    lvm_vg = {
      root_vg = {
        type = "lvm_vg";
        lvs.root = {
          size = "100%FREE";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            subvolumes = {
              "/root" = {
                mountpoint = "/";
              };
              "/persist" = {
                mountpoint = "/persist";
                mountOptions = [ "subvol=persist" "noatime" ];
              };
              "/nix" = {
                mountpoint = "/nix";
                mountOptions = [ "subvol=nix" "noatime" ];
              };
            };
          };
        }; 
      };
    };
  };
}
