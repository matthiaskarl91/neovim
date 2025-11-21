# This overlay, when applied to nixpkgs, adds the final neovim derivation to nixpkgs.
{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;
  pkgs-wrapNeovim = prev;

  mkNvimPlugin =
    src: pname:
    pkgs.vimUtils.buildVimPlugin {
      inherit pname src;
      version = src.lastModifiedDate;
    };
  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  basePackages = with pkgs; [
    ripgrep
    fd
    fzf
  ];
  # Extra packages that should be included on nixos but don't need to be bundled
  extraPackages = with pkgs; [
    # linters
    alejandra
    yamllint
    jq
    hadolint
    nixfmt
    shellcheck
    luajitPackages.luacheck
    eslint_d

    # LSPs
    astro-language-server
    gopls
    lua-language-server
    nil
    basedpyright

    #other
    jujutsu

    #treesitter
    tree-sitter
    tree-sitter-grammars.tree-sitter-query
    tree-sitter-grammars.tree-sitter-graphql
    tree-sitter-grammars.tree-sitter-typescript
    vimPlugins.nvim-treesitter-parsers.astro

  ];
in
{
  nvim-pkg = mkNeovim {
    appName = "nvim";
    extraPackages = basePackages ++ extraPackages;
    withNodeJs = false;
  };

  nvim-min-pkg = mkNeovim {
    appName = "nvim";
    extraPackages = basePackages;
    withNodeJs = false;
    withSqlite = false;
  };

  # This is meant to be used within a devshell.
  # Instead of loading the lua Neovim configuration from
  # the Nix store, it is loaded from $XDG_CONFIG_HOME/nvim-dev
  nvim-dev = mkNeovim {
    extraPackages = basePackages ++ extraPackages;
    appName = "nvim-dev";
    wrapRc = false;
  };

  # This can be symlinked in the devShell's shellHook
  nvim-luarc-json = final.mk-luarc-json { };
}
