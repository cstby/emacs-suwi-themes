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

(require 'suwi-themes-common)

(defconst suwi-base-light-palette
  '(
    ;; Basic values

    (bg-main          "#fafafa")
    (bg-dim           "#efefef")
    (bg-inactive      "#e0e0e0")
    (bg-active        "#c4c4c4")
    (border           "#9f9f9f")
    (fg-dim           "#778899")
    (fg-main          "#333333")

    (red              "#cc0000")        ;   0°
    (red-warmer       "#cc4400")        ;  20°
    (yellow-warmer    "#cc8800")        ;  40°
    (yellow           "#cccc00")        ;  60°
    (yellow-cooler    "#88cc00")        ;  80°
    (green-warmer     "#44cc00")        ; 100°
    (green            "#00cc00")        ; 120°
    (green-cooler     "#00cc44")        ; 140°
    (cyan-cooler      "#00cc88")        ; 160°
    (cyan             "#00cccc")        ; 180°
    (cyan-warmer      "#0088cc")        ; 200°
    (blue-cooler      "#0044cc")        ; 220°
    (blue             "#0000cc")        ; 240°
    (blue-warmer      "#4400cc")        ; 260°
    (magenta-cooler   "#8800cc")        ; 280°
    (magenta          "#cc00cc")        ; 300°
    (magenta-warmer   "#cc0088")        ; 320°
    (red-cooler       "#cc0044")        ; 340°

    (red-faint        "#e08585")
    (yellow-faint     "#e0e085")
    (green-faint      "#86e085")
    (cyan-faint       "#85e1e1")
    (blue-faint       "#8585e0")
    (magenta-faint    "#e085e0")

    (bg-red           "#f0c2c2")
    (bg-yellow        "#f0f0c2")
    (bg-green         "#c2f0c2")
    (bg-cyan          "#c2f0f0")
    (bg-blue          "#c2c2f0")
    (bg-magenta       "#f0c2f0")

    ;; Diffs

    (bg-added         "#c1f2d1")
    (bg-added-faint   "#d8f8e1")
    (bg-added-refine  "#aee5be")
    (fg-added         "#005000")
    (fg-added-intense "#006700")
    (bg-added-fringe   bg-added)

    (bg-changed           "#d5d7ff")
    (bg-changed-faint     "#e6e6ff")
    (bg-changed-refine    "#babcef")
    (fg-changed           "#303099")
    (fg-changed-intense   "#0303cc")
    (bg-changed-fringe    bg-changed)


    (bg-removed-faint   "#ffe9e9")
    (bg-removed         "#ffd8d5")
    (bg-removed-refine  "#f3b5af")
    (fg-removed         "#8f1313")
    (fg-removed-intense "#aa2222")
    (bg-removed-fringe bg-removed)


    )
  "Base light palette shared by all light suwi themes.")

(defcustom suwi-base-light-overrides nil
  "Overrides for entries in `suwi-base-light-palette'.
Apply custom tweaks here before derived themes append their own
palette partials."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-base-light-custom-faces-partial
  '(
    `(tab-bar-tab-inactive ((,c :box (:line-width -2 :color ,bg-tab-bar) :foreground ,fg-dim :background ,bg-tab-bar)))
    `(centaur-tabs-unselected ((,c :box (:line-width -2 :color ,bg-tab-other) :foreground ,fg-dim :background ,bg-tab-other)))
    `(centaur-tabs-unselected-modified ((,c :inherit italic :box (:line-width -2 :color ,bg-tab-other) :foreground ,fg-dim :background ,bg-tab-other))))
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
