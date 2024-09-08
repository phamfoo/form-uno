# Form Uno Firmware 

This is starter QMK firmware for initially flashing to your Form Uno.
However, I recommend adjusting the keymap.c file to your liking before flashing.


Here are some basic instructions for the QMK firmware process: 
(if you are a nix user this project includes a flake with qmk and picotool)
* Install QMK: https://docs.qmk.fm/#/newbs_getting_started - follow the instructions to instal QMK for your OS and setup your environment. 
* Install `picotool`  https://github.com/raspberrypi/picotool
* Adjust the keymap.c file to your liking.
* start the new keyboard setup process with the following command: 
```bash
qmk new-keyboard -kb formuno 
# select 12x5 ortho layout 
# select RP2040 as the microcontroller 
```

* Copy the contents of the src/firmware/formuno  directory into the newly created formuno directory within qmk_firmware/keyboards.
```bash
rsync -rlv src/firmware/formuno/ ~/qmk_firmware/keyboards/formuno/
```

* Compile the firmware with the following command: 

```bash
qmk compile -kb formuno -km default
```

* Prepare your keyboard for flashing by pressing plugging it into your computer. Hold the BOOT button on the microcontroller and press RESET briefly. At this point your keyboard should be in DFU mode and it is ready to be flashed.
* Ensure the keyboard is in DFU mode and flash the firmware with the following command: 

```bash
# this should return None but should not error
picotool info -f
```
 
* Finally flash the firmware with the following command: 

```bash
picotool load -x ~/qmk_firmware/formuno_default.uf2
```

* Your keyboard should now be flashed with the new firmware. Give it a test - lather, rinse, repeat for additional tweaks. 
