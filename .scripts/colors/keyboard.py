#!/bin/python

import openrazer.client as client
import razercommander.device as dvc
import sys



def hex_to_rgb(col):
    if(col.startswith('#')):
        col = col[1::]
    red = int(col[0:2], 16)
    green = int(col[2:4], 16)
    blue = int(col[4:6], 16)

    return (red, green, blue)


def get_keyboard():
    manager = client.DeviceManager()
    kbd = manager.devices[0]
    return dvc.Device(kbd)


kbd = get_keyboard()
target = sys.argv[1]

if target == "rainbow":
    kbd.enableWave(1)
    exit()
elif target == "ambient":
    kbd.enableSpectrum()
elif target == "_":
    kbd.enableNone()
elif target == 'react':
    (r,g,b) = hex_to_rgb(sys.argv[2])
    print(r,g,b)
    kbd.enableReactive(2, r, g, b)
elif target == 'rriple':
    kbd.enableRippleRandom()
elif target == 'ripple':
    (r,g,b) = hex_to_rgb(sys.argv[2])
    print(r,g,b)
    kbd.enableRipple(r, g, b)
    
if target.startswith('#'):
    (r, g, b) = hex_to_rgb(target[1:])
    kbd.enableStatic(r, g, b)


# kbd.enableRipple(255, 0, 0)
# kbd.enableSpectrum()
# kbd.enableSingleBreath(255, 255, 255)
# kbd.enableReactive(2,200,100, 100)
