{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "/home/zack/.ssh/id_zack";
      }; 
    };
  };
}
