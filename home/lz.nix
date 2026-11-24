{ config, pkgs, ... }:
 
let
  # Symlink straight into the repo (not a copy in /nix/store), so edits
  # take effect immediately without a rebuild. Assumes the repo lives at ~/dotfiles.
  dots = "${config.home.homeDirectory}/Documents/dotfiles/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
  home.username = "lz";
  home.homeDirectory = "/home/lz";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
 
  # ───────────────────────── Dotfiles ─────────────────────────
  xdg.configFile = {
    # Host-specific: this machine uses the laptop variant
    "hypr".source = link "hypr_laptop";
 
    # Shared between laptop and desktop
    "waybar".source        = link "waybar";
    "fuzzel".source        = link "fuzzel";
    "foot".source          = link "foot";
    "kitty".source         = link "kitty";
    "nvim".source          = link "nvim";
    "tmux".source          = link "tmux";
    "yazi".source          = link "yazi";
    "zathura".source       = link "zathura";
    "ncmpcpp".source       = link "ncmpcpp";
    "git".source           = link "git";
    "scripts".source       = link "scripts";
    "starship.toml".source = link "starship.toml";
 
    # fish: link the pieces individually, so fish_variables (machine-local
    # state that fish rewrites constantly) stays out of the repo
    "fish/config.fish".source  = link "fish/config.fish";
    "fish/fish_plugins".source = link "fish/fish_plugins";
    "fish/functions".source    = link "fish/functions";
    "fish/conf.d".source       = link "fish/conf.d";
    "fish/completions".source  = link "fish/completions";
  };
 
  # ──────────────── Programs your configs call ────────────────
  home.packages = with pkgs; [
    # Hyprland session (autostart, binds, hyprlock/hyprpaper configs)
    hyprpaper hyprlock
    dunst libnotify            # notifications + notify-send (waybar power menu)
    grim slurp swappy          # screenshot scripts
    brightnessctl playerctl    # media/brightness keys
    pavucontrol                # waybar audio click
    kitty                      # waybar network click (kitty nmtui)
 
    # Shell / terminal tools
    starship
    tmux
    yazi
    btop
    lazygit
    ripgrep fd                 # telescope.nvim
    zathura
    ncmpcpp
    git-lfs                    # your git config uses the lfs filter
    pokeget-rs
    zoxide
 
    # Neovim: LSPs/tools from Nix instead of Mason (Mason binaries rarely run on NixOS)
    pyright
    ruff
    black
    mypy
    typescript-language-server
    vscode-langservers-extracted   # eslint
    rust-analyzer
    gcc                            # nvim-treesitter compiles parsers
    nodejs                         # markdown-preview, ts tooling
    (python3.withPackages (ps: [ ps.debugpy ]))   # nvim-dap-python
  ];
 
  # Polkit agent (replaces polkit-kde-agent in your autostart)
  services.hyprpolkitagent.enable = true;
}

