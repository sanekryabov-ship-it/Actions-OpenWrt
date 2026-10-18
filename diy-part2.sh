#!/bin/bash

# 1. Меняем размер раздела firmware с 15.6МБ на 31.6МБ во всех DTS ramips
find target/linux/ramips/dts/ -name "*.dts*" -exec sed -i 's/0xfb0000/0x1fb0000/g' {} +

# На всякий случай расширяем лимит самого чипа, если он жестко задан (0x1000000 -> 0x2000000)
find target/linux/ramips/dts/ -name "*.dts*" -exec sed -i 's/0x1000000/0x2000000/g' {} +

# 2. Прописываем игнорирование аргументов старого загрузчика в конфиг ядра 6.12
TARGET_CONFIG="target/linux/ramips/mt7621/config-6.12"
[ -f "$TARGET_CONFIG" ] || TARGET_CONFIG="target/linux/ramips/config-6.12"

echo "CONFIG_MIPS_CMDLINE_FROM_DTB=y" >> "$TARGET_CONFIG"
echo "CONFIG_MIPS_CMDLINE_IGNORE_ARGUMENTS=y" >> "$TARGET_CONFIG"
