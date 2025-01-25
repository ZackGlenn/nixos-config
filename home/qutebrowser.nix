{...}:
{
programs.qutebrowser = {
  enable = true;
  keyBindings = {
    normal = {
      "J" = "tab-prev";
      "K" = "tab-next";
      "gJ" = "tab-move -";
      "gK" = "tab-move +";
    };
  };
  searchEngines = {
    DEFAULT = "https://startpage.com/sp/search?query={}";
    aw = "https://wiki.archlinux.org/?search={}";
    nw = "https://wiki.nixos.org/index.php?search={}";
    ddg = "https://duckduckgo.com/?ia=web&q={}";
    gm = "http://maps.google.com/?q={}";
    go = "https://www.google.com/search?q={}";
    wp = "https://en.wikipedia.org/w/index.php?title=Special:Search&search={}";
    yt = "https://www.youtube.com/results?search_query={}";
  };
  quickmarks = {
    sync = "http://localhost:8384";
    youtube = "https://youtube.com/";
    gmail = "https://mail.google.com/mail/u/0/#inbox";
    history = "qute://history/";
    scihub = "https://www.sci-hub.st/";
    twitch = "https://twitch.tv/directory/following";
    monkeytype = "https://monkeytype.com";
    reddit = "https://reddit.com/";
    coppermind = "https://coppermind.net/wiki/Coppermind:Welcome";
    utawifi = "http://utawifi.com/";
    y = "https://www.youtube.com";
    g = "https://mail.google.com/mail/u/0/#inbox";
    h = "qute:history/";
    s = "https://www.sci-hub.st/";
    w = "https://twitch.tv/directory/following";
    m = "https://monkeytype.com/";
    r = "https://reddit.com/";
    cm = "https://copppermind.net/wiki/Copppermind:Welcome";
    uta = "https://utawifi.com/";
    kde = "http://networkcheck.kde.org/";
    b = "https://bsky.app/";
    l = "https://lichess.org/";
    eb = "https://ebird.org/home";
    aab = "https://www.allaboutbirds.org/news/";
    nw = "https://wiki.nixos.org";
    np = "https://search.nixos.org/packages";
    hm = "https://home-manager-options.extranix.com/";
    no = "https://search.nixos.org/options";
    ch = "https://www.chess.com/";
    hw = "https://wiki.hyprland.org/";
  };
  settings = {
    colors.webpage.preferred_color_scheme = "dark";
    content = {
      blocking.enabled = true;
      javascript.clipboard = "access";
      pdfjs = true;
    };
    url.default_page = "qute://start";
    url.start_pages = "qute://start";
  };
};
}
