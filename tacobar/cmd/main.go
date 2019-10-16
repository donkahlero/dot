package main

import (
	"fmt"
	"time"

	"github.com/tacovox/tacobar/internal/pkg/info"
	"github.com/tacovox/tacobar/internal/pkg/info/spotify"
)

func main() {
	infos := []info.Info{
		spotify.New(),
		// WIFI
		// BATTERY
		// DATETIME
	}

	for {
		for _, info := range infos {
			refresh, err := info.Refresh()
			if err != nil {
				panic(err)
			}

			if refresh {
				fmt.Println(info)
			}
		}

		time.Sleep(250)
	}
}
