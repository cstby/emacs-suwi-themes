;;; suwi-kalama-theme.el --- Frosted pastel Suwi dark theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl

;;; Commentary:
;;
;; Dark Suwi variant with pale pink, lavender, and icy blue accents.
;; Builds on the shared dark base and only overrides accent colors.

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
