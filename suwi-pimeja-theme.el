;;; suwi-pimeja-theme.el --- Dark Suwi theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Minimal dark representative of the Suwi theme family.  Builds on
;; the shared dark base palette without adding extra accents yet.

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
