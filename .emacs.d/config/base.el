;;; -*- lexical-binding: t -*-

;; General UI Tweaks:
;;=====================
(setq ring-bell-function 'ignore	; Silence please, no more beeps.
      echo-keystrokes 0.5)		; Echo keystrokes faster.

(menu-bar-mode -1)			; Menu bar is gone.
(tool-bar-mode -1)			; Tool bar is gone.
(scroll-bar-mode -1)			; Hide scrollbar.
(blink-cursor-mode 0)			; I don't like blinking cursor.
(global-hl-line-mode t)			; Highlight the current line, and make this global in all buffers.
(global-set-key (kbd "<f5>") 'revert-buffer) ; Press F5 to refresh buffer.
(desktop-save-mode t)			; Next time you open your emacs it will remember your last opened file.
(save-place-mode t)			; It will remember last position you were in the file when you reopen it.
(show-paren-mode t)			; Show you openning/closing parenthes.
(winner-mode t)				; Always you can reopen last window you closed by fault.
(global-auto-revert-mode t)		; Reload changes from the desk.
(column-number-mode t)			; Show column numbers.

(setq mode-require-final-newline t)	; Add newline at the end of file.
(set-frame-parameter nil 'internal-border-width 0) ; Hide these annoying space margin on both sides.
(set-frame-parameter nil 'top 0)
(set-frame-parameter nil 'bottom 0)


;; Scrolling:
;;============
(setq mouse-wheel-scroll-amount '(1)	; Scroll gentley
      mouse-wheel-progressive-speed nil ; Take it easy and don't accelerate.
      scroll-conservatively 101		; Don't jump to the middle of screen.
      hscroll-margin 1			; Don't scroll that early.
      hscroll-step 1			; But scroll just a bit.
      scroll-preserve-screen-position t) ; Try to keep the cursor in its position.

(defalias 'yes-or-no-p 'y-or-n-p)	; Don't have time to type 'yes'.

(setq confirm-kill-processes nil)	; Just kill the process.

(use-package which-key
  :init (which-key-mode))		; Show you keys suggestions when you press C- whatever.

;; Security:
;;===============
(setq gnutls-verify-error t
      tls-checktrust t)

;; Backups & Desk Management:
;;===========================
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions -1
      version-control t
      vc-make-backup-files t
      auto-save-list-file-prefix "~/.emacs.d/autosave/"
      auto-save-file-name-transforms '((".*" "~/.emacs.d/autosave/" t))
      undo-tree-auto-save-history t
      undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo/")))

(setq create-lockfiles nil)		; But don't create stupid lockfiles!

;; History:
;;============
(setq savehist-file "~/.emacs.d/savehist"
      history-length t
      history-delete-duplicates t
      savehist-save-minibuffer-history 1
      savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring)
      recentf-max-saved-items 50)
(savehist-mode 1)
(recentf-mode 1)

;; Smart Parenthese:
;;==================
(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))


;; Let Emacs knows about our PATH:
;;=================================
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; General startup settings:
;;===========================
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
