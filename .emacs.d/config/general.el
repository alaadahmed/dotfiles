;;; -*- lexical-binding: t -*-


(use-package no-littering)
(require 'recentf)

(add-to-list 'recentf-exclude no-littering-etc-directory)

(setq user-full-name "AlaaEddin Koraiem"
      user-mail-address "alaadahmed@gmail.com")
(use-package general)
(use-package diminish)
