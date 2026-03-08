{ ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "/home/zack/.ssh/id_zack";
      };
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
    };
    enableDefaultConfig = false;
  };
}
