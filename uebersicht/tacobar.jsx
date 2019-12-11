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
    height: 24px;
`

const spaces = css`
    margin: 0;
    padding: 0;
    list-style: none;
    list-style-type: none;
    height: 100%;
`

const space = css`
    display: inline-block;
    padding-top: 6px;
    padding-bottom: 6px;
    padding-left: 5px;
    padding-right: 5px;
`

const focused = css`
    color: #1d1e20;
    background-color: #f0f0f0;
`

const used = css`
    color: #26ffd4;
`

const unused = css`
    color: #f0f0f0;
    background-color: #1d1e20;
`

const hidden = css`
    display: none !important;
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
    padding-right: 8px;
`

function getSpaceStyle(idx, spaces) {
    if (idx == spaces.focused) {
        return focused;
    } else if (spaces.used.includes(idx)) {
        return used;
    } else if (spaces.unused.includes(idx)) {
        return unused;
    } else {
        return hidden;
    }
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
        case "qutebrowser":
            return {
                font:  fa_free,
                icon:  '',      // Compass icon in lack of better one
                color: '#7ebaff' // qutebrowser blue
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
                icon:  '',       // Apple Music Icon
                color: '#fa57c1', // Apple Music Pink
                info:  'Apple Music'
            };
        case "Photoshop":
            return {
                font:  fa_brands,
                icon:  '',      // Adobe Icon
                color: '#8bc3fc' // Photoshop Blue
            };
        case "Adobe Premiere Pro 2020":
            return {
                font:  fa_brands,
                icon:  '',      // Adobe Icon
                color: '#db66ff' // Premiere Pink
            };
        case "MoneyMoney":
            return {
                font:  fa_free,
                icon:  '',      // Dollar Sign Icon
                color: '#85bb65' // Dollar Bill Green
            }
        case "Slack":
            return {
                font:  fa_brands,
                icon:  '',       // Slack Hash
                color: '#e01e5a', // Slack red
                info: 'Slack'     // Does not have a window title
            }
        case "Steam":
            return {
                font:  fa_brands,
                icon:  '',       // Steam Symbol
                color: '#00adee', // Steam Blue
                info:  'Steam'
            }
        case "Affinity Photo":
            return {
                font: fa_free,
                icon:  '',       // Retro Camera
                color: '#eb74ff'  // Affinity Photo Purple
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
    spaces=$(yabai -m query --spaces) && \
    windows=$(yabai -m query --windows) && \
    jo \
        spaces="$(jo \
            used="$(echo $spaces | jq -cr '[.[] | select(.windows != []) | .index]')" \
            unused="$(echo $spaces | jq -cr '[.[] | select(.windows == []) | .index]')" \
            focused="$(echo $spaces | jq -cr '.[] | select(.focused == 1) | .index')" \
        )" \
        application="$(jo \
            name="$(echo $windows | jq -cr '.[] | select(.focused == 1) | .app')" \
            title="$(echo $windows | jq -cr '.[] | select(.focused == 1) | .title')" \
        )" \
        wifi="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk '/ SSID/{print $2}')" \
        batt="$(jo \
            ac="$(system_profiler SPPowerDataType | grep "Connected" | awk '{print tolower($2)}')" \
            perc="$(pmset -g batt | grep -Eo "\\d+%" | cut -d% -f1)" \
        )" \
        date="$(date +"%m/%d/%Y")" \
        time="$(date +"%I:%M %p")"
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

    let appIcon = getAppIcon(output.application.name);
    let battIcon = getBattIcon(output.batt);

    return error ? (
        <div>ERROR: <strong>{String(error)}</strong></div>
    ) : (
        <div>
            <div className={left}>
                <span className={`${app_icon} ${appIcon.font} ${css({ color: appIcon.color })}`}>{appIcon.icon}</span>
                <span className={app_info}>{(appIcon.info ? appIcon.info : output.application.title)}</span>
            </div>
            <div className={center}>
                <ul className={`${spaces}`}>
                    <li className={`${space} ${getSpaceStyle(1, output.spaces)}`}>0001</li>
                    <li className={`${space} ${getSpaceStyle(2, output.spaces)}`}>0010</li>
                    <li className={`${space} ${getSpaceStyle(3, output.spaces)}`}>0011</li>
                    <li className={`${space} ${getSpaceStyle(4, output.spaces)}`}>0100</li>
                    <li className={`${space} ${getSpaceStyle(5, output.spaces)}`}>0101</li>
                    <li className={`${space} ${getSpaceStyle(6, output.spaces)}`}>0110</li>
                    <li className={`${space} ${getSpaceStyle(7, output.spaces)}`}>0111</li>
                    <li className={`${space} ${getSpaceStyle(8, output.spaces)}`}>1000</li>
                    <li className={`${space} ${getSpaceStyle(9, output.spaces)}`}>1001</li>
                </ul>
            </div>
            <div className={right}>
                <span className={`${fa_free} ${icon} ${css({ color: '#fb055a' })}`}></span>
                {output.wifi}
                &emsp;<span className={spacer}>|</span>&emsp;
                <span className={`${fa_free} ${icon} ${css({ color: battIcon.color })}`}>{battIcon.icon}</span>
                {output.batt.perc}{'%'}
                &emsp;<span className={spacer}>|</span>&emsp;
                <span className={`${fa_free} ${icon} ${css({ color: '#55adff' })}`}></span>
                {output.date}
                &emsp;<span className={spacer}>|</span>&emsp;
                <span className={`${fa_free} ${icon} ${css({ color: '#26ffd4' })}`}></span>
                {output.time}
            </div>
        </div>
    );
}
