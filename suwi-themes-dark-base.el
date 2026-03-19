;;; suwi-themes-dark-base.el --- Dark base palette for Suwi themes -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;;; Commentary:
;;
;; Dark counterpart to `suwi-themes-light-base.el'.  Provides the
;; shared palette and custom faces that all dark Suwi themes inherit
;; before layering their own overrides.

;;; Code:

(require 'suwi-themes-common)

(defconst suwi-base-dark-palette
  '(

    ;; (bg-main          "#1e1e1e")
    ;; (bg-dim           "#2c2c2c")
    ;; (bg-inactive      "#353535")
    ;; (bg-active        "#464646")
    ;; (border           "#5a5d66")
    ;; (fg-dim           "#9aa3b2")
    ;; (fg-main          "#d6d7db")

    (bg-main          "#181818")
    (bg-dim           "#2b2b2b")
    (bg-inactive      "#353535")
    (bg-active        "#464646")
    (border           "#606060")
    (fg-dim           "#8899aa")
    (fg-main          "#fafafa")

    (red              "#ff3333")        ;   0°
    (red-warmer       "#ff7733")        ;  20°
    (yellow-warmer    "#ff8833")        ;  40°
    (yellow           "#ffff33")        ;  60°
    (yellow-cooler    "#88ff33")        ;  80°
    (green-warmer     "#77ff33")        ; 100°
    (green            "#33ff33")        ; 120°
    (green-cooler     "#33ff77")        ; 140°
    (cyan-cooler      "#33ff88")        ; 160°
    (cyan             "#33ffff")        ; 180°
    (cyan-warmer      "#3388ff")        ; 200°
    (blue-cooler      "#3377ff")        ; 220°
    (blue             "#3333ff")        ; 240°
    (blue-warmer      "#7733ff")        ; 260°
    (magenta-cooler   "#8833ff")        ; 280°
    (magenta          "#ff33ff")        ; 300°
    (magenta-warmer   "#ff3388")        ; 320°
    (red-cooler       "#ff3377")        ; 340°


    (red-faint        "#7a1f1f")
    (yellow-faint     "#7a7a1f")
    (green-faint      "#217a1f")
    (cyan-faint       "#1f7b7b")
    (blue-faint       "#1f1f7a")
    (magenta-faint    "#7a1f7a")

    (bg-red           "#3e0f0f")
    (bg-yellow        "#3e3e0f")
    (bg-green         "#0f3e0f")
    (bg-cyan          "#0f3e3e")
    (bg-blue          "#0f0f3e")
    (bg-magenta       "#3e0f3e")


    (bg-added           "#00381f")
    (bg-added-faint     "#002910")
    (bg-added-refine    "#034f2f")
    (bg-added-fringe    "#237f3f")
    (fg-added           "#a0e0a0")
    (fg-added-intense   "#80e080")

    (bg-changed         "#004254")
    (bg-changed-faint   "#003042")
    (bg-changed-refine  "#004f7f")
    (bg-changed-fringe  "#008fcf")
    (fg-changed         "#9fdfdf")
    (fg-changed-intense "#50c0ef")

    (bg-removed         "#4f1119")
    (bg-removed-faint   "#380a0f")
    (bg-removed-refine  "#781a1f")
    (bg-removed-fringe  "#b81a1f")
    (fg-removed         "#ffbfbf")
    (fg-removed-intense "#ff9095")



  )
  "Base dark palette shared by all Suwi derivatives before theme overrides.")

(defcustom suwi-base-dark-overrides nil
  "Overrides for entries in `suwi-base-dark-palette'.
Apply custom tweaks here before derived themes append their own
palette partials."
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
