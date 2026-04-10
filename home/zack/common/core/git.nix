{ ... }:
{
  programs.git = {
    enable = true;
    signing.format = "openpgp";
    settings.user = {
      email = "ZackGlenn05@gmail.com";
      name = "Zack Glenn";
    };
  };
}
