#!/bin/bash

# 1. Исправленный поиск: меняем размер раздела firmware с 15.6МБ на 31.6МБ во всех DTS
find target/linux/ramips/dts/ -name "*.dts*" -exec sed -i 's/0xfb0000/0x1fb0000/g' {} +

# На всякий случай расширяем лимит самого чипа, если он был жестко задан (для некоторых моделей)
find target/linux/ramips/dts/ -name "*.dts*" -exec sed -i 's/0x1000000/0x2000000/g' {} +

# 2. Критический патч ядра: прописываем настройки в актуальный конфиг для ядра 6.12
# Сначала проверяем, существует ли папка mt7621 (в новых версиях архитектура может быть общей ramips)
TARGET_CONFIG="target/linux/ramips/mt7621/config-6.12"
[ -f "$TARGET_CONFIG" ] || TARGET_CONFIG="target/linux/ramips/config-6.12"

echo "CONFIG_MIPS_CMDLINE_FROM_DTB=y" >> "$TARGET_CONFIG"
echo "CONFIG_MIPS_CMDLINE_IGNORE_ARGUMENTS=y" >> "$TARGET_CONFIG"
