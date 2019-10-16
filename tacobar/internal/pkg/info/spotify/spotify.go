package spotify

import (
	"fmt"

	"github.com/everdev/mack"
)

const (
	application = "Spotify"

	commandState  = "player state"
	commandArtist = "artist of current track"
	commandTitle  = "name of current track"
)

type Spotify struct {
	state  string
	artist string
	title  string
}

func New() *Spotify {
	return &Spotify{}
}

func (s *Spotify) Refresh() (bool, error) {
	state, err := mack.Tell(application, commandState)
	if err != nil {
		return false, err
	}

	artist, err := mack.Tell(application, commandArtist)
	if err != nil {
		return false, err
	}

	title, err := mack.Tell(application, commandTitle)
	if err != nil {
		return false, err
	}

	if s.state != state || s.artist != artist || s.title != title {
		s.state = state
		s.artist = artist
		s.title = title

		return true, nil
	}

	return false, nil
}

func (Spotify) Widget() string {
	return ""
}

func (s Spotify) String() string {
	return fmt.Sprintf("%s@%s@%s", s.state, s.artist, s.title)
}
