{
  #-----------------------SECURITY-----------------------#
  security = {
    polkit.enable = true;
    rtkit.enable = true;

    sudo = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
  };
}
