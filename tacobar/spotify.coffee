command: "osascript -e 'tell application \"Spotify\" to player state as string' && osascript -e 'tell application \"Spotify\" to artist of current track as string' && osascript -e 'tell application \"Spotify\" to name of current track as string'"
refreshFrequency: 1000

style: """
    width: auto
    height 25px
    left: 0px
    font: 12px "MiniMono", "Font Awesome 5 Free", "Font Awesome 5 Free Regular", "Font Awesome 5 Free Solid", "Font Awesome 5 Brands", "Font Awesome 5 Brands Regular"
    color: #efefef
    background: #1c1c1c
    padding-left: 10px

    div.spotify
        height: 10px
        padding-top: 5px
        padding-bottom: 5px
        overflow: hidden
        text-overflow: ellipsis

    span.icon
        color: #26ffd4
        font-size: 10px
"""

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./assets/colors.css">
    <link rel="stylesheet" type="text/css" href="./assets/fontawesome-all.min.css">
    <div class="spotify">
        <span class="icon"></span>
        <span class="artist"></span>
        -
        <span class="title"></span>
    </div>
  """

update: (output, domEl) ->
    spotify = output.split('\n')

    status = spotify[0]
    artist = spotify[1]
    title = spotify[2]

    out = artist + " - " + title

    $(domEl).find('.artist').html(artist);
    $(domEl).find('.title').html(title);
