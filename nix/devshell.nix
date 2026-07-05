{
  lib,
  stdenv,
  mkShell,
  rustc,
  cargo,
  rustfmt,
  clippy,
  rust-analyzer,
  cmake,
  mold,
  clang,
  libclang,
  pkg-config,
  haskell-language-server,
}:

mkShell {
  packages = [
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    cmake
    clang
    pkg-config
    # On PATH so the built-in `haskell-language-server` LSP entry can be
    # exercised against Haskell projects from within the dev shell.
    haskell-language-server
  ]
  ++ lib.optionals stdenv.isLinux [ mold ];

  LIBCLANG_PATH = "${libclang.lib}/lib";
}
