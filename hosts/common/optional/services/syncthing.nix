{...}: {
  # TODO: figure out how to handle the syncthing user and datadir between machines
  services.syncthing = {
    enable = true;
    user = "zack";
    openDefaultPorts = true;
    dataDir = "/home/zack/Sync";
  };
}
