;;; suwi-unu-theme.el --- Purple Suwi dark theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl

;;; Commentary:
;;
;; Dark Suwi variant with violet-forward accents.  Builds on the
;; shared dark base palette while nudging a few key accents toward a
;; neon “unu” mood.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-dark-base)

(defconst suwi-unu-palette-partial
  '((unu-fg "#d1cbe7")
    (unu-wisteria "#aeabed")
    (unu-periwinkle "#8a80ff")
    (unu-indigo "#614dff")

    (suwi-base unu-fg)
    (suwi-primary unu-wisteria)
    (suwi-secondary unu-periwinkle)
    (suwi-tertiary unu-indigo))
  "Palette entries that give `suwi-unu' its distinctive vibe.")

(defconst suwi-unu-custom-faces-partial
  '()
  "Custom faces unique to `suwi-unu'.")

(suwi-define-dark-theme suwi-unu
  "Moody dark palette for the Suwi framework.")

(provide 'suwi-unu-theme)

;;; suwi-unu-theme.el ends here
