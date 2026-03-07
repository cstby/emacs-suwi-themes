;;; suwi-walo-theme.el --- Sweet vivid test theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; MVP theme that demonstrates how Suwi themes build on the shared
;; light base palette while adding their own accent choices.

;;; Code:

(require 'suwi-themes-light-base)

(defconst suwi-walo-palette-partial
  '()
  "Palette entries that give `suwi-walo' its distinctive vibe.")

(defconst suwi-walo-custom-faces-partial
  '()
  "Custom faces that give `suwi-walo' its distinctive vibe.")

(suwi-define-theme suwi-walo
  "Sweet, vivid test palette for the Suwi framework."
  light
  modus-operandi-palette
  suwi-base-light-palette-full
  suwi-base-light-all-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-walo-theme)

;;; suwi-walo-theme.el ends here
