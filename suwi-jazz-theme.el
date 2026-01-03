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
    (jazz-white "#fafafa")
    (jazz-white-1 "#f4f4f4")
    (jazz-white-2 "#efeff1")
    (jazz-lavender "#eaeafa")
    (jazz-azure "#eafafa")
    (jazz-honeydew "#eafaea")
    (jazz-rose "#faeaea")
    (jazz-grey "#d0d0d0")
    (jazz-slate "#778ca3")
    (jazz-black "#24292e")
    (jazz-gold "#b88812")
    (jazz-orange "#ff5200")
    (jazz-red "#fe2500")
    (jazz-pink "#fa1090")
    (jazz-violet "#c71585")
    (jazz-purple+1 "#9d2dab")
    (jazz-purple "#3b2685")
    (jazz-blue "#005cc5")
    (jazz-blue+1 "#00afef")
    (jazz-teal "#009c9f")
    (jazz-teal+1 "#04c4c7")
    (jazz-green "#10d7ae")

    (diff-added "#e6ffed")
    (diff-added-highlight "#ccffd8")
    (diff-added-refine "#acf2bc")
    (diff-changed "#e4d0f7")
    (diff-changed-highlight "#dbb8fd")
    (diff-removed "#ffeef0")
    (diff-removed-highlight "#ffd7d5")
    (diff-removed-refine "#fdb8c0")

    ;; Palette entries mapped to Modus semantics

    ;; Accent 0: directories, unstaged changes, local git branches,
    ;; Accent 1: git remotes
    ;; Accent 2: git hashes, magit filename
    ;; Accent 3: pretty much never used. magit tags,

    (accent-0 jazz-teal)
    (accent-1 jazz-blue)
    (accent-2 jazz-pink)
    (accent-3 jazz-gold)

    (bg-main jazz-white)
    (fg-main jazz-purple)
    (bg-active jazz-azure)
    (keyword jazz-teal)
    (string jazz-blue+1)
    (comment jazz-slate)
    (type jazz-blue)
    (fnname jazz-violet)
    (variable jazz-violet)
    (constant jazz-blue)
    (builtin jazz-blue))
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
