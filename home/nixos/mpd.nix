{ config, ... }:
{
  services.mpd = {
    enable = true;
    extraConfig = ''
      auto_update "yes"
      audio_output {
        type    "pipewire"
        name    "Pipewire Sound Server"
      }
      audio_output {
        type            "fifo"
        name            "my_fifo"
        path            "/tmp/mpd.fifo"
        format          "44100:16:2"
      }
    '';
    musicDirectory = "/home/rahmat/Music";
    dbFile = "/home/rahmat/.local/share/mpd/database";
    playlistDirectory = "/home/rahmat/.local/share/mpd/playlists";
    network.listenAddress = "127.0.0.1";
    network.port = 6600;
  };
}
