{ ... }:
{
  programs.ssh = {
    startAgent = true;
    knownHosts = {
      pi = {
        extraHostNames = [
          "pi-remote"
          "emeraldbroam.freeddns.org"
          "192.168.4.11"
        ];
        publicKey = "192.168.4.11 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP1WbX6Zc7E4N0XrPDXDAq5KLZFXS0CRdQCzXjWEG3b0";
      };
    };
  };

  services.gnome.gcr-ssh-agent.enable = false; # enabled by default for some reason
}
