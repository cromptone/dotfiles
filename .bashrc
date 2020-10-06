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

## Editing and updating this very file
alias bedit='open $HOME/.bashrc ; echo "Opening .bashrc..."'
alias bashup='source $HOME/.bashrc ; echo "Bash profile updated..."'


alias ls='ls -Glah'

## Documentation of Bash scripts in .bashrc
alias ,="docs"
