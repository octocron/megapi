{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # cli tools
    age
    aria2 # C++: ↑ wget
    bottom # Rust: ↑ htop
    bzip3 # C: ↑ bzip2
    comma # Rust: like nix shell
    curl # C:
    diff-so-fancy # Perl: ↑ diff
    dust # Rust: ↑ du
    duf # Go: ↑ df
    exiftool # Perl: ↑ exif
    fd # Rust: ↑ find
    ffmpeg # C:
    ffmpegthumbnailer # C++: lightweight video thumbnailer
    gnupg # C: gpg **
    go # Assembly: garbage collector | C++: frontend
    gping # Rust: ↑ ping
    inxi # Bash: ↑ system info
    just # ↑ make
    lazydocker # Go: full docker mgmt app
    lua # C:
    man-db # C:
    most # C: ↑ less
    nebula
    nix-melt # Rust: ranger-like flake.lock viewer
    nurl # Rust: ↑ fetch hash from repo url
    pciutils # C: Bins (lspci, pcilmr, setpci) needed for inxi as inspection tool
    pkg-config # C:
    procs # Rust: ↑ ps
    rage # Rust: ↑ age
    ripgrep # Rust: ↑ grep
    ripgrep-all # Rust: ↑ extend rg to search pdf, docx, etc
    rsync # C: inc file xfer
    rustic # Rust: deduplicated backup
    rustup # Rust: rust toolchain
    scc # Go: code count
    sd # Rust: ↑ sed
    sops
    ssh-to-age
    tokei # Rust: ↑ stats about code project
    tre # C: ↑ tree
    trippy # Rust: ↑ traceroute + ping + bandwhich in one
    unrar # C:
    unzip # C:
    uutils-coreutils # Rust: ↑ coreutils rewrite
    viddy # Rust: ↑ watch
    vim # C: ↑↑ modal editor
    zip # C: zip files
    zoxide # Rust: ↑ cd

    # nix search
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}
