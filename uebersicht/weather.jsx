import { css } from "uebersicht"

export const refreshFrequency = 1000 * 60 * 30; // 30 Min

// Generic CSS
export const className = `
    position: absolute;
    top: 200px;
    left: 1100px;
    color: #f0f0f0;
`

export const command = `curl -s "wttr.in/EDDF?0AFQ" | aha`

export const render = ({output, error}) => {
    return error ? (
        <div>ERROR: <strong>{String(error)}</strong></div>
    ) : (
        <div dangerouslySetInnerHTML={{__html: output}} />
    );
}
