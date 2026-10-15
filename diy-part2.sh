#!/bin/bash
# Универсальный патч флеш-памяти для всех плат на MT7621 (включая ASUS) в исходниках Lean
find target/linux/ramips/dts*/ -name "*.dts*" -exec sed -i 's/<0x0 0x1000000>/<0x0 0x2000000>/g' {} +
find target/linux/ramips/dts*/ -name "*.dts*" -exec sed -i 's/<0x000000 0x1000000>/<0x000000 0x2000000>/g' {} +
