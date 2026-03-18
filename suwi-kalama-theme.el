;;; suwi-kalama-theme.el --- Frosted pastel Suwi dark theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Dark Suwi variant with pale pink, lavender, and icy blue accents.
;; Builds on the shared dark base and only overrides accent colors.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-dark-base)

(defconst suwi-kalama-palette-partial
  '(
    (kalama-0 "#9FAFFF")
    (kalama-1 "#D8BBFF")
    (kalama-2 "#FECCFF")
    (kalama-3 "#A1ECFF")

    (accent-0 kalama-0)
    (accent-1 kalama-1)
    (accent-2 kalama-2)
    (accent-3 kalama-3))
  "Palette entries that give `suwi-kalama' its distinctive vibe.")

(defconst suwi-kalama-custom-faces-partial
  '()
  "Custom faces unique to `suwi-kalama'.")

(suwi-define-dark-theme suwi-kalama
  "Frosted pastel dark palette for the Suwi framework.")

(provide 'suwi-kalama-theme)

;;; suwi-kalama-theme.el ends here
