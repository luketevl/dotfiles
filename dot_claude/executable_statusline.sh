#!/usr/bin/env bash
# Status line do Claude Code no estilo Pastel Powerline (mesmas cores do starship).
# Segmentos: modelo (esforco) | pasta | branch git | contexto usado | custo da sessao
input=$(cat)
j() { jq -r "$1 // empty" <<<"$input"; }

model=$(j '.model.display_name')
effort=$(j '.effort.level')
dir=$(j '.workspace.current_dir')
ctx=$(j '.context_window.used_percentage')
cost=$(j '.cost.total_cost_usd')

[[ -n $dir ]] || dir=$PWD
case $dir in
  "$HOME") short="~" ;;
  *) short=${dir##*/} ;;
esac

branch=""
if git -C "$dir" rev-parse --is-inside-work-tree &>/dev/null; then
  branch=$(git -C "$dir" --no-optional-locks branch --show-current 2>/dev/null)
  [[ -n $branch ]] || branch=$(git -C "$dir" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
  if [[ -n $(git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null | head -1) ]]; then
    branch="$branch*"
  fi
fi

hex() { printf '%d;%d;%d' 0x${1:0:2} 0x${1:2:2} 0x${1:4:2}; }
PURPLE=9A348E PINK=DA627D ORANGE=FCA17D BLUE=86BBD8 TEAL=06969A DARK=33658A
LEFT=$'' SEP=$''

out="" prev=""
seg() { # seg <cor> <texto>
  local bg=$1 text=$2
  if [[ -z $prev ]]; then
    out+="\e[38;2;$(hex "$bg")m$LEFT"
  else
    out+="\e[38;2;$(hex "$prev");48;2;$(hex "$bg")m$SEP"
  fi
  out+="\e[38;2;255;255;255;48;2;$(hex "$bg")m $text "
  prev=$bg
}

seg $PURPLE "󰚩 ${model:-Claude}${effort:+ ($effort)}"
seg $PINK "$short"
[[ -n $branch ]] && seg $ORANGE " $branch"
[[ -n $ctx ]] && seg $TEAL "󰍛 ${ctx}%"
[[ -n $cost ]] && seg $DARK "\$$(printf '%.2f' "$cost")"
out+="\e[0m\e[38;2;$(hex "$prev")m$SEP\e[0m"

printf '%b\n' "$out"
