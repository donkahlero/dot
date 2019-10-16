package info

import "fmt"

type Info interface {
	Refresh() (bool, error)
	Widget() string

	fmt.Stringer
}
