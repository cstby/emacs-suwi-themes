;;; suwi-unu-theme.el --- Suwi theme: unu -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

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
