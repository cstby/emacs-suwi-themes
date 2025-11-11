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

(defconst suwi-base-light-color-alist
  '((pink-0 . "#fff6fb")
    (pink-1 . "#ffdceb")
    (violet-0 . "#4a275a")
    (violet-1 . "#6a506d")
    (violet-2 . "#a0227d")
    (pink-2 . "#f3c7df")
    (pink-3 . "#fdf0f6")
    (border-0 . "#f09ed0")

    (red-0 . "#f44773")
    (red-warm . "#ff3c5c")
    (red-cool . "#eb4ca0")
    (red-faint . "#d45a7b")
    (green-0 . "#2fbf96")
    (green-warm . "#55c759")
    (green-cool . "#1fa9d6")
    (green-faint . "#5ca488")
    (yellow-0 . "#f0a000")
    (yellow-warm . "#ff9500")
    (yellow-cool . "#f08a5c")
    (yellow-faint . "#d58a5f")
    (blue-0 . "#5d65ff")
    (blue-warm . "#7c5dff")
    (blue-cool . "#3f8dff")
    (blue-faint . "#6c74d4")
    (magenta-0 . "#ff5fd7")
    (magenta-warm . "#ff3fee")
    (magenta-cool . "#c150ff")
    (magenta-faint . "#d060c5")
    (cyan-0 . "#2bd4f0")
    (cyan-warm . "#4bd0ff")
    (cyan-cool . "#00b7f5")
    (cyan-faint . "#6cbfe0")

    (red-intense . "#ffd0dd")
    (green-intense . "#c8f6dd")
    (yellow-intense . "#ffe4a3")
    (blue-intense . "#dfe7ff")
    (magenta-intense . "#ffd4ff")
    (cyan-intense . "#c6f4ff")

    (red-subtle . "#ffebf1")
    (green-subtle . "#e6fff2")
    (yellow-subtle . "#fff7df")
    (blue-subtle . "#eff1ff")
    (magenta-subtle . "#fdefff")
    (cyan-subtle . "#ecfdff")

    (added-bg . "#d3ffe7")
    (added-bg-faint . "#e7fff3")
    (added-bg-refine . "#bcf2d6")
    (added-fg . "#0b744a")

    (changed-bg . "#ffeecf")
    (changed-bg-faint . "#fff5df")
    (changed-bg-refine . "#fcd9a8")
    (changed-fg . "#80510a")

    (removed-bg . "#ffd8e5")
    (removed-bg-faint . "#ffe6ef")
    (removed-bg-refine . "#f4bcd0")
    (removed-fg . "#a6223f")

    (mode-line-active-bg . "#ffb2ea")
    (mode-line-active-fg . "#4a275a")
    (mode-line-inactive-bg . "#f8e0f0")
    (mode-line-inactive-fg . "#7c658a")

    (hl-line-bg . "#ffeefd")
    (region-bg . "#ffd6f1")
    (paren-bg . "#c4e0ff")
    (note-bg . "#e7fefc")
    (err-bg . "#ffe3ea")
    (warn-bg . "#fff1d9")

    (accent-0 . "#ff5fcb")
    (accent-1 . "#f0a000")
    (accent-2 . "#2fbf96")
    (accent-3 . "#5d65ff")

    (rainbow-0 . "#ff5fcb")
    (rainbow-1 . "#f0a000")
    (rainbow-2 . "#2fbf96")
    (rainbow-3 . "#5d65ff")
    (rainbow-4 . "#ff3fee")
    (rainbow-5 . "#3f8dff")
    (rainbow-6 . "#eb4ca0")
    (rainbow-7 . "#00b7f5")
    (rainbow-8 . "#ffd4ff")

    (mail-cite-0 . "#d75f87")
    (mail-cite-1 . "#5d65ff")
    (mail-cite-2 . "#2bd4f0")
    (mail-cite-3 . "#55c759")

    (prompt . "#a0227d")
    (keyword . "#b050d4")
    (string . "#f0a000")
    (comment . "#8f6a9a")
    (type . "#2bd4f0")
    (fnname . "#ff5fcb")
    (variable . "#5d65ff")
    (constant . "#ff5f73"))
  "Named color catalog for the light Suwi base.")

(defconst suwi-base-light-palette-mapping
  '((cursor . accent-0)
    (bg-main . pink-0)
    (bg-dim . green-subtle)
    (bg-alt . pink-1)
    (fg-main . violet-0)
    (fg-dim . violet-1)
    (fg-alt . violet-2)
    (bg-active . pink-2)
    (bg-inactive . pink-3)
    (border . border-0)

    (red . red-0)
    (red-warmer . red-warm)
    (red-cooler . red-cool)
    (red-faint . red-faint)
    (green . green-0)
    (green-warmer . green-warm)
    (green-cooler . green-cool)
    (green-faint . green-faint)
    (yellow . yellow-0)
    (yellow-warmer . yellow-warm)
    (yellow-cooler . yellow-cool)
    (yellow-faint . yellow-faint)
    (blue . blue-0)
    (blue-warmer . blue-warm)
    (blue-cooler . blue-cool)
    (blue-faint . blue-faint)
    (magenta . magenta-0)
    (magenta-warmer . magenta-warm)
    (magenta-cooler . magenta-cool)
    (magenta-faint . magenta-faint)
    (cyan . cyan-0)
    (cyan-warmer . cyan-warm)
    (cyan-cooler . cyan-cool)
    (cyan-faint . cyan-faint)

    (bg-red-intense . red-intense)
    (bg-green-intense . green-intense)
    (bg-yellow-intense . yellow-intense)
    (bg-blue-intense . blue-intense)
    (bg-magenta-intense . magenta-intense)
    (bg-cyan-intense . cyan-intense)

    (bg-red-subtle . red-subtle)
    (bg-green-subtle . green-subtle)
    (bg-yellow-subtle . yellow-subtle)
    (bg-blue-subtle . blue-subtle)
    (bg-magenta-subtle . magenta-subtle)
    (bg-cyan-subtle . cyan-subtle)

    (bg-added . added-bg)
    (bg-added-faint . added-bg-faint)
    (bg-added-refine . added-bg-refine)
    (fg-added . added-fg)

    (bg-changed . changed-bg)
    (bg-changed-faint . changed-bg-faint)
    (bg-changed-refine . changed-bg-refine)
    (fg-changed . changed-fg)

    (bg-removed . removed-bg)
    (bg-removed-faint . removed-bg-faint)
    (bg-removed-refine . removed-bg-refine)
    (fg-removed . removed-fg)

    (bg-mode-line-active . mode-line-active-bg)
    (fg-mode-line-active . mode-line-active-fg)
    (bg-mode-line-inactive . mode-line-inactive-bg)
    (fg-mode-line-inactive . mode-line-inactive-fg)

    (bg-hl-line . hl-line-bg)
    (bg-region . region-bg)
    (bg-paren-match . paren-bg)
    (bg-prominent-note . note-bg)
    (bg-prominent-err . err-bg)
    (bg-prominent-warning . warn-bg)

    (accent-0 . accent-0)
    (accent-1 . accent-1)
    (accent-2 . accent-2)
    (accent-3 . accent-3)

    (rainbow-0 . rainbow-0)
    (rainbow-1 . rainbow-1)
    (rainbow-2 . rainbow-2)
    (rainbow-3 . rainbow-3)
    (rainbow-4 . rainbow-4)
    (rainbow-5 . rainbow-5)
    (rainbow-6 . rainbow-6)
    (rainbow-7 . rainbow-7)
    (rainbow-8 . rainbow-8)

    (mail-cite-0 . mail-cite-0)
    (mail-cite-1 . mail-cite-1)
    (mail-cite-2 . mail-cite-2)
    (mail-cite-3 . mail-cite-3)

    (prompt . prompt)
    (keyword . keyword)
    (string . string)
    (comment . comment)
    (type . type)
    (fnname . fnname)
    (variable . variable)
    (constant . constant))
  "Maps Modus palette keys to named colors for the light base.")

(defcustom suwi-base-light-overrides nil
  "Overrides for `suwi-base-light-palette'.
Use this to tweak base colors before derived themes add their own entries."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defun suwi-build-light-color-table (&rest extra-colors)
  "Return a color table combining base light colors and EXTRA-COLORS."
  (apply #'suwi-collect-colors suwi-base-light-color-alist extra-colors))

(defun suwi-build-light-palette-mapping (color-table &rest mapping-overrides)
  "Resolve palette using COLOR-TABLE plus MAPPING-OVERRIDES.
`mapping-overrides' should be alists of (PALETTE-SYMBOL . COLOR-NAME)."
  (let ((merged (copy-sequence suwi-base-light-palette-mapping)))
    (dolist (override mapping-overrides)
      (dolist (entry override)
        (setf (alist-get (car entry) merged) (cdr entry))))
    (suwi-map-palette merged color-table)))

(defconst suwi-base-light-face-overrides
  '(
    `(diff-hl-insert ((,c :background ,bg-added :foreground ,fg-added)))
    `(diff-hl-delete ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(diff-hl-change ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(highlight-numbers-number ((,c :foreground ,accent-2)))
    `(show-paren-match ((,c :background ,bg-paren-match :foreground ,fg-main :weight bold)))
    `(org-table ((,c :foreground ,accent-1))))
  "Chromatic overrides specific to the light Suwi base.")

(defun suwi-build-light-palette (color-table &rest mapping-overrides)
  "Produce a full palette using COLOR-TABLE and MAPPING-OVERRIDES."
  (append
   (apply #'suwi-build-light-palette-mapping color-table mapping-overrides)
   suwi-common-modus-mappings))

(defconst suwi-base-light-all-face-overrides
  (append suwi-common-face-overrides
          suwi-base-light-face-overrides)
  "Face overrides applied by any Suwi theme derived from the light base.")

(provide 'suwi-themes-light-base)

;;; suwi-themes-light-base.el ends here
