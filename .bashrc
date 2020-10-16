function docs() {
    echo ""
    prev=""
    while read -r line; do
        if [[ ${line::5} == "alias" ]]
        then
            cmd=$(echo "$line" | sed -e 's/.*alias\ \(.*\)\=.*/\1/')
            printf " \e[32m$cmd\e[m"
            prev=${prev:3}
            echo " $prev"
        fi
       prev="$line"
    done < ~/.bashrc
    echo ""
}

function wordsleft() {
  echo " "
  echo "  Starting a wpm counter! Ensure you put args"
  printf "    (for example, \e[32m,wpm 180 2000 foo.txt\e[m)"
  echo " "
  echo " "

  FILE=$3
  INIT_WC=$(textutil -convert txt -stdout $FILE | wc -w)
  GOAL=$((($INIT_WC + $2)))
  START=$(date +"%s")
  FINISH="$(($START + ($1*60)))"
  while sleep 30; do
    WC=$(textutil -convert txt -stdout $FILE | wc -w)
    WORDS_LEFT=$(($GOAL - $WC))
    SEC_LEFT=$(($FINISH - $(date +"%s")))
    MIN_LEFT=$((SEC_LEFT/60))
    printf "Words per minute needed: \e[32m$(($WORDS_LEFT/$MIN_LEFT))\e[m (with $MIN_LEFT minutes left)\n"
  done;
}

alias ,wpm="wordsleft"

## Editing and updating this very file
alias bedit='open $HOME/.bashrc ; echo "Opening .bashrc..."'

## Propogate bash profile changes
alias bashup='source $HOME/.bashrc ; echo "Bash profile updated..." ; ,'

alias ,zett='open /Users/Shared/zett/'

alias h='conda deactivate ; cd ~;'

## Disk usage
alias ,du="du -d9 -h ~ | sort -h"

## Documentation of Bash scripts in .bashrc
alias ,="docs"
