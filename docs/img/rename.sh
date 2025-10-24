#/usr/bin/bash

for i in `seq 1 47`
do
  echo "$i 回目のloop"
  cp "スライド"$i".PNG" "pp"$i".png"
done
