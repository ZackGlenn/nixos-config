{ config, lib, ... }: {
  programs.tofi = {
    enable = true;
    settings = {
      terminal = "kitty";
      width = "100%";
      height = "100%";
      border-width = "0";
      outline-width = "0";
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = "25";
      num-results = "5";
      font = "JetBrainsMono";
      background-color = "#000A";
    };
  };


  # Workaround for tofi not recognizing changes to .desktop files
  # See https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
  home.activation.regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    tofi_cache=${config.xdg.cacheHome}/tofi-drun
    [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
  '';
}
