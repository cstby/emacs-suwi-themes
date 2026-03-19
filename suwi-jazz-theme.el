;;; suwi-jazz-theme.el --- Suwi theme: jazz -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; This file is part of the `suwi-themes' package, a collection of
;; themes for GNU Emacs built on top of `modus-themes'.

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

    (suwi-fg jazz-purple)
    (suwi-primary jazz-teal)
    (suwi-secondary jazz-pink)
    (suwi-tertiary jazz-gold)

    (bg-main jazz-white)
    (bg-active jazz-azure)
    (suwi-keyword jazz-teal)
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
