;;; suwi-kalama-theme.el --- Suwi theme: kalama -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-dark-base)

(defconst suwi-kalama-palette-partial
  '((kalama-periwinkle "#9FAFFF")
    (kalama-lavender "#D8BBFF")
    (kalama-blush "#FECCFF")
    (kalama-ice "#A1ECFF")

    (suwi-primary kalama-periwinkle)
    (suwi-secondary kalama-blush)
    (suwi-tertiary kalama-ice)
    (suwi-keyword kalama-lavender))
  "Palette entries that give `suwi-kalama' its distinctive vibe.")

(defconst suwi-kalama-custom-faces-partial
  '()
  "Custom faces unique to `suwi-kalama'.")

(suwi-define-dark-theme suwi-kalama
  "Frosted pastel dark palette for the Suwi framework.")

(provide 'suwi-kalama-theme)

;;; suwi-kalama-theme.el ends here
