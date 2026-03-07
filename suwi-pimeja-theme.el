;;; suwi-pimeja-theme.el --- Moody dark test theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; First dark representative of the Suwi theme family.  Builds on the
;; shared dark base palette while nudging a few key accents toward a
;; neon “pimeja” mood.

;;; Code:

(require 'suwi-themes-dark-base)

(defconst suwi-pimeja-palette-partial
  '()
  "Palette entries that give `suwi-pimeja' its distinctive vibe.")

(defconst suwi-pimeja-custom-faces-partial
  '()
  "Custom faces unique to `suwi-pimeja'.")

(suwi-define-theme suwi-pimeja
  "Moody dark palette for the Suwi framework."
  dark
  modus-vivendi-palette
  suwi-base-dark-palette-full
  suwi-base-dark-all-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-pimeja-theme)

;;; suwi-pimeja-theme.el ends here
