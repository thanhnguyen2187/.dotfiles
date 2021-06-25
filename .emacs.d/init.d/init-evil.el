;; Evil

(setq evil-want-C-u-scroll t)
(setq evil-vsplit-window-right t)
(setq evil-want-keybinding nil) ;; For Evil Collection

(straight-use-package 'evil)
(straight-use-package 'goto-chg)
(straight-use-package 'undo-fu)

(require 'evil)

(evil-set-undo-system 'undo-fu)
(evil-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Commentary

(straight-use-package 'evil-commentary)

(evil-commentary-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Exchange

(straight-use-package 'evil-exchange)

(require 'evil-exchange)

(evil-exchange-install)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Numbers

(straight-use-package
 '(evil-numbers
   :type git
   :host github
   :repo "juliapath/evil-numbers"))

(require 'evil-numbers)

(evil-define-key 'normal global-map (kbd "C-+") 'evil-numbers/inc-at-pt)
(evil-define-key 'normal global-map (kbd "C--") 'evil-numbers/dec-at-pt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Org

(straight-use-package
 '(evil-org-mode
   :type git
   :host github
   :repo "Somelauw/evil-org-mode"))

(require 'evil-org)

(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Surround

(straight-use-package 'evil-surround)

(global-evil-surround-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil Collection

(straight-use-package 'evil-collection)

(evil-collection-init 'dired)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-evil)
