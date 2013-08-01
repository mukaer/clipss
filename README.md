Cilpss
======

clipboads share. zsh tmux emacs vi etc...

* zsh  5.0
* tmux 1.8
* emacs 2.4
* ruby 2.0

Install
------

### get code

```bsh
cd ~
git clone https://github.com/mukaer/clipss.git
cd clippss
gem install bundle
bundle install

```

### zsh

* `~/.zshrc`

Recommendation to use RAMDISK .

```bsh
export CLIPSS_PATH="~/clipss"
case "${OSTYPE}" in
    linux*)
	export CLIPSS_FILE="/dev/shm/clipss_file.txt"
	;;
    *)
	export CLIPSS_FILE="/tmp/clipss_file.txt"
	;;
esac
```

restart zsh

```bash
zsh
```

### tmux

`~/.tmux.conf`

```conf
## clipss 
bind-key -t emacs-copy  M-w  copy-pipe "$CLIPSS_PATH/push.rb"  #tmux 1.8 conf gramma
bind-key ]  run 'tmux load-buffer -- $CLIPSS_FILE;tmux paste-buffer --;'

```

### emacs

`.emacs`


```lisp
(add-to-list 'load-path (concat (getenv "CLIPSS_PATH") "/emacs"))
(require 'clipss)
(setq clipss-path (getenv "CLIPSS_PATH") )
(clipss-init)
```

### vim

`.vimrc`


```conf
if filereadable(expand( $CLIPSS_PATH . "/vim/clipss.vim"))
    source  ${CLIPSS_PATH}/vim/clipss.vim
    nmap yy yy:call Clipss_Push()<CR>
    nmap p :call Clipss_Pop()<CR>
endif
```
