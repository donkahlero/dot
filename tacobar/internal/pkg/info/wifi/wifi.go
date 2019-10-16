package wifi

import (
	wifiname "github.com/yelinaung/wifi-name"
)

type Wifi struct {
	name string
}

func (w *Wifi) Refresh() (bool, error) {
	if name := wifiname.WifiName(); w.name != name {
		w.name = name

		return true, nil
	}

	return false, nil
}

func (w Wifi) String() string {
	return w.name
}
