import { css } from "uebersicht"

export const refreshFrequency = 1000 * 60 * 15; // 15 Min

// Generic CSS
export const className = `
    position: absolute;
    top: 300px;
    left: 1130px;
    width: 200px;
    color: #f0f0f0;
    font-family: "MiniMono";
    font-size: 12px;
`

export const command = `curl -s "https://www.aviationweather.gov/adds/dataserver_current/httpparam?dataSource=metars&requestType=retrieve&format=xml&&hoursBeforeNow=5&mostRecent=true&stationString=EDDF" | awk -F'[<>]' '/<raw_text>/{print $3}'`

export const render = ({output, error}) => {
    return error ? (
        <div>ERROR: <strong>{String(error)}</strong></div>
    ) : (
        <div dangerouslySetInnerHTML={{__html: output}} />
    );
}
