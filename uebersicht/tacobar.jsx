import { css } from "uebersicht"

export const refreshFrequency = 1000; // 1 second

// Generic CSS
export const className = `
    font-family: MiniMono;
    font-size: 12px;
    color: #f0f0f0;
    background-color: #1d1e20;
    width: 100%;
    height: 24px;
`

const spacer = css`
    font-weight: bold;
    color: #5c6370;
`

const fa_free = css`
    font-family: 'Font Awesome 5\ Free';
    font-weight: 900;
`

const fa_brands = css`
    font-family: 'Font Awesome 5\ Brands';
    font-weight: 400;
`

// Left-hand side related CSS
const left = css`
    width: calc(33.33333% - 10px);
    height: 24px;
    display: inline-flex;
    float: left;
    text-align: left;
    align-items: center;
    padding-left: 10px;
`

const app_icon = css`
    font-size: 12px;
`

const app_info = css`
    padding-left: 15px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
`

// Center related CSS
const center = css`
    width:33.33333%;
    float: left;
    text-align:center;
    padding-top: 6px;
    padding-bottom: 6px;
`

const spaces = css`
    margin: 0;
    padding: 0;
    list-style: none;
    list-style-type: none;
`

const space = css`
    display: inline-block;
    padding-left: 5px;
    padding-right: 5px;
`

const focused = css`
    color: #fb055a;
`

const occupied = css`
    color: #26ffd4;
`


// Right-hand
const right = css`
    width: calc(33.33333% - 10px);
    float: left;
    text-align: right;
    padding-right: 10px;
    padding-top: 5px;
    padding-bottom: 7px;
`

const icon = css`
    font-size: 8px;
    color: #5c9fff;
    padding-right: 8px;
`

function getSpaceStyle(currIdx, occIdc, fcsIdx) {
    var classes = [space];

    if (currIdx == fcsIdx) {
        classes.push(focused);
    } else if (occIdc.includes(currIdx)) {
        classes.push(occupied);
    }

    return classes.join(" ");
}

function getBattIcon(batt) {
    if (batt.ac == 'yes') {
        return {
            icon: "",
            color: "#fdaa5a"
        };
    } else if (batt.perc >= 80) {
        return {
            icon: '',
            color: '#26ffd4'
        };
    } else if (batt.perc >= 60) {
        return {
            icon: '',
            color: '#55adff'
        };
    } else if (batt.perc >= 40) {
        return {
            icon: '',
            color: '#febe7e'
        };
    } else if (batt.perc >= 20) {
        return {
            icon: '',
            color: '#fc59a6'
        };
    } else {
        return {
            icon: '',
            color: '#fb055a'
        };
    }
}

function getAppIcon(name) {
    switch (name) {
        case "Firefox":
            return {
                font:  fa_brands,
                icon:  '',      // Firefox Icon
                color: '#e55b0a' // Firefox Orange
            };
        case "kitty":
            return {
                font:  fa_free,
                icon:  '',      // Cat Icon
                color: '#fc59a6' // Panda Rosa
            };
        case "Spotify":
            return {
                font:  fa_brands,
                icon:  '',      // Spotify Icon
                color: '#1db954' // Spotify Green
            };
        case "Music":
            return {
                font:  fa_brands,
                icon:  '',      // Apple Music Icon
                color: '#fa57c1' // Apple Music Pink
            };
        case "Photoshop":
            return {
                font:  fa_brands,
                icon:  '',      // Adobe Icon
                color: '#8bc3fc' // Photoshop Blue
            };
        case "MoneyMoney":
            return {
                font:  fa_free,
                icon:  '',      // Dollar Sign Icon
                color: '#85bb65' // Dollar Bill Green
            }
        default:
            return {
                font:  fa_brands,
                icon:  '',      // Apple Icon for all other apps
                color: '#f9f6ef' // Apple White
            };
    }
}


export const command = `
    res=$(/usr/local/bin/yabai -m query --windows) && \
    /usr/local/bin/jo \
        spaces="$(echo $res | /usr/local/bin/jq -cr '[.[].space]')" \
        active="$(/usr/local/bin/jo \
            index="$(echo $res | /usr/local/bin/jq -cr '.[] | select(.focused == 1) | .space')" \
            app="$(echo $res | /usr/local/bin/jq -cr '.[] | select(.focused == 1) | .app')" \
            title="$(echo $res | /usr/local/bin/jq -cr '.[] | select(.focused == 1) | .title')" \
        )" \
        wifi="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk '/ SSID/{print $2}')" \
        batt="$(/usr/local/bin/jo \
            ac="$(system_profiler SPPowerDataType | grep "Connected" | awk '{print tolower($2)}')" \
            perc="$(pmset -g batt | grep -Eo "\\d+%" | cut -d% -f1)"% \
        )" \
        date="$(date +"%m/%d/%Y")" \
        time="$(date +"%I:%M")"
`

export const render = ({output, error}) => {
    if (error) {
        console.log(error)
    }

    try {
        console.log(encodeURIComponent(output))
        output = JSON.parse(output);
    } catch (error) {
        console.log(error);
        return <div>JSON ERROR</div>
    }

    let appIcon = getAppIcon(output.active.app);
    let battIcon = getBattIcon(output.batt);

    return error ? (
        <div>ERROR: <strong>{String(error)}</strong></div>
    ) : (
        <div>
            <div className={left}>
                <span className={`${app_icon} ${appIcon.font} ${css({ color: appIcon.color})}`}>{appIcon.icon}</span>
                <span className={app_info}>{output.active.title}</span>
            </div>
            <div className={center}>
                <ul className={`${spaces}`}>
                    <li id="desktop1" className={getSpaceStyle(1, output.spaces, output.active.index)}>0001</li>
                    <li id="desktop2" className={getSpaceStyle(2, output.spaces, output.active.index)}>0010</li>
                    <li id="desktop3" className={getSpaceStyle(3, output.spaces, output.active.index)}>0011</li>
                    <li id="desktop4" className={getSpaceStyle(4, output.spaces, output.active.index)}>0100</li>
                    <li id="desktop5" className={getSpaceStyle(5, output.spaces, output.active.index)}>0101</li>
                    <li id="desktop6" className={getSpaceStyle(6, output.spaces, output.active.index)}>0110</li>
                    <li id="desktop7" className={getSpaceStyle(7, output.spaces, output.active.index)}>0111</li>
                    <li id="desktop8" className={getSpaceStyle(8, output.spaces, output.active.index)}>1000</li>
                    <li id="desktop9" className={getSpaceStyle(9, output.spaces, output.active.index)}>1001</li>
                </ul>
            </div>
            <div className={right}>
                <span className={`${fa_free} ${icon}`}></span>
                {output.wifi}
                &emsp;<span className={spacer}>|</span>&emsp;
                <span className={`${fa_free} ${icon} ${css({ color: battIcon.color })}`}>{battIcon.icon}</span>
                {output.batt.perc}
                &emsp;<span className={spacer}>|</span>&emsp;
                <span className={`${fa_free} ${icon}`}></span>
                {output.date}
                &emsp;<span className={spacer}>|</span>&emsp;
                <span className={`${fa_free} ${icon}`}></span>
                {output.time}
            </div>
        </div>
    );
}
