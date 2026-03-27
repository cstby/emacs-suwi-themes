;;; suwi-dream-theme.el --- Suwi theme: dream -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-dark-base)

(defconst suwi-dream-palette-partial
  '((suwi-primary   "#9FAFFF")
    (suwi-secondary "#ffccff")
    (suwi-tertiary  "#A1ECFF")
    (suwi-keyword   "#cdbdff"))
  "Palette entries that give `suwi-dream' its distinctive vibe.")

(defconst suwi-dream-custom-faces-partial
  '()
  "Custom faces unique to `suwi-dream'.")

(suwi-define-dark-theme suwi-dream
  "Frosted pastel dark theme.")

(provide 'suwi-dream-theme)

;;; suwi-dream-theme.el ends here
