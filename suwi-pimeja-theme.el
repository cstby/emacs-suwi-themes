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

(defcustom suwi-pimeja-palette-overrides nil
  "User palette overrides evaluated after `suwi-pimeja-palette'."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-pimeja-palette
  (append suwi-pimeja-palette-partial suwi-base-dark-palette-full)
  "Complete palette for `suwi-pimeja'.")

(defconst suwi-pimeja-custom-faces
  (append suwi-base-dark-all-custom-faces suwi-pimeja-custom-faces-partial)
  "Complete custom-face list for `suwi-pimeja'.")

(modus-themes-theme
 'suwi-pimeja
 'suwi-themes
 "Moody dark palette for the Suwi framework."
 'dark
 'modus-vivendi-palette
 'suwi-pimeja-palette
 'suwi-pimeja-palette-overrides
 'suwi-pimeja-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-pimeja-theme)

;;; suwi-pimeja-theme.el ends here
