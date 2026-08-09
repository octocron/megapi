{
  hardware.raspberry-pi.config = {
    all = {
      options = {
        enable_uart = {
          enable = true;
          value = true;
        };
        uart_2ndstage = {
          enable = true;
          value = true;
        };

        # Force HDMI detection
        hdmi_force_hotplug = {
          enable = true;
          value = true;
        };

        # Allocate two DRM framebuffers
        max_framebuffers = {
          enable = true;
          value = 2;
        };

        # Useful for diagnostics if EDID is being problematic
        hdmi_force_edid_audio = {
          enable = true;
          value = true;
        };
      };

      base-dt-params = {
        pciex1 = {
          enable = true;
          value = "on";
        };
        pciex1_gen = {
          enable = true;
          value = "3";
        };
      };

      overlays = [
        "vc4-kms-v3d"
      ];
    };
  };
}
