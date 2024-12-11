# Security configuration
{ pkgs, ... }: {
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    pam = {
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = "1";
        }
      ];
    };
  };
  environment.sessionVariables = {
    POLKIT_AUTH_AGENT = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };
}
