;;; -*- lexical-binding: t -*-



(use-package elixir-mode)

(defvar lsp-elixir--config-options (make-hash-table))
;; (add-hook 'elixir-mode-hook
;; 	  (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
(use-package exunit)
