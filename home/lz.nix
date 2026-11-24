{ config, pkgs, ... }:
let
  link = path: config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/config/${path}";
in
{
  home.username = "lz";
  home.homeDirectory = "/home/lz";
  home.stateVersion = "26.05";
  programs.home-manager.enable = true;

  xdg.configFile = {
    "hypr".source = link "hypr";
    "waybar".source = link "waybar";
    "fuzzel".source = link "fuzzel";
    "foot".source = link "foot";
    "nvim".source = link "nvim";
    "hypr".source = link "dunst";
    "yazi".source = link "yazi";
    "zathura".source = link "zathura";
    "tmux".source = link "tmux";
    "git".source = link "git";

  };
}
