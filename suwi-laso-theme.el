;;; suwi-laso-theme.el --- Suwi theme: laso -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-light-base)

(defconst suwi-laso-palette-partial
  '((suwi-fg        "#03106E")
    (suwi-primary   "#2251aa")
    (suwi-secondary "#2583d4")
    (suwi-tertiary  "#5ba8be"))
  "Palette entries that give `suwi-laso' its distinctive vibe.")

(defconst suwi-laso-custom-faces-partial
  '()
  "Custom faces unique to `suwi-laso'.")

(suwi-define-light-theme suwi-laso
  "Deep blue light theme.")

(provide 'suwi-laso-theme)

;;; suwi-laso-theme.el ends here
