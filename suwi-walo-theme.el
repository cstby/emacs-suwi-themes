;;; suwi-walo-theme.el --- Suwi theme: walo -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-light-base)

(defconst suwi-walo-palette-partial
  '()
  "Palette entries that give `suwi-walo' its distinctive vibe.")

(defconst suwi-walo-custom-faces-partial
  '()
  "Custom faces that give `suwi-walo' its distinctive vibe.")

(suwi-define-light-theme suwi-walo
  "Sweet, vivid light palette for the Suwi framework.")

(provide 'suwi-walo-theme)

;;; suwi-walo-theme.el ends here
