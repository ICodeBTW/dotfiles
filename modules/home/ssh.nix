{ ... }:
{
  programs.ssh = {
    enable = true;
    
    # Disable default config to avoid future warnings
    enableDefaultConfig = false;
    
    matchBlocks = {
      # Global defaults using "*" pattern
      "*" = {
        addKeysToAgent = "1h";
        controlMaster = "auto";
        controlPath = "~/.ssh/control-%r@%h:%p";
        controlPersist = "10m";
      };
      
      # Your GitHub configuration
      github = {
        host = "github.com";
        hostname = "ssh.github.com";
        user = "git";
        port = 443;
        identityFile = "~/.ssh/id_github";
        identitiesOnly = true;
      };
    };
  };
  
  services.ssh-agent.enable = true;
}