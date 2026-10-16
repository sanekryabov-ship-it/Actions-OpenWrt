#!/bin/bash
sed -i 's/<0x0 0x1000000>/<0x0 0x2000000>/g' target/linux/ramips/dts/mt7621_asus_rt-ac57u-v1.dts
