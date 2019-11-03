;;; -*- lexical-binding: t -*-

;; C-i is used in Vim as counterpart to C-o for going back and forth
;; in the jump list. It also happens to be interpreted as TAB, simply
;; because terminals are a nightmare. Fortunately GUI Emacs can be
;; told to not resolve C-i to indentation by defining a function in
;; key-translation-map that returns the desired key. That way I’m
;; sending a custom <C-i> when Evil is active, in normal state and C-i
;; (as opposed to the TAB key) has been pressed, otherwise TAB is
;; passed through.

(defun my-translate-C-i (_prompt)
  (if (and (= (length (this-single-command-raw-keys)) 1)
	   (eql (aref (this-single-command-raw-keys) 0) ?\C-i)
	   (bound-and-true-p evil-mode)
	   (eq evil-state 'normal))
      (kbd "<C-i>")
    (kbd "TAB")))

(define-key key-translation-map (kbd "TAB") 'my-translate-C-i)


(use-package evil
  :init
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-Y-yank-to-eol t)

  :hook (after-init . evil-mode)

  :config
  (define-key evil-insert-state-map "\C-p" nil)
  (define-key evil-insert-state-map "\C-n" nil)
  (with-eval-after-load 'evil-vars
    (setq evil-want-C-w-in-emacs-state t))
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "SPC") nil) ; Unbind "SPC" from Evil, it goes to Emacs now.
    (define-key evil-motion-state-map (kbd "RET") nil) ; Unbind "RET" from Evil, it goes to Emacs now.
    (define-key evil-motion-state-map (kbd "TAB") nil) ; Unbind "TAB" from Evil, it goes to Emacs now.
    (define-key evil-normal-state-map (kbd "C-.") nil)
    (define-key evil-normal-state-map (kbd "M-.") nil)
    (define-key evil-motion-state-map (kbd "<C-i>") 'evil-jump-forward)
    (define-key evil-insert-state-map (kbd "C-w") 'evil-window-map)))
