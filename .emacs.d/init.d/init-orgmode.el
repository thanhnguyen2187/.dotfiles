;; Org
(setq org-cycle-separator-lines -1)
(require 'org-tempo) ;;

(add-hook 'org-mode-hook 'org-indent-mode)

;; Org Screenshot
;; (straight-use-package 'org-attach-screenshot)

;; Org Download
(setq-default org-download-image-dir "./images")
(setq-default org-download-heading-lvl nil)

(straight-use-package 'org-download)

(require 'org-download)

(global-set-key (kbd "C-S-v") 'org-download-clipboard)

;;

(provide 'init-orgmode)
