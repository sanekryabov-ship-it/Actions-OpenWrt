#!/bin/bash
# 1. Расширяем память до 32МБ во всех DTS-файлах ramips
find target/linux/ramips/dts/ -name "*.dts*" -exec sed -i 's/<0x0 0x1000000>/<0x0 0x2000000>/g' {} +

# 2. Критический патч: заставляем ядро игнорировать старую разметку загрузчика U-Boot
# Добавляем флаг CONFIG_MIPS_CMDLINE_FROM_DTB=y, который заставит OpenWrt верить только своей разметке 32МБ
echo "CONFIG_MIPS_CMDLINE_FROM_DTB=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_MIPS_CMDLINE_FROM_DTB=y" >> target/linux/ramips/mt7621/config-5.15
echo "CONFIG_MIPS_CMDLINE_IGNORE_ARGUMENTS=y" >> target/linux/ramips/mt7621/config-5.10
echo "CONFIG_MIPS_CMDLINE_IGNORE_ARGUMENTS=y" >> target/linux/ramips/mt7621/config-5.15
