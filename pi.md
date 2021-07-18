# Tips for setting up raspberry pi

## Turn off power led
https://www.raspberrypi.org/forums/viewtopic.php?t=149126  
Add the following to the  
'/boot/config.txt'  
```
# Disable the PWR LED
dtparam=pwr_led_trigger=none
dtparam=pwr_led_activelow=off
```
