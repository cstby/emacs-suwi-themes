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
  '(
    ;; Solo Jazz raw colors
    (white "#fafafa")
    (white-1 "#f4f4f4")
    (white-2 "#efeff1")
    (lavender "#eaeafa")
    (azure "#eafafa")
    (honeydew "#eafaea")
    (rose "#faeaea")
    (grey "#d0d0d0")
    (slate "#778ca3")
    (black "#24292e")
    (gold "#b88812")
    (orange "#ff5200")
    (red "#fe2500")
    (pink "#fa1090")
    (violet "#c71585")
    (purple+1 "#9d2dab")
    (purple "#3b2685")
    (blue "#005cc5")
    (blue+1 "#00afef")
    (teal "#009c9f")
    (teal+1 "#04c4c7")
    (green "#10d7ae")
    (diff-added "#e6ffed")
    (diff-added-highlight "#ccffd8")
    (diff-added-refine "#acf2bc")
    (diff-changed "#e4d0f7")
    (diff-changed-highlight "#dbb8fd")
    (diff-removed "#ffeef0")
    (diff-removed-highlight "#ffd7d5")
    (diff-removed-refine "#fdb8c0")

    ;; Palette entries mapped to Modus semantics
    (bg-main white)
    (fg-main purple)
    (fg-alt violet)
    (bg-active azure)
    (bg-inactive white-1)
    (accent-0 teal+1)
    (accent-1 orange)
    (accent-2 green)
    (accent-3 purple+1)
    (rainbow-0 teal+1)
    (rainbow-1 orange)
    (rainbow-2 green)
    (rainbow-3 purple)
    (rainbow-4 purple+1)
    (rainbow-5 blue+1)
    (rainbow-6 red)
    (rainbow-7 blue)
    (rainbow-8 pink)
    (prompt purple+1)
    (keyword teal)
    (string blue+1)
    (comment slate)
    (type blue)
    (fnname violet)
    (variable purple)
    (constant blue)
    (builtin blue)
    (docstring comment))
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
