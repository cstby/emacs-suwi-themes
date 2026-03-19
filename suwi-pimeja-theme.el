;;; suwi-pimeja-theme.el --- Suwi theme: pimeja -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-dark-base)

(defconst suwi-pimeja-palette-partial
  '()
  "Palette entries that give `suwi-pimeja' its distinctive vibe.")

(defconst suwi-pimeja-custom-faces-partial
  '()
  "Custom faces unique to `suwi-pimeja'.")

(suwi-define-dark-theme suwi-pimeja
  "Moody dark palette for the Suwi framework.")

(provide 'suwi-pimeja-theme)

;;; suwi-pimeja-theme.el ends here
