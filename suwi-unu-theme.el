;;; suwi-unu-theme.el --- Moody dark test theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; First dark representative of the Suwi theme family.  Builds on the
;; shared dark base palette while nudging a few key accents toward a
;; neon “unu” mood.

;;; Code:

(require 'suwi-themes)
(require 'suwi-themes-dark-base)

(defconst suwi-unu-palette-partial
  '(
    ;; (unu-fg "#e0dcef")
    (unu-fg "#d1cbe7")
    (unu-0 "#aeabed")
    (unu-2 "#8a80ff")
    ;; (unu-3 "#7866ff")
    (unu-3 "#614dff")

    (accent-0 unu-0)
    (accent-1 unu-0)
    (accent-2 unu-2)
    (accent-3 unu-3)

    (fg-main unu-fg)


    )
  "Palette entries that give `suwi-unu' its distinctive vibe.")

(defconst suwi-unu-custom-faces-partial
  '()
  "Custom faces unique to `suwi-unu'.")

(suwi-define-dark-theme suwi-unu
  "Moody dark palette for the Suwi framework.")

(provide 'suwi-unu-theme)

;;; suwi-unu-theme.el ends here
