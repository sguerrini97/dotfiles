
ffmpeg_h265 () {
	ffmpeg -i "$1" -map 0 -map -v -map V -map -0:d -c:v libx265 -c:s copy -crf 25 -max_muxing_queue_size 4096 "$2";
}

ffmpeg_h265 ()
{
    ffmpeg \
        -i "$1" \
        -map 0:v:0 \
        -map 0:a \
        -map 0:s \
        -map 0:t? \
        -c:v libx265 -crf 25 \
        -c:a aac -q:a 2 \
        -c:s copy \
        -c:t copy \
        -max_muxing_queue_size 4096 \
        "$2"
}

alias bc='bc -l '
alias l='ls -lh '
alias ll='ls -lah '
alias sudo='sudo '
alias mpv='flatpak run io.mpv.Mpv '
alias vlc='flatpak run org.videolan.VLC '
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
