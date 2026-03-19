;;; suwi-harbor-theme.el --- Suwi theme: harbor -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-light-base)

(defconst suwi-harbor-palette-partial
  '((harbor-fg "#0B3446")
    (harbor-teal "#008299")
    (harbor-rose "#D94574")
    (harbor-pink "#FF7F96")

    (suwi-base harbor-fg)
    (suwi-primary harbor-teal)
    (suwi-secondary harbor-rose)
    (suwi-tertiary harbor-pink))
  "Palette entries that give `suwi-harbor' its distinctive vibe.")

(defconst suwi-harbor-custom-faces-partial nil
  "No extra custom faces; rely on the shared light base.")

(suwi-define-light-theme suwi-harbor
  "Retro pastel palette for the Suwi framework.")

(provide 'suwi-harbor-theme)

;;; suwi-harbor-theme.el ends here
