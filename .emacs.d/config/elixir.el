;;; -*- lexical-binding: t -*-

(use-package elixir-mode)
(add-hook 'elixir-mode-hook
	  (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
