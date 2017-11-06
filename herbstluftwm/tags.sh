#!/bin/bash
# Blue color theme
#dzen_fg="#D0D0D0"
#dzen_bg="#1C1C1C"
#normal_fg=""
#normal_bg=
#viewed_fg="#000000"
#viewed_bg="#009DD8"
#urgent_fg=
#urgent_bg="#DF8787"
#used_fg="#009DD8"
#used_bg=

# lb.theme
dzen_fg="#1AA"
dzen_bg="#333"
normal_fg=""
normal_bg=
viewed_fg="#333"
viewed_bg="#1AA"
urgent_fg=
urgent_bg="#F99"
used_fg="#AA1"
used_bg=

herbstclient --idle 2>/dev/null | {
    tags=( $(herbstclient tag_status) )
    while true; do
        for tag in "${tags[@]}" ; do
            case ${tag:0:1} in
                '#') cstart="^fg($viewed_fg)^bg($viewed_bg)" ;;
                '+') cstart="^fg($viewed_fg)^bg($viewed_bg)" ;;
                ':') cstart="^fg($used_fg)^bg($used_bg)"     ;;
                '!') cstart="^fg($urgent_fg)^bg($urgent_bg)" ;;
                *)   cstart=''                               ;;
            esac
            dzenstring="${cstart}^ca(1,herbstclient use ${tag:1}) ${tag:1} "
            dzenstring+="^ca()^fg()^bg()"
            echo -n "$dzenstring"
        done
        echo
        read hook || exit
        case "$hook" in
            tag*) tags=( $(herbstclient tag_status) ) ;;
            quit_panel*) exit ;;
        esac
    done
} | dzen2 -h 16 -fn '-*-profont-*-*-*-*-10-*-*-*-*-*-*-*' -ta l -sa l \
                    -w 1920 -fg "$dzen_fg" -bg "$dzen_bg" -e 'button3='
