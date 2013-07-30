;; clipss        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar clipss-path
 "~/clipss"
  "*send killing into clipbord")



;; defadvices ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
(defadvice yank
  (before get_killing (&rest rest) activate)
  (overwirte_kill-ring)
)

;; functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun clipss-push () (concat clipss-path "/push.rb"))
(defun clipss-pop  () (concat clipss-path "/pop.rb"))

(defun clipss-init () 
  (kill-new (shell-command-to-string (shell-command-to-string (clipss-pop)) ))
)

(defun send_killing (start end)
  (interactive "r")
  (call-process-region start end
		       (clipss-push)
		       nil                        ;opt delete
		       0                          ;opt destination
		       )
)



;overwirte_kill-ring
(defun overwirte_kill-ring ()
  (let (
	(buffer  (shell-command-to-string (clipss-pop) ))
	(curkill (substring-no-properties (current-kill 0 nil) )))
    (if  curkill
	;true
	(if (not (string= buffer curkill))
	    (kill-new buffer))
      ;false
      (kill-new buffer)))
)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'clipss)
