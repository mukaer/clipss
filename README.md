Cilpss
======
[![Build Status](https://travis-ci.org/mukaer/clipss.png)](https://travis-ci.org/mukaer/clipss)


[Japanese](http://mukaer.com/archives/2013/08/19/zsh_tmux_emacs_/)


Clipboard Sync and Buffer Sync. zsh tmux emacs vi with MacOSX Linux Windows.


you have to install.

* MacOSX [tmux-MacOSX-pasteboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)
* zsh   4.3.11
* tmux  1.8
* emacs 2.4
* vim   7.2
* ruby  1.9 or 2.0


Let's Use. case local only
-----

1. zsh . input spell `hello world`. go a head and C-k (kill-line)
2. switch emacs and C-y (yank) . curbuffer insert `hello world`.
3. switch other vi,tmux,MacOSX and paste . insert `hello world`.


Let's Use. case remote PC & clipboard sync
-----
1. emacs. input spell `hello world`. go a head and C-k (kill-line)
2. swith remote PC (windows) and paste.
3. PC (windows) copy string `foo bar baz`.
4. switch emacs and C-y (yank) . curbuffer insert `foo bar baz`.



Install
------

### get code

```bsh
$ cd ${HOME}
$ git    clone https://github.com/mukaer/clipss.git
$ cd     clippss
$ gem    install bundle
$ bundle install --without development test
```

### MacOSX clipboard

* [tmux-MacOSX-pasteboard](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)

example install

```bsh
$ cd ~
$ git  clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
$ cd   tmux-MacOSX-pasteboard
$ make reattach-to-user-namespace 
$ cp   reattach-to-user-namespace  /usr/local/bin
```

### zsh

* `~/.zshrc`

Recommendation to use RAMDISK .`CLIPSS_FILE`

```bsh
export CLIPSS_PATH="${HOME}/clipss"
export CLIPSS_FILE="/tmp/clipss_file.txt"
export CLIPSS_PORT="9116"
export CLIPSS_REMOTE_SV="http://192.168.0.100:9116 http://192.168.0.101:9116"
source ${CLIPSS_PATH}/zsh/clipss.zsh
clipss_initialize


bindkey '^Y'  clipss+yank
bindkey '^k'  clipss+kill-line
bindkey '^[w' clipss+copy-region-as-kill
bindkey '^W'  clipss+backward-kill-word-or-kill-region
```
restart zsh

```bsh
$ zsh
```

### tmux

* `~/.tmux.conf`

~~~
bind-key -t emacs-copy  M-w  copy-pipe "${CLIPSS_PATH}/bin/clipss_push"  #tmux 1.8 conf gramma
bind-key ]  run 'tmux load-buffer -- $CLIPSS_FILE;tmux paste-buffer --;'
~~~


### emacs

* `~/.emacs`


```lisp
(add-to-list 'load-path (concat (getenv "CLIPSS_PATH") "/emacs"))
(require 'clipss)
(setq clipss-path (getenv "CLIPSS_PATH") )
(clipss-init)
```

### vim

* `~/.vimrc`

~~~
source  ${CLIPSS_PATH}/vim/clipss.vim
nmap yy yy:call Clipss_Push()<CR>
nmap p :call Clipss_Pop()<CR>
~~~



Config and Use. case remote
---
Adds remote server url. zsh `export CLIPSS_REMOTE_SV` or
ruby config file `clipss/config/config.rb`.

if use `config.rb`. overwirte setting variable

```bsh
$ cd clipss/config/
$ cp config.rb.template  config.rb
```

* `clipss/config/config.rb`

```ruby
config.remote_svs  = ["http://192.168.0.100:9116",
                        "http://192.168.0.101:9116"]
```


comand exec start clipss server. local and remote .

```bsh
$ clipss_httpd    #path clipss/bin/clips_httpd
```

access

    http://localhost:9116



More info
--------

* [setup_windows](/setup_windows.md)
* [development](/development.md)
