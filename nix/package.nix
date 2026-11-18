{ lib
, stdenvNoCC
, makeWrapper
, bash
, coreutils
, curl
, fzf
, chafa
, mpv
, yt-dlp
, jq
, libnotify
, gnugrep
, gnused
, gawk
, which
}:

stdenvNoCC.mkDerivation {
  pname = "por-cli";
  version = "0-unstable-2024-11-15";

  src = lib.cleanSource ../.;

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp por-cli $out/bin/por-cli
    chmod +x $out/bin/por-cli

    runHook postInstall
  '';

  postInstall = ''
    wrapProgram $out/bin/por-cli \
      --prefix PATH : ${lib.makeBinPath [
        bash
        coreutils
        curl
        fzf
        chafa
        mpv
        yt-dlp
        jq
        libnotify
        gnugrep
        gnused
        gawk
        which
      ]}
  '';

  meta = with lib; {
    description = "Terminal-based video search and playback helper";
    homepage = "https://github.com/por-cli/por-cli";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    mainProgram = "por-cli";
    maintainers = [ ];
  };
}
