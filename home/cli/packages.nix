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
    gnupg # C: gpg **
    gping # Rust: ↑ ping
    inxi # Bash: ↑ system info
    just # ↑ make
    lazydocker # Go: full docker mgmt app
    man-db # C:
    most # C: ↑ less
    nebula
    nurl # Rust: ↑ fetch hash from repo url
    pciutils # C: Bins (lspci, pcilmr, setpci) needed for inxi as inspection tool
    procs # Rust: ↑ ps
    rage # Rust: ↑ age
    ripgrep # Rust: ↑ grep
    rsync # C: inc file xfer
    rustic # Rust: deduplicated backup
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
