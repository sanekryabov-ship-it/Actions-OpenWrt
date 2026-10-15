# Модификация DTS: меняем размер флеш-памяти с 16MB (0x1000000) на 32MB (0x2000000)
#!/bin/bash
# Изменяем размер флеш-памяти для ASUS RT-AC57U v1 / RT-AC1200GU до 32 МБ
sed -i 's/<0x0 0x1000000>/<0x0 0x2000000>/g' target/linux/ramips/dts/mt7621_asus_rt-ac1200gu.dts
