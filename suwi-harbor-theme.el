;;; suwi-harbor-theme.el --- Retro pastel Suwi light theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Light Suwi variant inspired by the Solo Harbor palette.  Uses the
;; shared light base and tweaks a handful of accents to echo the
;; teal–purple cup motif without adding extra custom faces.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-light-base)

(defconst suwi-harbor-palette-partial
  '(

    (harbor-fg "#0B3446")
    (harbor-0  "#008299")
    (harbor-2  "#D94574")
    (harbor-3  "#FF7F96")

    (accent-0 harbor-0)
    (accent-1 harbor-0)
    (accent-2 harbor-2)
    (accent-3 harbor-3)

    (fg-main harbor-fg))
  "Palette entries that give `suwi-harbor' its distinctive vibe.")

(defconst suwi-harbor-custom-faces-partial nil
  "No extra custom faces; rely on the shared light base.")

(suwi-define-light-theme suwi-harbor
  "Retro pastel palette for the Suwi framework.")

(provide 'suwi-harbor-theme)

;;; suwi-harbor-theme.el ends here
