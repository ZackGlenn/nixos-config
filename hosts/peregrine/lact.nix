{ ... }:
{
  services.lact = {
    enable = true;
    settings = {
      version = 5;
      daemon = {
        log_level = "info";
        admin_group = "wheel";
        disable_clock_cleanup = false;
      };
      apply_settings_timer = 5;
      gpus."1002:7550-1849:5417-0000:03:00.0" = {
        fan_control_enabled = false;
        power_cap = 340.0;
        performance_level = "auto";
      };
      current_profile = null;
      auto_switch_profiles = false;
    };
  };
}
