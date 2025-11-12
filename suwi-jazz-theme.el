;;; suwi-jazz-theme.el --- Retro pastel Suwi light theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Light Suwi variant inspired by the Solo Jazz palette.  Uses the
;; shared light base and tweaks a handful of accents to echo the
;; teal–purple cup motif without adding extra custom faces.

;;; Code:

(require 'suwi-themes-light-base)

(defconst suwi-jazz-palette-partial
  '((bg-main "#fafafa")
    (fg-main "#3b2685")
    (fg-alt "#c71585")
    (bg-active "#eafafa")
    (bg-inactive "#f4f4f4")
    (accent-0 "#04c4c7")
    (accent-1 "#ff5200")
    (accent-2 "#10d7ae")
    (accent-3 "#9d2dab")
    (rainbow-0 "#04c4c7")
    (rainbow-1 "#ff5200")
    (rainbow-2 "#10d7ae")
    (rainbow-3 "#3b2685")
    (rainbow-4 "#9d2dab")
    (rainbow-5 "#00afef")
    (rainbow-6 "#fe2500")
    (rainbow-7 "#005cc5")
    (rainbow-8 "#fa1090")
    (prompt "#9d2dab")
    (keyword "#009c9f")
    (string "#ffb347")
    (comment "#778ca3")
    (type "#005cc5")
    (fnname "#9d2dab")
    (variable "#00afef")
    (constant "#b88812"))
  "Palette entries that give `suwi-jazz' its distinctive vibe.")

(defconst suwi-jazz-custom-faces-partial nil
  "No extra custom faces; rely on the shared light base.")

(defcustom suwi-jazz-palette-overrides nil
  "User palette overrides evaluated after `suwi-jazz-palette'."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-jazz-palette
  (append suwi-jazz-palette-partial suwi-base-light-palette-full)
  "Complete palette for `suwi-jazz'.")

(defconst suwi-jazz-custom-faces
  (append suwi-base-light-all-custom-faces suwi-jazz-custom-faces-partial)
  "Complete custom-face list for `suwi-jazz'.")

(modus-themes-theme
 'suwi-jazz
 'suwi-themes
 "Retro pastel palette for the Suwi framework."
 'light
 'modus-operandi-palette
 'suwi-jazz-palette
 'suwi-jazz-palette-overrides
 'suwi-jazz-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-jazz-theme)

;;; suwi-jazz-theme.el ends here
