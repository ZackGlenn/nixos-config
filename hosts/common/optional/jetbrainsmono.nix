{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome
    (nerdfonts.override { fonts = ["JetBrainsMono"]; })
  ];

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono" ];
}
