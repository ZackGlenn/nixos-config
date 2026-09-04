{ pkgs, ... }:
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
      DEFAULT = "https://www.startpage.com/sp/search?query={}&prfe=d92745cefd614b4fa5f1937f4c3f9ead37c2aaba167bef6e804095314ac1a4918fc5b82be5c2f61f05d1bd49d8cebc3eda1aa7489edd6e783b31728915c8039111a3c64ecdb6ecc1dabe1b42403c5abd";
      sp = "https://www.startpage.com/sp/search?query={}&prfe=d92745cefd614b4fa5f1937f4c3f9ead37c2aaba167bef6e804095314ac1a4918fc5b82be5c2f61f05d1bd49d8cebc3eda1aa7489edd6e783b31728915c8039111a3c64ecdb6ecc1dabe1b42403c5abd";
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
      fileselect = {
        handler = "external";
        single_file.command = [
          "kitty"
          "sh"
          "-c"
          "yazi --chooser-file {}"
        ];
      };
      colors.webpage.preferred_color_scheme = "dark";
      content = {
        blocking.enabled = true;
        javascript.clipboard = "access";
        pdfjs = true;
      };
      # Include startpage settings in the homepage urls. Required because qute://start/ ignores the startpage preferences for some reason
      url.default_page = "https://www.startpage.com/do/mypage.pl?prfe=a007c5bf72a65672ca4414d5ca5c8462d9da95ad1e536002c2f12493f4de5438373228e918c1a13613a355e3224ee9b9b770ac40114d5490a629b3d243aeeebc5cedc0ea1edbf6375d7668b4559767";
      url.start_pages = "https://www.startpage.com/do/mypage.pl?prfe=a007c5bf72a65672ca4414d5ca5c8462d9da95ad1e536002c2f12493f4de5438373228e918c1a13613a355e3224ee9b9b770ac40114d5490a629b3d243aeeebc5cedc0ea1edbf6375d7668b4559767";
    };
    greasemonkey = [
      (pkgs.writeText "YouTube-Theater-Mode.js" ''
        // ==UserScript==
        // @name        YouTube - Always Theater Mode
        // @namespace   r-a-y/youtube/theater
        // @description Set the default viewing mode to Theater Mode.
        // @include     https://www.youtube.com/*
        // @version     1.4.4
        // @grant       none
        // @run-at      document-start
        // @license     GPL v3
        // ==/UserScript==
         
        // Toggle Theater Mode after YouTube finishes loading a video.
        window.addEventListener("yt-navigate-finish", function(event) {
          var newPlayer = document.querySelector('button.ytp-size-button')
         
          setTimeout(()=> {
            if ( newPlayer && null === document.getElementsByTagName('ytd-watch-flexy')[0].getAttribute('full-bleed-player') ) {
              newPlayer.click()
            }
          }, 600)
        })
      '')
    ];
  };

  # Make Qutebrowser the default browser
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
      "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
    };
  };
}
