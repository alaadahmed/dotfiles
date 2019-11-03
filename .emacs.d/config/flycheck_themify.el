;;; -*- lexical-binding: t -*-

(global-visual-line-mode 1)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(fringe-mode 8)

;; Font Settings:
;;===============
(setq ak/font-name "Liga Nerd Font Mono")
(defcustom ak/font-size 15 "My default font size")

(defun set-frame-font-size (&optional font-size)
  "Change fram font size to FONT-SIZE.
If no FONT-SIZE provided, reset the font size to its default variable."
  (let ((font-size
	     (or font-size
	         (eval (car (get 'ak/font-size 'standard-value))))))
    (customize-set-variable 'ak/font-size font-size)
    (set-frame-font
     (format "%s %d" ak/font-name font-size) nil t)))

(defun increase-frame-font ()
  "Increase frame font by one."
  (interactive)
  (set-frame-font-size (+ ak/font-size 1)))

(defun decrease-frame-font ()
  "Decrease frame font by one."
  (interactive)
  (set-frame-font-size (- ak/font-size 1)))

(defun reset-frame-font ()
  "Reset frame font to its default value."
  (interactive)
  (set-frame-font-size))

(global-set-key (kbd "C-x C-0") 'reset-frame-font)
(global-set-key (kbd "C-x C--") 'decrease-frame-font)
(global-set-key (kbd "C-x C-=") 'increase-frame-font)
(global-set-key (kbd "C-x C-+") 'text-scale-adjust)

(add-hook 'after-init-hook 'reset-frame-font)

;; This to enable Ligatures >> https://github.com/tonsky/FiraCode/wiki/Emacs-instructions#using-composition-char-table
;;=====================================================================================================================
(when (window-system)
  (set-frame-font ak/font-name))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))


;; Workaround to disable bold fonts everywhere:
;;=============================================
;; (defun remap-faces-default-attributes ()
;;   (let ((family (face-attribute 'default :family))
;; 	(height (face-attribute 'default :height)))
;;     (mapcar (lambda (face)
;;               (face-remap-add-relative
;;                face :family family :weight 'normal :height height))
;; 	    (face-list))))

;; (when (display-graphic-p)
;;   (add-hook 'minibuffer-setup-hook 'remap-faces-default-attributes)
;;   (add-hook 'change-major-mode-after-body-hook 'remap-faces-default-attributes)
;;   )
(mapc
 (lambda (face)
        (when (eq (face-attribute face :weight) 'bold)
          (set-face-attribute face nil :weight 'normal)))
 (face-list))

;; Theme Settings:
;;==================
(use-package spacemacs-theme
  :defer t
  :custom
  (spacemacs-theme-comment-bg nil)
  (spacemacs-theme-comment-italic t))
;; If I ever want to use original comment color with italics together,
;; I should uncomment these 2 lines.
;; See https://github.com/nashamri/spacemacs-theme/issues/104
;; (custom-set-variables '(spacemacs-theme-custom-colors
;;                         '((comment-light . "#2aa1ae"))))

(use-package heaven-and-hell
  :init
  (setq heaven-and-hell-theme-type 'light)
  (setq heaven-and-hell-themes
	'((light . spacemacs-light)
	  (dark . spacemacs-dark)))
  :hook (after-init . heaven-and-hell-init-hook)
  :bind (("C-c <f6>" . heaven-and-hell-load-default-theme)
	 ("<f6>" . heaven-and-hell-toggle-theme)))

;; Icons Settings:
;;==================
(use-package all-the-icons
  ;; all-the-icons doesn't work without font-lock+
  ;; and font-lock+ doesn't have autoloads so:
  :config
  (use-package font-lock+
    :straight (:host github :repo "emacsmirror/font-lock-plus")
    :config (require 'font-lock+)))

(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))
