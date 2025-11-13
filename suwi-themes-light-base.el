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

    (bg-main          "#fafafa")
    (bg-dim           "#f4f4f4")
    (fg-main          "#242424")
    (fg-dim           "#777777")
    (fg-alt           "#a0227d")
    (bg-active        "#c4c4c4")
    (bg-inactive      "#e0e0e0")
    (border           "#9f9f9f")

    (bg-tab-bar      "#dfdfdf")
    (bg-tab-current  "#ffffff")
    (bg-tab-other    "#c2c2c2")

    (bg-mode-line-active        "#c8c8c8")
    (fg-mode-line-active        "#000000")
    (border-mode-line-active    "#5a5a5a")
    (bg-mode-line-inactive      "#e6e6e6")
    (fg-mode-line-inactive      "#585858")
    (border-mode-line-inactive  "#a3a3a3")

    ;; Common accent foregrounds

    (red            "#f44773")
    (red-warmer     "#ff3c5c")
    (red-cooler     "#eb4ca0")
    (red-faint      "#d45a7b")
    (green          "#2fbf96")
    (green-warmer   "#55c759")
    (green-cooler   "#1fa9d6")
    (green-faint    "#5ca488")
    (yellow         "#f0a000")
    (yellow-warmer  "#ff9500")
    (yellow-cooler  "#f08a5c")
    (yellow-faint   "#d58a5f")
    (blue           "#5d65ff")
    (blue-warmer    "#7c5dff")
    (blue-cooler    "#3f8dff")
    (blue-faint     "#6c74d4")
    (magenta        "#ff5fd7")
    (magenta-warmer "#ff3fee")
    (magenta-cooler "#c150ff")
    (magenta-faint  "#d060c5")
    (cyan           "#2bd4f0")
    (cyan-warmer    "#4bd0ff")
    (cyan-cooler    "#00b7f5")
    (cyan-faint     "#6cbfe0")

    ;; Uncommon accent foregrounds

    (rust       "#8a290f")             ; only used for overrides-faint
    (gold       "#6c501c")             ; only used for overrides-faint
    (olive      "#4c6000")
    (slate      "#2f3f83")
    (indigo     "#4a3a8a")
    (maroon     "#731c52")
    (pink       "#7b435c")

    ;; Common accent backgrounds
    ;; See the common mapping about their use.

    (bg-red      "#ffcfbf")
    (bg-green    "#b3fabf")
    (bg-yellow   "#fff576")
    (bg-blue     "#ccdfff")
    (bg-magenta  "#ffddff")
    (bg-cyan     "#bfefff")

    ;; Uncommon accent background and foreground pairs
    ;; These are used almost nowhere.



    ;; Special purpose

    (bg-completion       "#c0deff")
    (bg-hover            "#b2e4dc")
    (bg-hover-secondary  "#f5d0a0")
    (bg-hl-line          "#dae5ec")
    (bg-region           "#bdbdbd")
    (fg-region           "#000000")

    (modeline-err     "#7f0000")
    (modeline-warning "#5f0070")
    (modeline-info    "#002580")

    ;; TODO: Decide if these are the right mappings
    ;; (bg-tab-bar bg-alt)
    ;; (bg-tab-current bg-main)
    ;; (bg-tab-other bg-active)

    ;; Diffs

    (bg-added           "#c1f2d1")
    (bg-added-faint     "#d8f8e1")
    (bg-added-refine    "#aee5be")
    (bg-added-fringe    "#6cc06c")
    (fg-added           "#005000")
    (fg-added-intense   "#006700")

    (bg-changed         "#ffdfa9")
    (bg-changed-faint   "#ffefbf")
    (bg-changed-refine  "#fac090")
    (bg-changed-fringe  "#d7c20a")
    (fg-changed         "#553d00")
    (fg-changed-intense "#655000")

    (bg-removed         "#ffd8d5")
    (bg-removed-faint   "#ffe9e9")
    (bg-removed-refine  "#f3b5af")
    (bg-removed-fringe  "#d84a4f")
    (fg-removed         "#8f1313")
    (fg-removed-intense "#aa2222")

    (bg-diff-context    "#f3f3f3")

    ;; Paren match

    (bg-paren-match        "#5fcfff")
    (bg-paren-expression   "#efd3f5")
    (underline-paren-match unspecified)

    ;; Font Lock

    (prompt "#a0227d")
    (keyword "#b050d4")
    (string "#f0a000")
    (comment "#8f6a9a")
    (type "#2bd4f0")
    (fnname accent-0)
    (variable "#5d65ff")
    (constant "#ff5f73")

    ;; General mappings

    (cursor fg-main)
    (keybind blue-cooler)
    (name magenta)
    (identifier yellow-cooler)

    (err red)
    (warning yellow-warmer)
    (info cyan-cooler)

    (underline-err red-intense)
    (underline-warning yellow-intense)
    (underline-note cyan-intense)

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

    ;; Code mappings

    (builtin magenta-warmer)
    (comment fg-dim)
    (constant blue-cooler)
    (docstring green-faint)
    (fnname magenta)
    (fnname-call pink)
    (keyword magenta-cooler)
    (preprocessor red-cooler)
    (property cyan)
    (rx-backslash magenta)
    (rx-construct green-cooler)
    (string blue-warmer)
    (type cyan-cooler)
    (variable cyan)
    (variable-use slate)

    ;; Accent mappings
    ;; Used in various places where color is needed

    (accent-0 blue)                     ; directories
    (accent-1 magenta-warmer)
    (accent-2 cyan)
    (accent-3 red)

    ;; Date mappings

    (date-common cyan)
    (date-deadline red-cooler)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red)
    (date-holiday-other blue)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend magenta)

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

    (fg-prompt cyan-cooler)

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
