;; clipboard-sync ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; echo hoge | /home/kaimu/work/ruby/ruby_clipcopy/send_clip.rb


(defvar clipss-push
 "~/clipss/push.rb"
  "*send killing into clipbord")


(defvar clipss-file
 "/tmp/clipss_file.txt"
  "*send killing into file")

;emacs init killing
(kill-new (shell-command-to-string (concat "cat " clipss-file) ))

;; defadvice ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;C-w
(defadvice kill-region
  (before get_killing (start end) activate)
  (send_killing start end )
)


;M-w
(defadvice copy-region-as-kill
  (before get_killing (start end) activate)
  (send_killing start end )
)

;C-y
;;yank と (cmd "cat" "/dev/shm/clipboard-buffer") 比較して
;; 同じでなければ、kill-newに入れる
(defadvice yank
  (before get_killing (&rest rest) activate)
  (overwirte_kill-ring)
)

;; functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun send_killing (start end)
  (interactive "r")
  (call-process-region start end
		       clipss-push
		       nil                        ;opt delete
		       0                          ;opt destination
		       )
)



;overwirte_kill-ring
(defun overwirte_kill-ring ()
  (let (
	(buffer (shell-command-to-string (concat "cat " clipss-file) ))
	(curkill  (substring-no-properties (current-kill 0 nil) )))
    (if  curkill
	;true
	(if (not (string= buffer curkill))
	    (kill-new buffer))
      ;false
      (kill-new buffer)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'clipss)
