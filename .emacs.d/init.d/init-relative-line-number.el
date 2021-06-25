;; Relative line number
(global-display-line-numbers-mode)
;; (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type 'visual)

;; (defun ninrod/toggle-relative-line-numbers()
;;  (interactive)
;;  (if display-line-numbers
;;      (set q display-line-numbers nil)
;;    (progn
;;      (setq display-line-numbers-current-absolute nil)
;;      (setq display-line-numbers 'visual))))

;; (add-hook 'org-mode-hook (lambda() (ninrod/toggle-relative-line-numbers)))

(provide 'init-relative-line-number)
