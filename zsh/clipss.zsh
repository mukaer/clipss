#!/usr/bin/env zsh

: <<_COMENT_OUT_

# Show now ZLE bindkey

1. show ZLE keymaps

    bindkey -l

2. show ZLE bindkyes

    bindkey -L

3. show ZLE bindkeys maps

    bindkey -M emacs
    bindkey -M vi


# bind list

bindkey	  emacs	
"^Y"	  C-y	yank
"^K"	  C-k	kill-line
"^W"	  C-w	backward-kill-word
		kill-region
"^[w"	  M-w	copy-region-as-kill


_COMENT_OUT_

clipss_push_wraps=( \
    kill-line backward-kill-word copy-region-as-kill kill-region
)

clipss_pop_wraps=( \
    yank
)

clipss_push () {
    "$(_clipss_replace_homepath ${CLIPSS_PATH})/push.rb"
}

clipss_pop () {
    "$(_clipss_replace_homepath ${CLIPSS_PATH})/pop.rb"
    
}


_clipss_push () {
    echo $CUTBUFFER | "$(_clipss_replace_homepath ${CLIPSS_PATH})/push.rb" >& /dev/null
}

_clipss_pop () {
    CUTBUFFER=$("$(_clipss_replace_homepath ${CLIPSS_PATH})/pop.rb" )
}

# replace "~" to "${HOME}"
_clipss_replace_homepath(){
    local str
    str="$(echo $1 | cut -d~ -f2)"
    if [ -n $str ]; then
	echo "${HOME}${str}"
    else
	echo "$1"
    fi
}

_clipss_make_fc_push_wraps () {
    local fc
    for fc in $clipss_push_wraps[*]; do
	eval "$(__clipss_make_str_fc_push $fc)"
	eval "zle -N $(__clipss_make_str_fc_name $fc)"
    done

}

__clipss_make_str_fc_push () {
    cat <<EOF
$(__clipss_make_str_fc_name ${1}) () {
    zle ${1}
    _clipss_push
}
EOF

}

_clipss_make_fc_pop_wraps () {
    local fc
    for fc in $clipss_pop_wraps[*]; do
	eval "$(__clipss_make_str_fc_pop $fc)"
	eval "zle -N $(__clipss_make_str_fc_name $fc)"
    done

}

__clipss_make_str_fc_pop () {
    cat <<EOF
$(__clipss_make_str_fc_name ${1}) () {
    _clipss_pop
    zle ${1}
}
EOF

}

__clipss_make_str_fc_name () {
    echo "clipss+${1}"
}


# "^W"      C-w   backward-kill-word
#                 kill-region
clipss+backward-kill-word-or-kill-region () {
    if [ $REGION_ACTIVE -eq 0 ]; then
	zle clipss+backward-kill-word
    else
	zle clipss+kill-region
    fi

}


clipss_initialize () {
    _clipss_make_fc_push_wraps
    _clipss_make_fc_pop_wraps
    zle -N clipss+backward-kill-word-or-kill-region

}
