# Security configuration
{
  security = {
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
}
