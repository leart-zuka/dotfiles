{ pkgs, ... }:
{
  home.username = "lz";
  home.homeDirectory = "/home/lz";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
