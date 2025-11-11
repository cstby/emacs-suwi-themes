;;; suwi-themes-light-base.el --- Light base palette for Suwi themes -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Defines the shared light palette that all Suwi light themes inherit
;; from, plus helpers for extending it with theme-specific colors.

;;; Code:

(require 'suwi-themes)

(defconst suwi-base-light-palette
  '((accent-0 "#ff5fcb")
    (accent-1 "#f0a000")
    (accent-2 "#2fbf96")
    (accent-3 "#5d65ff")

    (cursor accent-0)
    (bg-main "#fff6fb")
    (bg-dim "#e6fff2")
    (bg-alt "#ffdceb")
    (fg-main "#4a275a")
    (fg-dim "#6a506d")
    (fg-alt "#a0227d")
    (bg-active "#f3c7df")
    (bg-inactive "#fdf0f6")
    (border "#f09ed0")

    (red "#f44773")
    (red-warmer "#ff3c5c")
    (red-cooler "#eb4ca0")
    (red-faint "#d45a7b")
    (green "#2fbf96")
    (green-warmer "#55c759")
    (green-cooler "#1fa9d6")
    (green-faint "#5ca488")
    (yellow "#f0a000")
    (yellow-warmer "#ff9500")
    (yellow-cooler "#f08a5c")
    (yellow-faint "#d58a5f")
    (blue "#5d65ff")
    (blue-warmer "#7c5dff")
    (blue-cooler "#3f8dff")
    (blue-faint "#6c74d4")
    (magenta "#ff5fd7")
    (magenta-warmer "#ff3fee")
    (magenta-cooler "#c150ff")
    (magenta-faint "#d060c5")
    (cyan "#2bd4f0")
    (cyan-warmer "#4bd0ff")
    (cyan-cooler "#00b7f5")
    (cyan-faint "#6cbfe0")

    (bg-red-intense "#ffd0dd")
    (bg-green-intense "#c8f6dd")
    (bg-yellow-intense "#ffe4a3")
    (bg-blue-intense "#dfe7ff")
    (bg-magenta-intense "#ffd4ff")
    (bg-cyan-intense "#c6f4ff")

    (bg-red-subtle "#ffebf1")
    (bg-green-subtle "#e6fff2")
    (bg-yellow-subtle "#fff7df")
    (bg-blue-subtle "#eff1ff")
    (bg-magenta-subtle "#fdefff")
    (bg-cyan-subtle "#ecfdff")

    (bg-added "#d3ffe7")
    (bg-added-faint "#e7fff3")
    (bg-added-refine "#bcf2d6")
    (fg-added "#0b744a")

    (bg-changed "#ffeecf")
    (bg-changed-faint "#fff5df")
    (bg-changed-refine "#fcd9a8")
    (fg-changed "#80510a")

    (bg-removed "#ffd8e5")
    (bg-removed-faint "#ffe6ef")
    (bg-removed-refine "#f4bcd0")
    (fg-removed "#a6223f")

    (bg-mode-line-active "#ffb2ea")
    (fg-mode-line-active "#4a275a")
    (bg-mode-line-inactive "#f8e0f0")
    (fg-mode-line-inactive "#7c658a")

    (bg-hl-line "#ffeefd")
    (bg-region "#ffd6f1")
    (bg-paren-match "#c4e0ff")
    (bg-prominent-note "#e7fefc")
    (bg-prominent-err "#ffe3ea")
    (bg-prominent-warning "#fff1d9")

    (rainbow-0 accent-0)
    (rainbow-1 accent-1)
    (rainbow-2 accent-2)
    (rainbow-3 accent-3)
    (rainbow-4 "#ff3fee")
    (rainbow-5 "#3f8dff")
    (rainbow-6 "#eb4ca0")
    (rainbow-7 "#00b7f5")
    (rainbow-8 "#ffd4ff")

    (mail-cite-0 "#d75f87")
    (mail-cite-1 "#5d65ff")
    (mail-cite-2 "#2bd4f0")
    (mail-cite-3 "#55c759")

    (prompt "#a0227d")
    (keyword "#b050d4")
    (string "#f0a000")
    (comment "#8f6a9a")
    (type "#2bd4f0")
    (fnname accent-0)
    (variable "#5d65ff")
    (constant "#ff5f73"))
  "Base light palette shared by all light suwi themes.")

(defcustom suwi-base-light-overrides nil
  "Overrides for entries in `suwi-base-light-palette'.
Apply custom tweaks here before derived themes append their own palette partials."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-base-light-custom-faces-partial
  '(
    `(diff-hl-insert ((,c :background ,bg-added :foreground ,fg-added)))
    `(diff-hl-delete ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(diff-hl-change ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(highlight-numbers-number ((,c :foreground ,accent-2)))
    `(show-paren-match ((,c :background ,bg-paren-match :foreground ,fg-main :weight bold)))
    `(org-table ((,c :foreground ,accent-1))))
  "Custom faces shared by all light suwi themes.")

(defconst suwi-base-light-palette-full
  (append suwi-base-light-overrides suwi-base-light-palette suwi-common-palette)
  "Full light palette after applying user overrides and shared semantics.")

(defconst suwi-base-light-all-custom-faces
  (append suwi-common-custom-faces
          suwi-base-light-custom-faces-partial)
  "Full custom faces appended with the shared common custom faces.")

(provide 'suwi-themes-light-base)

;;; suwi-themes-light-base.el ends here
