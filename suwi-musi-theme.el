;;; suwi-musi-theme.el --- Suwi theme: musi -*- lexical-binding:t -*-

;; Copyright (C) 2026  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-dark-base)

(defconst suwi-musi-palette-partial
  '((suwi-primary   "#6cc5e0")
    (suwi-secondary "#d9b44a")
    (suwi-tertiary  "#9c1659"))
  "Palette entries that give `suwi-musi' its distinctive vibe.")

(defconst suwi-musi-custom-faces-partial
  '()
  "Custom faces unique to `suwi-musi'.")

(suwi-define-dark-theme suwi-musi
  "Soft dark theme.")

(provide 'suwi-musi-theme)

;;; suwi-musi-theme.el ends here
