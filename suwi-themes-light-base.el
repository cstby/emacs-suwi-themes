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
  '(
    ;; Basic values

    (bg-main "#fafafa")
    (bg-dim "#efefef")
    (bg-inactive "#e0e0e0")
    (bg-active "#c4c4c4")
    (border "#9f9f9f")
    (fg-dim "#778899")
    (fg-main "#333333")

    (fringe bg-main)

    (bg-hl-line bg-dim)
    (bg-completion bg-hl-line)

    (bg-region bg-inactive)
    (fg-region fg-main)

    (fg-alt fg-main)
    (bg-tab-bar bg-dim)
    (bg-tab-current bg-main)
    (bg-tab-other bg-tab-bar)

    (bg-mode-line-active bg-dim)
    (fg-mode-line-active fg-main)
    (border-mode-line-active bg-mode-line-active)

    (bg-mode-line-inactive bg-main)
    (fg-mode-line-inactive fg-dim)
    (border-mode-line-inactive border)

    ;; Common accent foregrounds

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

    (red-faint "#e08585")
    (yellow-faint "#e0e085")
    (green-faint "#86e085")
    (cyan-faint "#85e1e1")
    (blue-faint "#8585e0")
    (magenta-faint "#e085e0")

    ;; Common accent backgrounds
    ;; See the common mapping about their use.

    (bg-red "#f0c2c2")
    (bg-yellow "#f0f0c2")
    (bg-green "#c2f0c2")
    (bg-cyan "#c2f0f0")
    (bg-blue "#c2c2f0")
    (bg-magenta "#f0c2f0")

    ;; Accent mappings
    ;; Gives a theme its vibe.


    (accent-0 blue-cooler)
    (accent-1 blue-cooler)
    (accent-2 cyan)
    (accent-3 magenta)

    ;; Font Lock

    ;; Code mappings

    (comment fg-dim)
    (docstring comment)
    (string accent-3)
    (keyword fg-main)
    (constant accent-0)
    (fnname accent-2)
    (property accent-1)
    (builtin accent-0)
    (fnname-call fg-main)
    (preprocessor fg-main)
    (rx-backslash fg-main)
    (rx-construct fg-main)
    (type accent-0)
    (variable accent-2)
    (variable-use fg-main)


    ;; Special purpose

    (bg-hover bg-cyan)
    (bg-hover-secondary bg-yellow)

    ;; Diffs

    (setq glob)

    (bg-added "#c1f2d1")
    (bg-added-faint "#d8f8e1")
    (bg-added-refine "#aee5be")
    (bg-added-fringe bg-added)
    (fg-added "#005000")
    (fg-added-intense "#006700")

    (bg-changed           "#d5d7ff")
    (bg-changed-faint     "#e6e6ff")
    (bg-changed-refine    "#babcef")
    (bg-changed-fringe bg-changed)
    (fg-changed           "#303099")
    (fg-changed-intense   "#0303cc")


    (bg-removed "#ffd8d5")
    (bg-removed-faint "#ffe9e9")
    (bg-removed-refine "#f3b5af")
    (bg-removed-fringe bg-removed)
    (fg-removed "#8f1313")
    (fg-removed-intense "#aa2222")

    (bg-diff-context "#f3f3f3")

    ;; Paren match

    (bg-paren-match cyan-faint)
    (bg-paren-expression bg-cyan)
    (underline-paren-match unspecified)

    ;; General mappings

    (cursor accent-3)
    (keybind accent-0)
    (name accent-1)
    (identifier accent-3)

    (err red)
    (warning yellow-warmer)
    (info cyan-warmer)

    (modeline-err err)
    (modeline-warning warning)
    (modeline-info info)

    (underline-err err)
    (underline-warning warning)
    (underline-note info)

    (bg-prominent-err bg-red-intense)
    (fg-prominent-err fg-main)
    (bg-prominent-warning bg-yellow-intense)
    (fg-prominent-warning fg-main)
    (bg-prominent-note bg-cyan-intense)
    (fg-prominent-note fg-main)

    (bg-active-argument bg-yellow-nuanced)
    (fg-active-argument yellow-warmer)
    (bg-active-value bg-cyan-nuanced)
    (fg-active-value cyan-warmer)


    ;; Date mappings

    (date-common accent-2)
    (date-deadline err)
    (date-deadline-subtle err)
    (date-event fg-alt)
    (date-holiday accent-3)
    (date-holiday-other accent-3)
    (date-range fg-alt)
    (date-scheduled accent-1)
    (date-scheduled-subtle accent-1)
    (date-weekday accent-2)
    (date-weekend accent-3)

    ;; Link mappings

    (fg-link blue-warmer)
    (underline-link blue-warmer)
    (fg-link-symbolic cyan)
    (underline-link-symbolic cyan)
    (fg-link-visited magenta)
    (underline-link-visited magenta)

    ;; Mail mappings

    (mail-cite-0 blue-faint)
    (mail-cite-1 yellow-warmer)
    (mail-cite-2 cyan-cooler)
    (mail-cite-3 red-cooler)
    (mail-part cyan)
    (mail-recipient magenta-cooler)
    (mail-subject magenta-warmer)
    (mail-other magenta-faint)

    ;; Mark mappings

    (bg-mark-delete bg-red-subtle)
    (fg-mark-delete red)
    (bg-mark-select bg-cyan-subtle)
    (fg-mark-select cyan)
    (bg-mark-other bg-yellow-subtle)
    (fg-mark-other yellow)

    ;; Prompt mappings

    (fg-prompt accent-0)

    ;; Prose mappings


    (fg-prose-code cyan-cooler)
    (fg-prose-macro magenta-cooler)
    (fg-prose-verbatim magenta-warmer)
    (prose-done green)
    (prose-todo red)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula magenta-warmer)
    (prose-tag magenta-faint)



    ;; Search mappings
    ;; Used for anzu, avy, isearch etc.

    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-cyan-intense)
    (bg-search-static bg-magenta-subtle)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-blue-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-magenta-subtle))
  "Base light palette shared by all light suwi themes.")

(defcustom suwi-base-light-overrides nil
  "Overrides for entries in `suwi-base-light-palette'.
Apply custom tweaks here before derived themes append their own palette partials."
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
