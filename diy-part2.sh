#!/bin/bash
# Универсальный патч флеш-памяти 32 МБ для ASUS RT-AC57U v1 / RT-AC1200GU в исходниках Lean LEDE
sed -i 's/<0x0 0x1000000>/<0x0 0x2000000>/g' target/linux/ramips/dts*/mt7621_asus_rt-ac1200gu.dts
