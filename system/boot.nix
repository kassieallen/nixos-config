# Bootloader configuration
{ config, lib, pkgs, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 7;
    };
  };

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/root_vg/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
      mkdir -p /btrfs_tmp/old_roots
      timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
      mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
      IFS=$'\n'
      for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
        delete_subvolume_recursively "/btrfs_tmp/$i"
      done
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
      delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  ''; 

  systemd.tmpfiles.rules = [
    "d /persist/home/ 0777 root root -" # Owned by root
    "d /persist/home/kassie/ 0700 kassie users -" # Owned by that user
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd \"dbus-run-session river\"";
        user = "greeter";
      };
    };
  };
}
