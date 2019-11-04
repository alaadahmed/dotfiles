;;; -*- lexical-binding: t -*-

(use-package eglot
  :disabled t
  :init (setq eglot-put-doc-in-help-buffer t)
  :commands (eglot)
  :config
  ;; Disable annoying help popup every time I put cursor on a function
  (add-to-list 'eglot-ignored-server-capabilites :hoverProvider))

(use-package lsp-mode
  :commands lsp
  :diminish lsp-mode
  :hook
  ((elixir-mode . lsp)
   ('lsp-after-initialize-hook
    (lambda ()
      (lsp--set-configuration '(:elixirLS, lsp-elixir--config-options)))))
  :init
  (add-to-list 'exec-path "/Users/alaadahmed/.emacs.d/straight/repos/elixir-ls/release"))


(use-package lsp-ui
  :after lsp-mode
  :init (setq lsp-ui-peek-always-show t
	      lsp-ui-sideline-enable nil
	      lsp-ui-doc-enable nil)
  :config
  (define-key lsp-ui-mode-map
    [remap xref-find-references]
    #'lsp-ui-peek-find-references))

(use-package company-lsp
  :after (company lsp-mode)
  :init
  (setq company-lsp-cache-candidates 'auto)
  :commands (company-lsp))
