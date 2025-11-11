;;; suwi-themes-dark-base.el --- Dark base palette for Suwi themes -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Dark counterpart to `suwi-themes-light-base.el'.  Provides the
;; shared palette and custom faces that all dark Suwi themes inherit
;; before layering their own overrides.

;;; Code:

(require 'suwi-themes)

(defconst suwi-base-dark-palette
  '((accent-0 "#ff7ab3")
    (accent-1 "#f7b733")
    (accent-2 "#29c7ac")
    (accent-3 "#7b8cff")

    (cursor accent-0)
    (bg-main "#11151c")
    (bg-dim "#181f27")
    (bg-alt "#1d2430")
    (fg-main "#f6f4f2")
    (fg-dim "#c5c3c0")
    (fg-alt "#f4c2ff")
    (bg-active "#2a3142")
    (bg-inactive "#171c24")
    (border "#3c4457")

    (red "#ff5f6d")
    (red-warmer "#ff8560")
    (red-cooler "#ff4f96")
    (red-faint "#c85a6c")
    (green "#2bc7a3")
    (green-warmer "#55d46e")
    (green-cooler "#2abed8")
    (green-faint "#4a9f8d")
    (yellow "#f4c146")
    (yellow-warmer "#ffab4d")
    (yellow-cooler "#ff9f72")
    (yellow-faint "#d38b4e")
    (blue "#79a7ff")
    (blue-warmer "#9f8bff")
    (blue-cooler "#58b0ff")
    (blue-faint "#7c91d9")
    (magenta "#e58bff")
    (magenta-warmer "#ff8ff0")
    (magenta-cooler "#c38bff")
    (magenta-faint "#b07cce")
    (cyan "#4bd8ff")
    (cyan-warmer "#6ccfff")
    (cyan-cooler "#32c1ff")
    (cyan-faint "#7cc5e5")

    (bg-red-intense "#43141d")
    (bg-green-intense "#103c2d")
    (bg-yellow-intense "#3f2e00")
    (bg-blue-intense "#112347")
    (bg-magenta-intense "#3a1d4a")
    (bg-cyan-intense "#062c38")

    (bg-red-subtle "#2a131b")
    (bg-green-subtle "#12251f")
    (bg-yellow-subtle "#2a1f0b")
    (bg-blue-subtle "#141c2c")
    (bg-magenta-subtle "#1d1428")
    (bg-cyan-subtle "#102228")

    (bg-added "#0f3a2d")
    (bg-added-faint "#0c2d24")
    (bg-added-refine "#13503b")
    (fg-added "#76f7c5")

    (bg-changed "#362905")
    (bg-changed-faint "#2b2108")
    (bg-changed-refine "#4c3a06")
    (fg-changed "#facf73")

    (bg-removed "#4a1822")
    (bg-removed-faint "#381017")
    (bg-removed-refine "#6d2230")
    (fg-removed "#ff8da4")

    (bg-mode-line-active "#2f3546")
    (fg-mode-line-active "#fcecff")
    (bg-mode-line-inactive "#1c202b")
    (fg-mode-line-inactive "#9ca1b7")

    (bg-hl-line "#1a202d")
    (bg-region "#252d3d")
    (bg-paren-match "#21455a")
    (bg-prominent-note "#123831")
    (bg-prominent-err "#3f1a2a")
    (bg-prominent-warning "#3a2b12")

    (rainbow-0 accent-0)
    (rainbow-1 accent-1)
    (rainbow-2 accent-2)
    (rainbow-3 accent-3)
    (rainbow-4 "#ff82d7")
    (rainbow-5 "#9ad4ff")
    (rainbow-6 "#ff5f96")
    (rainbow-7 "#45c9ff")
    (rainbow-8 "#ffb7ff")

    (mail-cite-0 "#f57fb0")
    (mail-cite-1 "#7aa5ff")
    (mail-cite-2 "#42c4f5")
    (mail-cite-3 "#4fd6ab")

    (prompt "#ff8fd1")
    (keyword "#c38bff")
    (string "#f3b35d")
    (comment "#8790ad")
    (type "#58d7ff")
    (fnname accent-0)
    (variable accent-3)
    (constant "#ff7f9d"))
  "Base dark palette shared by all Suwi derivatives before theme overrides.")

(defcustom suwi-base-dark-overrides nil
  "Overrides for entries in `suwi-base-dark-palette'.
Apply custom tweaks here before derived themes append their own palette partials."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-base-dark-custom-faces-partial
  '(
    `(diff-hl-insert ((,c :background ,bg-added :foreground ,fg-added)))
    `(diff-hl-delete ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(diff-hl-change ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(highlight-numbers-number ((,c :foreground ,accent-2)))
    `(show-paren-match ((,c :background ,bg-paren-match :foreground ,fg-main :weight bold)))
    `(org-table ((,c :foreground ,accent-1))))
  "Custom faces shared by all dark suwi themes.")

(defconst suwi-base-dark-palette-full
  (append suwi-base-dark-overrides suwi-base-dark-palette suwi-common-palette)
  "Full dark palette after applying user overrides and shared semantics.")

(defconst suwi-base-dark-all-custom-faces
  (append suwi-common-custom-faces
          suwi-base-dark-custom-faces-partial)
  "Full custom faces appended with the shared common custom faces.")

(provide 'suwi-themes-dark-base)

;;; suwi-themes-dark-base.el ends here
