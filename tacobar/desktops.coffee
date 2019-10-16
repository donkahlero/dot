command: "./tacobar/desktops.sh"

refreshFrequency: 5000

render: (output) ->
  """
   <div class="currentDesktop-container">
      <ul>
        <li id="desktop1">0001</li>
        <li id="desktop2">0010</li>
        <li id="desktop3">0011</li>
        <li id="desktop4">0100</li>
        <li id="desktop5">0101</li>
        <li id="desktop6">0110</li>
        <li id="desktop7">0111</li>
        <li id="desktop8">1000</li>
        <li id="desktop9">1001</li>
      <ul>
    </div>
  """

style: """
    left: calc(50% - 200px)
    height: 25px
    width: auto
    margin-left: auto
    margin-right: auto

    ul
        margin: 0
        padding: 0
        list-style: none
        list-style-type: none

    li
        height: 25px
        padding-left: 5px
        padding-right: 5px
        vertical-align: middle
        display: table-cell
        background: #1f1f20
        color: #f0f0f0
        font: 12px "MiniMono"

    li.current
        background: #f0f0f0
        color: #1f1f20

    li.active
        color: #26ffd4
"""

update: (output, domEl) ->
    data = output.split('\n')
    current = data[0]

    for i in [1 .. 9]
        if (data[i] is "active" && i isnt current)
            $(domEl).find('li#desktop' + i).addClass('active')
        else
            $(domEl).find('li#desktop' + i).removeClass('active')

    if ($(domEl).find('li.current').id isnt current)
        $(domEl).find('li.current').removeClass('current')
        $(domEl).find('li#desktop' + current).addClass('current')
