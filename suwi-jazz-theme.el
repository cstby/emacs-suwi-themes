;;; suwi-jazz-theme.el --- Retro pastel Suwi light theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl

;;; Commentary:
;;
;; Light Suwi variant inspired by the Solo Jazz palette.  Uses the
;; shared light base and tweaks a handful of accents to echo the
;; teal–purple cup motif without adding extra custom faces.

;;; Code:

(require 'suwi-themes)
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

(suwi-define-light-theme suwi-jazz
  "Retro pastel palette for the Suwi framework.")

(provide 'suwi-jazz-theme)

;;; suwi-jazz-theme.el ends here
