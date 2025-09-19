# In your NixOS configuration (where you have programs.firefox.enable)
{stylix , ...}:
{

  # Your existing Firefox configuration
  programs.firefox = {
    enable = true;
    
    # preferences = {
    #       # # Theme integration
    #       # "ui.systemUsesDarkTheme" = true;
    #       # "browser.theme.dark-private-windows" = true;
    #       # # "browser.display.use_system_colors" = true;
    #       # "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          
    #       # # Privacy settings
    #       # # "browser.newtabpage.activity-stream.showSponsored" = false;
    #       # # "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    #       # # "browser.startup.homepage" = "about:home";
          
    #       # # Performance
    #       # "gfx.webrender.all" = true;
    #       # "media.ffmpeg.vaapi.enabled" = true;
    #     };
    
    # You can also set policies if needed
    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";
    };
  };

  stylix.targets.firefox.profileNames = [ "default" ];
}