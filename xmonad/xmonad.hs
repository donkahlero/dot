import XMonad
import XMonad.Util.SpawnOnce ( spawnOnce )
import Graphics.X11.ExtraTypes.XF86 ( xF86XK_AudioLowerVolume, xF86XK_AudioRaiseVolume, xF86XK_AudioMute, xF86XK_MonBrightnessDown, xF86XK_MonBrightnessUp, xF86XK_Search )
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import Control.Monad ( join, when )
import Data.Maybe (maybeToList)
import System.Exit
import qualified XMonad.StackSet
import qualified Data.Map

myTerminal    = "alacritty"
myModMask     = mod4Mask
myBorderWidth = 3

myKeys conf@(XConfig {XMonad.modMask = modm}) = Data.Map.fromList $
    [ ((modm,               xK_r), spawn "rofi -show run")
    , ((modm,               xK_c), kill)
    , ((modm .|. shiftMask, xK_c), io (exitWith ExitSuccess))

    -- Audio
    , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume 0 +5%" )
    , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume 0 -5%" )
    , ((0, xF86XK_AudioMute),        spawn "pactl set-sink-mute 0 toggle")

    -- Brightness
    , ((0, xF86XK_MonBrightnessUp),   spawn "brightnessctl s +10%")
    , ((0, xF86XK_MonBrightnessDown), spawn "brightnessctl s 10-%")

    -- Misc
    , ((0, xF86XK_Search), spawn "rofi -show run")
    ]
    ++

    [((m .|. modm, k), windows $ f i)
       | (i, k) <- zip (XMonad.workspaces conf) [xK_1 ..xK_9]
       , (f, m) <- [(XMonad.StackSet.greedyView, 0), (XMonad.StackSet.shift, shiftMask)]]

myLayoutHook = ( tiled )
             where
    tiled   = avoidStruts $ withBorder 2 $ spacingWithEdge 5 $ ResizableTall nmaster delta ratio []
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

myWorkspaces    = ["0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001"]

myStartupHook = do
  spawnOnce "dbus-update-activation-environment --all"
  spawnOnce "gnome-keyring-daemon --start --components=secrets"
  spawnOnce "feh --bg-scale ~/.config/herbstluftwm/wallpaper.jpeg"
  spawnOnce "polybar"
  spawnOnce "dunst"
  spawnOnce "battery-notify"

myEventHook = mempty

addNETSupported :: Atom -> X ()
addNETSupported x   = withDisplay $ \dpy -> do
    r               <- asks theRoot
    a_NET_SUPPORTED <- getAtom "_NET_SUPPORTED"
    a               <- getAtom "ATOM"
    liftIO $ do
       sup <- (join . maybeToList) <$> getWindowProperty32 dpy a_NET_SUPPORTED r
       when (fromIntegral x `notElem` sup) $
         changeProperty32 dpy r a_NET_SUPPORTED a propModeAppend [fromIntegral x]

addEWMHFullscreen :: X ()
addEWMHFullscreen   = do
    wms <- getAtom "_NET_WM_STATE"
    wfs <- getAtom "_NET_WM_STATE_FULLSCREEN"
    mapM_ addNETSupported [wms, wfs]

main :: IO()
main = xmonad $ docks . ewmh $ def {
        terminal           = myTerminal,
        modMask            = myModMask,
        normalBorderColor  = "#dce0e8",
        focusedBorderColor = "#ea76cb",
        borderWidth        = myBorderWidth,
        keys               = myKeys,
        workspaces         = myWorkspaces,
        layoutHook         = myLayoutHook,
        startupHook        = myStartupHook >> addEWMHFullscreen,
        handleEventHook    = myEventHook
    }

