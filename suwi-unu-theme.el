;;; suwi-unu-theme.el --- Suwi theme: unu -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-light-base)

(defconst suwi-unu-palette-partial
  '((suwi-fg        "#3A2F6E")
    (suwi-primary   "#2E2ABF")
    (suwi-secondary "#6A5CFF")
    (suwi-tertiary  "#9A8CFF"))
  "Palette entries that give `suwi-unu' its distinctive vibe.")

(defconst suwi-unu-custom-faces-partial
  '()
  "Custom faces unique to `suwi-unu'.")

(suwi-define-light-theme suwi-unu
  "Soft purple light theme.")

(provide 'suwi-unu-theme)

;;; suwi-unu-theme.el ends here
