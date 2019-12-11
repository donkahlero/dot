import { css } from "uebersicht"

export const refreshFrequency = 1000 * 60 * 30; // 30 Min

// Generic CSS
export const className = `
    position: absolute;
    bottom: 350px;
    left: 10px;
`

export const command = `curl -s "wttr.in/moon?F" | aha`

export const render = ({output, error}) => {
    return error ? (
        <div>ERROR: <strong>{String(error)}</strong></div>
    ) : (
        <div dangerouslySetInnerHTML={{__html: output}} />
    );
}
