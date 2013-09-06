info setup windows
=======

* [ruby](http://rubyinstaller.org/downloads/)
* [DevKit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit)
* [git](http://git-scm.com/)

~~~
ruby 2.0
DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe
git 1.8
~~~

ruby install
-----------

### 1. ruby & git

download & install ruby.exe git.exe

### 2. Devkit
1. download & cp Devkit.exe C:/Ruby200-x64/  
2. exec Devkit.exe

### 3. Devkit config
```bsh
$ cd C:/Ruby200-x64
$ ruby dk.rb init
```

edit `config.yml`

    #---
    - C:/Ruby200-x64

```bsh
$ ruby dk.rb review
$ ruby dk.rb install
```

### 4. test gem install

```bsh
$ gem install json --platform=ruby
```

clipss install & Use
-------------

```bsh
$ git    clone https://github.com/mukaer/clipss.git
$ cd     clippss
$ gem    install bundle
$ bundle install --without development test
$ bin/clipss_httpd
```

access

    http://localhost:9116
