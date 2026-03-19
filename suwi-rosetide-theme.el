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
  '((rosetide-fg "#0B3446")
    (rosetide-teal "#008299")
    (rosetide-rose "#D94574")
    (rosetide-pink "#FF7F96")

    (suwi-fg rosetide-fg)
    (suwi-primary rosetide-teal)
    (suwi-secondary rosetide-rose)
    (suwi-tertiary rosetide-pink))
  "Palette entries that give `suwi-rosetide' its distinctive vibe.")

(defconst suwi-rosetide-custom-faces-partial nil
  "No extra custom faces; rely on the shared light base.")

(suwi-define-light-theme suwi-rosetide
  "Retro pastel palette for the Suwi framework.")

(provide 'suwi-rosetide-theme)

;;; suwi-rosetide-theme.el ends here
