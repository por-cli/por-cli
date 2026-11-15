{ self }:
{ config, lib, pkgs, ... }:

let
  cfg = config.programs.por-cli;
  pkg = self.packages.${pkgs.system}.default;
in
{
  options.programs.por-cli = {
    enable = lib.mkEnableOption "por-cli — terminal video search and playback helper";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkg;
      defaultText = lib.literalExpression "por-cli";
      description = "The por-cli package to install.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };
}
