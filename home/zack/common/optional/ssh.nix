{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      pi = {
        user = "pi";
        hostname = "192.168.4.11";
        port = 2211;
        identityFile = "~/.ssh/id_laptop";
      };

      pi-remote = {
        user = "pi";
        hostname = "emeraldbroam.freeddns.org";
        port = 2211;
        identityFile = "~/.ssh/id_laptop";
      };
    };
  };
}
