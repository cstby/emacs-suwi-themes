;;; suwi-walo-theme.el --- Suwi light theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Minimal light representative of the Suwi theme family.  Builds on
;; the shared light base palette without adding extra accents yet.

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
