package datetime

import (
	"time"

	"github.com/tacovox/tacobar/internal/pkg/info"
)

const (
	widget = "tacobar-info-coffee"
)

type DateTime struct {
	dt string
}

var (
	_ info.Info = &DateTime{}
)

func (d *DateTime) Refresh() (bool, error) {
	if dt := time.Now().Format("Mon 02. January 03:04 PM"); dt != d.dt {
		d.dt = dt
		return true, nil
	}

	return false, nil
}

func (d DateTime) String() string {
	return d.dt
}

func (DateTime) Widget() string {
	return widget
}
