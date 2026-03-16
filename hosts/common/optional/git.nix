{...}: {
  programs.git.enable = true;
  programs.git.config = {
    user = {
      name = "Zack Glenn";
      email = "ZackGlenn05@gmail.com";
    };
  };
}
