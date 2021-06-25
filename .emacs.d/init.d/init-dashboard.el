;; Dashboard

(straight-use-package 'dashboard)

(dashboard-setup-startup-hook)

(setq dashboard-items '((bookmarks . 5)
			(projects . 5)
			(agenda . 5)
			(registers . 5)))
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)

(provide 'init-dashboard)
