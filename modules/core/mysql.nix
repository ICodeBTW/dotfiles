# MySQL System Configuration for NixOS
# Add this to your /etc/nixos/configuration.nix or import it as a module

{ config, pkgs, ... }:

{
  # MySQL Database Service
  services.mysql = {
    enable = true;
    package = pkgs.mysql80;
    
    # Data directory (default: /var/lib/mysql)
    dataDir = "/var/lib/mysql";
    
    # Bind to localhost only for security (default)
    # bind = "127.0.0.1";
    
    # Port configuration (default: 3306)
    # port = 3306;
    
    # Root password file (optional, for automation)
    # initialPasswordFile = "/path/to/mysql-root-password";
    
    # Create initial databases
    # initialDatabases = [
    #   { name = "myapp"; }
    #   { name = "development"; }
    # ];
    
    # # Ensure databases exist
    # ensureDatabases = [
    #   "myapp"
    #   "development"
    # ];
    
    # Create users with specific permissions
    # ensureUsers = [
    #   {
    #     name = "myapp_user";
    #     ensurePermissions = {
    #       "myapp.*" = "ALL PRIVILEGES";
    #     };
    #   }
    #   {
    #     name = "dev_user";
    #     ensurePermissions = {
    #       "development.*" = "ALL PRIVILEGES";
    #     };
    #   }
    # ];
    
    # MySQL configuration settings
    settings = {
      mysqld = {
        # Basic settings
        bind_address = "127.0.0.1";
        port = 3306;
        
        # Buffer settings
        key_buffer_size = "16M";
        max_allowed_packet = "16M";
        table_open_cache = 64;
        sort_buffer_size = "512K";
        net_buffer_length = "8K";
        read_buffer_size = "256K";
        read_rnd_buffer_size = "512K";
        myisam_sort_buffer_size = "8M";
        
        # Connection settings
        max_connections = 100;
        thread_cache_size = 8;
        
        # Query cache (disabled by default in MySQL 8.0)
        # query_cache_limit = "1M";
        # query_cache_size = "16M";
        
        # Logging
        log_error = "/var/log/mysql/error.log";
        # log_queries_not_using_indexes = true;
        # slow_query_log = true;
        # slow_query_log_file = "/var/log/mysql/slow.log";
        # long_query_time = 2;
        
        # InnoDB settings
        innodb_buffer_pool_size = "128M";
        innodb_log_file_size = "48M";
        innodb_log_buffer_size = "16M";
        innodb_flush_log_at_trx_commit = 1;
        innodb_lock_wait_timeout = 50;
        
        # Character set
        character_set_server = "utf8mb4";
        collation_server = "utf8mb4_unicode_ci";
        
        # Security settings
        local_infile = false;
        
        # Performance schema (can be disabled to save memory)
        performance_schema = true;
      };
    };
  };
  
  # Open firewall for MySQL (only if needed for remote connections)
  # networking.firewall.allowedTCPPorts = [ 3306 ];
  
  # System packages for MySQL administration
  environment.systemPackages = with pkgs; [
    mysql80          # MySQL client and utilities
    mysql-workbench  # GUI administration tool
  ];
  
  # Ensure log directory exists with proper permissions
  systemd.tmpfiles.rules = [
    "d /var/log/mysql 0755 mysql mysql -"
  ];
}