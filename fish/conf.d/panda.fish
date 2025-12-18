function panda
    # Foreground
    printf '\e]10;#f0f0f0\e\\'

    # Background
    printf '\e]11;#1d1e20\e\\'

    # Highlight Background
    printf '\e]17;#f0f0f0\e\\'

    # Highlight Foreground
    printf '\e]19;#1d1e20\e\\'

    # black
    printf '\e]4;0;#1f1f20\e\\'
    printf '\e]4;8;#5c6370\e\\'

    # red
    printf '\e]4;1;#fb055a\e\\'
    printf '\e]4;9;#fb055a\e\\'

    # green
    printf '\e]4;2;#26ffd4\e\\'
    printf '\e]4;10;#26ffd4\e\\'

    # yellow
    printf '\e]4;3;#fdaa5a\e\\'
    printf '\e]4;11;#febe7e\e\\'

    # blue
    printf '\e]4;4;#5c9fff\e\\'
    printf '\e]4;12;#55adff\e\\'

    # magenta
    printf '\e]4;5;#fc59a6\e\\'
    printf '\e]4;13;#fd95d0\e\\'

    # cyan
    printf '\e]4;6;#26ffd4\e\\'
    printf '\e]4;14;#26ffd4\e\\'

    # white
    printf '\e]4;7;#f0f0f0\e\\'
    printf '\e]4;15;#f0f0f0\e\\'
end
