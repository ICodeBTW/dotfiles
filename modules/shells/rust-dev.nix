{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust toolchain
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
    
    # Build dependencies
    pkg-config
    openssl
    
    # Development tools
    git
    just          # Command runner (alternative to make)
    bacon         # Background rust code checker
    cargo-watch   # Auto-rebuild on file changes
    cargo-edit    # Cargo add/rm/upgrade commands
    cargo-udeps   # Find unused dependencies
    cargo-audit   # Security audit
    
    # Optional: for cross-compilation or specific targets
    # gcc
    # llvm
    
    # Optional: database libraries (uncomment as needed)
    # sqlite
    # postgresql
    
    # Optional: system libraries (uncomment as needed)
    # curl
    # zlib
    # libiconv
  ];

  # Environment variables
  shellHook = ''
    echo "🦀 Rust development environment loaded!"
    echo "Rust version: $(rustc --version)"
    echo "Cargo version: $(cargo --version)"
    
    # Set up Rust source path for IDE support and documentation
    export RUST_SRC_PATH="${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}"
    export RUST_BACKTRACE=1
    
    # Verify Rust source path is available
    if [ -d "$RUST_SRC_PATH" ]; then
      echo "Rust source path: $RUST_SRC_PATH"
    else
      echo "Warning: Rust source path not found"
    fi
    
    # Optional: Set default cargo features
    # export CARGO_FEATURES="default"
    
    echo "Happy coding! 🚀"
  '';

  # Rust-specific environment variables
  RUST_BACKTRACE = 1;
  CARGO_HOME = "$HOME/.cargo";
}
