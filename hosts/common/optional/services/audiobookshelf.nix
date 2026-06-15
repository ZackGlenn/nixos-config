{ config, ... }:
{
  services.audiobookshelf = {
    enable = true;
    openFirewall = true;
  };

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    virtualHosts."emeraldbroam.freeddns.org" = {
      forceSSL = true;
      locations = {
        "/" = {
          proxyPass = "http://127.0.0.1:${builtins.toString config.services.audiobookshelf.port}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_redirect http://$scheme://;
          '';
        };
        "/robots.txt" = {
          extraConfig = ''
            rewrite ^/(.*)  $1;
            return 200 "User-agent: *\nDisallow: /";
          '';
        };
      };
      useACMEHost = "emeraldbroam.freeddns.com";
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "santhidenjoyer+acme@gmail.com";
    certs."emeraldbroam.freeddns.com" = {
      webroot = "/var/lib/acme/acme-challenge";
    };
  };
}
