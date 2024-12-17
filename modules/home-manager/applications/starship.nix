# Home-manager starship configuration
{ lib, config, ... }:
let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.modules.applications.starship;
in {
  options.modules.applications.starship = {
    enable = mkEnableOption "Starship Command Prompt";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      settings = {
        format= lib.concatStrings [
          "[╭╴](#EA83A5)"
          "$os"
          "$username"
          "[](bg:#F5A191 fg:#EA83A5)"
          "$directory"
          "[](fg:#F5A191 bg:#F0C5A9)"
          "$git_branch"
          "$git_status"
          "[](fg:#F0C5A9 bg:#9DC6AC)"
          "$c"
          "$elixir"
          "$elm"
          "$golang"
          "$gradle"
          "$haskell"
          "$java"
          "$julia"
          "$nodejs"
          "$nim"
          "$rust" 
          "$scala"
          "[](fg:#9DC6AC bg:#89dceb)"
          "$docker_context"
          "[](fg:#89dceb bg:#89b4fa)"
          "$time"
          "[](fg:#89b4fa)"
          "\n[╰─╴](#EA83A5)"
        ];
        os = {
          style = "bg:#EA83A5";
          disabled = true; # Disabled by default
        };
        username = {
          show_always = true;
          style_user = "bg:#EA83A5";
          style_root = "bg:#EA83A5";
          format = "[$user ]($style)";
          disabled = false;
        };
        directory = {
          style = "bg:#F5A191";
          format = "[ $path ]($style)";
          truncation_length = 3;
          truncation_symbol = "…/";
        };
        c = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        docker_context = {
          symbol = " ";
          style = "bg:#89dceb";
          format = "[ $symbol $context ]($style)";
        };
        elixir = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        elm = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        git_branch = {
          symbol = "";
          style = "bg:#F0C5A9";
          format = "[ $symbol $branch ]($style)";
        };
        git_status = {
          style = "bg:#F0C5A9";
          format = "[$all_status$ahead_behind ]($style)";
        };
        golang = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        gradle = {
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        haskell = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        java = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        julia = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        nodejs = {
          symbol = "";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        nim = {
          symbol = "󰆥 ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        rust = {
          symbol = "";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        scala = {
          symbol = " ";
          style = "bg:#9DC6AC";
          format = "[ $symbol ($version) ]($style)";
        };
        time = {
          disabled = false;
          time_format = "%R"; # Hour:Minute Format
          style = "bg:#89b4fa";
          format = "[ ♥ $time ]($style)";
        };
      };
    };
  };
}
