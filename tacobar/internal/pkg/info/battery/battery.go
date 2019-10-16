package battery

import (
	"fmt"
	"math"

	distatus "github.com/distatus/battery"
)

const (
	batIndex = 0

	statusUnknown     = 'u'
	statusEmpty       = 'e'
	statusFull        = 'f'
	statusCharging    = 'c'
	statusDischarging = 'd'

	iconAC    = ''
	iconError = ''
	icon0     = ''
	icon25    = ''
	icon50    = ''
	icon75    = ''
	icon100   = ''

	errStr  = "ERROR"
	fullStr = "FULL"
)

type Battery struct {
	b *distatus.Battery
}

func (b *Battery) Refresh() (err error) {
	if b.b, err = distatus.Get(batIndex); err != nil {
		return err
	}

	return nil
}

func (b Battery) Percentage() string {
	switch b.b.State {
	case distatus.Full:
		return fullStr
	case distatus.Unknown:
		return errStr
	default:
		return fmt.Sprintf("%9.f%%", math.Round(b.b.Current/b.b.Full*100))
	}
}

func (b Battery) Status() rune {
	switch b.b.State {
	case distatus.Unknown:
		return statusUnknown
	case distatus.Empty:
		return statusEmpty
	case distatus.Full:
		return statusFull
	case distatus.Charging:
		return statusCharging
	case distatus.Discharging:
		return statusDischarging
	default:
		panic("must not happen")
	}
}

func (b Battery) Icon() rune {
	// Shortcut for full AC connection
	if b.b.State == distatus.Charging {
		return iconAC
	} else if b.b.State == distatus.Unknown {
		return iconError
	}

	lvl := math.Round(b.b.Current / b.b.Full * 100)
	switch {
	case lvl <= 15:
		return icon0
	case lvl <= 35:
		return icon25
	case lvl <= 60:
		return icon50
	case lvl <= 85:
		return icon75
	default:
		return icon100
	}
}
