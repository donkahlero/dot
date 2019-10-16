command: './tacobar/infos/timedatebatt'

refreshFrequency: 1000

render: (output) ->
  """
    <div class="timedatebatt-container">
      <span class="wifi-icon"></span>
      <span class="wifi-content"></span>
      &nbsp;|&nbsp;
      <span class="bat-icon"></span>
      <span class="bat-content"></span>
      &nbsp;|&nbsp;
      <span class="timedate-icon"></span>
      <span class="timedate-content"></span>
    </div>
  """

style: """
  color: #efefef
  background: #1c1c1c
  right: 0px
  height: 25px
  width: auto
  font: 12px "MiniMono", "Font Awesome 5 Free", "Font Awesome 5 Free Regular", "Font Awesome 5 Free Solid", "Font Awesome 5 Brands", "Font Awesome 5 Brands Regular"
  text-align: right
  padding-right: 10px

  div.timedatebatt-container
    padding-top: 6px;
    padding-bottom: 6px;

  span.wifi-icon
    color: #fc59a6
    font-size: 10px

  span.timedate-icon
    color: #fc59a6
    font-size: 10px

  span.bat-icon
    color: #fc59a6
    font-size: 10px

  span.bat-icon.good
    color: #5c9fff

  span.bat-icon.low
    color: #fdaa5a

  span.bat-icon.critical
    color: #5c9fff
"""

update: (output, domEl) ->
  values = output.split('@')

  wifi = values[0]
  timedate = values[1]
  batStatus = values[2]
  batPerc = values[3]

  if batStatus == "charging"
    $(domEl).find('.bat-icon').addClass('low').stop().html("")
  else if batStatus == "full"
    $(domEl).find('.bat-icon').addClass('good').stop().html("")
  else
    if batPerc < 20
      $(domEl).find('.bat-icon').addClass('critical').stop().html("")
    else if batPerc < 40
      $(domEl).find('.bat-icon').addClass('low').stop().html("")
    else if batPerc < 60
      $(domEl).find('.bat-icon').addClass('low').stop().html("")
    else if batPerc < 80
      $(domEl).find('.bat-icon').addClass('low').stop().html("")
    else
      $(domEl).find('.bat-icon').removeClass('charging').stop().html("")

  $(domEl).find('.wifi-content').html(wifi)
  $(domEl).find('.bat-content').html(batPerc + "%")
  $(domEl).find('.timedate-content').html(timedate)
