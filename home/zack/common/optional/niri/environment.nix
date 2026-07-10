{ ... }:
{
  programs.niri.settings.environment = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    # HACK: workaround for vidoe rendering issue on qtwebengine 6.11.1
    # see https://qt-project.atlassian.net/browse/QTBUG-145344
    QTWEBENGINE_FORCE_USE_GBM = "0";
  };
}
