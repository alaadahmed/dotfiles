;;; -*- lexical-binding: t -*-

(defun ak/terminal-in-project-root (arg)
  (interactive "P")
  (let ((default-directory
	  (if arg default-directory
	    (projectile-project-root))))
    (start-process "terminal" nil (getenv "TERMINAL"))))

(global-set-key (kbd "C-x t") 'ak/terminal-in-project-root)
