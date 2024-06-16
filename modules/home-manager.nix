{config, lib,pkgs,...}:
{
  config = {};
  options = {
    hello = {
      type = lib.types.str;
      default = "world";
    };
  }:
}
