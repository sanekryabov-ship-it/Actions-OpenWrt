#!/bin/bash
# Заменяем размер памяти 16МБ на 32МБ абсолютно во всех файлах конфигурации ramips
find target/linux/ramips/dts/ -name "*.dts*" -exec sed -i 's/<0x0 0x1000000>/<0x0 0x2000000>/g' {} +
