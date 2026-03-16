{ pkgs, ...}: {
  home.packages = with pkgs; [
    cowsay
    cmatrix
    asciiquarium
  ];
}
