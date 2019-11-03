;;; -*- lexical-binding: t -*-

(use-package rust-mode
  :mode (("\\.rs\\'" . rust-mode)))

(use-package flycheck-rust
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))
