Cilpss
======

clipboads share. zsh tmux emacs vi etc...

* zsh   5.0.2
* tmux  1.8
* emacs 2.4
* ruby  1.9

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
export CLIPSS_FILE="/tmp/clipss_file.txt"
source ${CLIPSS_PATH}/zsh/clipss.zsh
clipss_initialize


bindkey '^Y'  clipss+yank
bindkey '^k'  clipss+kill-line
bindkey '^[w' clipss+copy-region-as-kill
bindkey '^W'  clipss+backward-kill-word-or-kill-region

```

restart zsh

```bsh
zsh
```

### tmux

`~/.tmux.conf`

```conf
bind-key -t emacs-copy  M-w  copy-pipe "$CLIPSS_PATH/push.sh"  #tmux 1.8 conf gramma
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
source  ${CLIPSS_PATH}/vim/clipss.vim
nmap yy yy:call Clipss_Push()<CR>
nmap p :call Clipss_Pop()<CR>
```
