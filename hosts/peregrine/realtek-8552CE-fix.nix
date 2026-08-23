{ ... }: {

  boot.extraModprobeConfig = ''
    # Should improve wifi stability on Realtek 8552 family chipsets
    # See https://wiki.archlinux.org/title/Network_configuration/Wireless#RTW89
    options rtw89_pci disable_aspm_l1=y disable_aspm_l1ss=y
    options rtw89_core disable_ps_mode=y
  '';
}
