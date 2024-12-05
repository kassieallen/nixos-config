# This is the time and place
let
  UTF = "en_US.UTF-8";
in {
  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = UTF;
    extraLocaleSettings = {
      LC_ADDRESS = UTF;
      LC_IDENTIFICATION = UTF;
      LC_MEASUREMENT = UTF;
      LC_MONETARY = UTF;
      LC_NAME = UTF;
      LC_NUMERIC = UTF;
      LC_PAPER = UTF;
      LC_TELEPHONE = UTF;
      LC_TIME = UTF;
    };
  };
}
