;;; suwi-rosetide-theme.el --- Suwi theme: rosetide -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-light-base)

(defconst suwi-rosetide-palette-partial
  '((suwi-fg        "#0B3446")
    (suwi-primary   "#008299")
    (suwi-secondary "#d42b61")
    (suwi-tertiary  "#FF7F96"))
  "Palette entries that give `suwi-rosetide' its distinctive vibe.")

(defconst suwi-rosetide-custom-faces-partial nil
  "No extra custom faces; rely on the shared light base.")

(suwi-define-light-theme suwi-rosetide
  "Rose and teal light theme.")

(provide 'suwi-rosetide-theme)

;;; suwi-rosetide-theme.el ends here
