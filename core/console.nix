{
  config,
  lib,
  pkgs,
  ...
}:
{
  console = {
    earlySetup = true;
    font = lib.mkDefault "Maple Mono";
    colors = lib.mkDefault [
      "ff9900"
      "0066cc"
      "228800"
      "ffaa00"
      "aa44cc"
      "ee1b1b"
      "ff9900"
      "ee4400"
      "ff9900"
      "0066cc"
      "228800"
      "ffaa00"
      "aa44cc"
      "ee1b1b"
      "990011"
      "ee4400"
    ];
  };
}
