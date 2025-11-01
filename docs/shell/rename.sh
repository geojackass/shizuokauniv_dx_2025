#/usr/bin/bash

offset=46  # 第1回講義の最終スライド番号

for i in $(seq 1 56); do
  newnum=$((i + offset))
  echo "$i 枚目 → pp${newnum}.png"
  cp "スライド${i}.PNG" "pp${newnum}.png"
done