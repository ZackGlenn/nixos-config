{pkgs, ...}: {
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono" ];
}
