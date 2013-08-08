Cilpss
======

Share clipboads or buffer. MacOSX Linux with zsh tmux emacs vi .

* MacOSX [tmux-MacOSX-pasteboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)
* zsh   4.3.11
* tmux  1.8
* emacs 2.4
* vim   7.2
* ruby  1.9


Let's Use
-----

1. zsh . input spell `hello world`. go a head and C-k (kill-line)

2. switch emacs and C-y (yank) . curbuffer insert `hello world`.

3. switch other vi,tmux,MacOSX and paste . insert `hello world`.


Install
------

### get code

```bsh
cd ${HOME}
git    clone https://github.com/mukaer/clipss.git
cd     clippss
gem    install bundle
bundle install

```

### MacOSX clipboard

* [tmux-MacOSX-pasteboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)

example install

```bsh
cd ~
git  clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
cd   tmux-MacOSX-pasteboard
make reattach-to-user-namespace 
cp   reattach-to-user-namespace  /usr/local/bin
```

### zsh

* `~/.zshrc`

Recommendation to use RAMDISK .`CLIPSS_FILE`

```bsh
export CLIPSS_PATH="${HOME}/clipss"
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
bind-key -t emacs-copy  M-w  copy-pipe "${CLIPSS_PATH}/bin/clipss_push"  #tmux 1.8 conf gramma
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



