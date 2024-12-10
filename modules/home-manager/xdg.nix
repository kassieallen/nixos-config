# Home-manager XDG configuration
{ pkgs, lib, ... }: with lib;
let
  defaultApps = {
    audioPlayer = [ "mpv.desktop" ];
    browser = [ "firefox.desktop" ];
    fileManager = [ "yazi.desktop" ];
    imageViewer = [ "feh.desktop" ];
    officeSuite = [ "libreoffice.desktop" ];
    terminal = [ "foot.desktop" ];
    textEditor = [ "nvim.desktop" ];
    videoPlayer = [ "mpv.desktop" ];
  };

  mimeMap = {
    audioPlayer = [
      "audio/aac"
      "audio/mpeg"
      "audio/ogg"
      "audio/opus"
      "audio/wav"
      "audio/webm"
      "audio/mkv"
    ];
    browser = [
      "application/xhtml+xml"
      "text/html"
      "x-scheme-handler/about"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/unknown"
    ];
    fileManager = [ "inode/directory" ];
    imageViewer = [
      "image/avif"
      "image/bmp"
      "image/gif"
      "image/jpeg"
      "image/jpg"
      "image/pjpeg"
      "image/png"
      "image/svg+xml"
      "image/tiff"
      "image/webp"
    ];
    officeSuite = [
      "application/msword"
      "application/pdf"
      "application/rtf"
      "application/vnd.oasis.opendocument.text"
      "application/vnd.oasis.opendocument.spreadsheet"
      "application/vnd.oasis.opendocument.presentation"
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "application/vnd.openxmlformats-officedocument.presentationml.presentation"
      "application/vnd.ms-excel"
      "application/vnd.ms-powerpoint"
    ];
    terminal = [ "terminal" ];
    textEditor = [
      "application/x-shellscript"
      "text/plain"
    ];
    videoPlayer = [
      "video/mp2t"
      "video/mkv"
      "video/mp4"
      "video/mpeg"
      "video/ogg"
      "video/webm"
    ];
  };
  
  # Fancy `map` function
  associations = with lists;
  listToAttrs (
    flatten (mapAttrsToList (key: map (type: attrsets.nameValuePair type defaultApps."${key}")) mimeMap)
  );
in {
  xdg = { 
    configFile."mimeapps.list".force = true;
    mimeApps = {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
    userDirs = {
      enable = true;
      desktop = null;
      templates = null;
      publicShare = null;
      createDirectories = true;
    };
  };
}
