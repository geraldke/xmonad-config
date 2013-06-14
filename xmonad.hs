import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/gerald/.xmonad/.xmobarrc"
xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , focusedBorderColor = "#00B2EE"
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command --lock") --mod4mask is the windows key
    , ((0, xK_Print), spawn "gnome-screenshot")
    ]


