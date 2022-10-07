#!/bin/bash

help="liturgia [-h]  programa para vizualizar a liturgia do dia\n

usage:
    -h  mostra esta tela de ajuda
    1  mostra a primeira leitura
    2  mostra a leitura do salmo
    3  mostra a segunda leitura (sábado e domingo)
    4  mostra a leitura do evangelho
"

lt=0
case $1 in
  1) lt=1
  ;;
  2) lt=2
  ;;
  3) lt=3
  ;;
  4) lt=4
  ;;
  *) echo "$help"
  ;;
esac

curl -s https://liturgia.cancaonova.com/pb/ | pup 'div#liturgia-'"$lt"' text{}' | sed '/^$/d'
