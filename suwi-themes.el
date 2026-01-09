;;; suwi-themes.el --- Core scaffolding for Suwi themes -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Entrypoint for the Suwi theme collection.  Hosts shared customization
;; groups, semantic mappings, and face overrides that all themes reuse.

;;; Code:

(require 'cl-lib)
(require 'modus-themes)

(defgroup suwi-themes nil
  "Sweet and simple themes.
The `suwi-themes' are built on top of the `modus-themes'."
  :group 'faces
  :group 'modus-themes
  :prefix "suwi-")

(defconst suwi-common-palette
  '(
    ;; These are used for org and md heandings, info titles, etc.
    (fg-heading-0 accent-0)
    (fg-heading-1 accent-1)
    (fg-heading-2 accent-2)
    (fg-heading-3 accent-3)
    (fg-heading-4 accent-0)
    (fg-heading-5 accent-1)
    (fg-heading-6 accent-2)
    (fg-heading-7 accent-3)
    (fg-heading-8 accent-0)

    ;; These are used for completion matches
    (fg-completion-match-0 accent-0)
    (fg-completion-match-1 accent-1)
    (fg-completion-match-2 accent-2)
    (fg-completion-match-3 accent-3)


    ;; These are used for rainbow delimiters only.
    (rainbow-0 fg-main)
    (rainbow-1 accent-0)
    (rainbow-2 accent-1)
    (rainbow-3 accent-2)
    (rainbow-4 accent-3)
    (rainbow-5 accent-0)
    (rainbow-6 accent-1)
    (rainbow-7 accent-2)
    (rainbow-8 accent-3)

    ;; Used in tty, symbol-overlay, pulse, popup, pdf-tools, minimap, and others.
    ;; And in the intense override.
    (bg-red-intense     bg-red)
    (bg-green-intense   bg-green)
    (bg-yellow-intense  bg-yellow)
    (bg-blue-intense    bg-blue)
    (bg-magenta-intense bg-magenta)
    (bg-cyan-intense    bg-cyan)

    ;; Used in tuareg, golden-ratio-scroll-screen, annotate.
    ;; Used in "intense" override.
    (bg-red-subtle     bg-red)
    (bg-green-subtle   bg-green)
    (bg-yellow-subtle  bg-yellow)
    (bg-blue-subtle    bg-blue)
    (bg-magenta-subtle bg-magenta)
    (bg-cyan-subtle    bg-cyan)

    ;; These nuanced colors are not used directly in any faces
    ;; Used in the intense override.
    (bg-red-nuanced     bg-red)
    (bg-green-nuanced   bg-green)
    (bg-yellow-nuanced  bg-yellow)
    (bg-blue-nuanced    bg-blue)
    (bg-magenta-nuanced bg-magenta)
    (bg-cyan-nuanced    bg-cyan)

    ;; Graph Colors
    (red-graph-0-bg     red)
    (red-graph-1-bg     red-faint)
    (green-graph-0-bg   green)
    (green-graph-1-bg   green-faint)
    (yellow-graph-0-bg  yellow)
    (yellow-graph-1-bg  yellow-faint)
    (blue-graph-0-bg    blue)
    (blue-graph-1-bg    blue-faint)
    (magenta-graph-0-bg magenta)
    (magenta-graph-1-bg magenta-faint)
    (cyan-graph-0-bg    cyan)
    (cyan-graph-1-bg    cyan-faint)

    ;; Rare colors
    (bg-clay     bg-red-subtle)
    (fg-clay     red)
    (bg-ochre    bg-yellow-subtle)
    (fg-ochre    yellow)
    (bg-lavender bg-magenta-subtle)
    (fg-lavender magenta)
    (bg-sage     bg-green-subtle)
    (fg-sage     green)

    (rust        red-faint)
    (gold        yellow)
    (olive       green-faint)
    (slate       blue)
    (indigo      blue-faint)
    (maroon      magenta-faint)
    (pink        magenta)


    ;; Greyscale remappings

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

    ;; Code Mappings

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

    ;; General Mappings

    (cursor accent-3)
    (keybind accent-0)
    (name accent-1)
    (identifier accent-3)

    ;; Error, Warning, Info

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

    ;; Diffs



    ;; Accent mappings
    ;; Gives a theme its vibe.


    (accent-0 blue-cooler)
    (accent-1 blue-cooler)
    (accent-2 cyan)
    (accent-3 magenta)




    ;; Special purpose

    (bg-hover bg-cyan)
    (bg-hover-secondary bg-yellow)



    (bg-diff-context "#f3f3f3")

    ;; Paren match

    (bg-paren-match cyan-faint)
    (bg-paren-expression bg-cyan)
    (underline-paren-match unspecified)

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

  "Common palette shared by every Suwi theme, to be layered on a modus theme palette.")

(defconst suwi-common-custom-faces
  '(
    `(mode-line
      ((,c :inherit modus-themes-ui-variable-pitch
           :background ,bg-mode-line-active
           :foreground ,fg-mode-line-active
           :box (:line-width -1 :color ,border-mode-line-active))))

    `(mode-line-active
      ((,c :inherit mode-line
           :box (:line-width -1 :color ,border-mode-line-active))))
    `(mode-line-inactive
      ((,c :inherit modus-themes-ui-variable-pitch
           :background ,bg-mode-line-inactive
           :foreground ,fg-mode-line-inactive
           :box (:line-width -1 :color ,border-mode-line-inactive))))
    `(hl-todo ((,c :foreground ,prose-todo)))
    `(show-paren-match ((,c :background ,bg-paren-match :foreground ,fg-main :weight bold)))
    `(diff-hl-insert ((,c :background ,bg-added :foreground ,fg-added)))
    `(diff-hl-delete ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(diff-hl-change ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(corfu-default ((,c :inherit modus-themes-fixed-pitch :background ,bg-main))))
  "Common custom faces for all suwi themes, to be layered on top of `modus-themes-faces'.")


(defconst suwi-themes-light '(suwi-walo suwi-jazz suwi-harbor)
  "Light Suwi theme symbols.")

(defconst suwi-themes-dark '(suwi-pimeja)
  "Dark Suwi theme symbols.")

(defconst suwi-themes-items
  (append suwi-themes-light suwi-themes-dark)
  "All Suwi theme symbols.")

(defconst suwi-themes-with-properties
  '((suwi-walo suwi-themes "Sweet vivid Suwi light theme." light modus-operandi-palette suwi-walo-palette suwi-walo-palette-overrides)
    (suwi-jazz suwi-themes "Retro pastel Suwi light theme." light modus-operandi-palette suwi-jazz-palette suwi-jazz-palette-overrides)
    (suwi-harbor suwi-themes "Teal and pink Suwi light theme." light modus-operandi-palette suwi-harbor-palette suwi-harbor-palette-overrides)
    (suwi-pimeja suwi-themes "Moody neon Suwi dark theme." dark modus-vivendi-palette suwi-pimeja-palette suwi-pimeja-palette-overrides))
  "Metadata tuples describing each Suwi theme.")

(defvar suwi-themes--declared-p nil)

(defun suwi-themes-declare-themes ()
  "Declare and register every theme in `suwi-themes-with-properties'."
  (unless suwi-themes--declared-p
    (dolist (entry suwi-themes-with-properties)
      (apply #'modus-themes-declare entry)
      (modus-themes-register (car entry)))
    (setq suwi-themes--declared-p t)))

(suwi-themes-declare-themes)

(defvar suwi-themes--aliased-p nil)

(defun suwi-themes-define-alias (suffix &optional is-function)
  "Alias `modus-themes-SUFFIX' as `suwi-themes-SUFFIX'.
If IS-FUNCTION is non-nil, alias as a function."
  (let ((modus-symbol (intern-soft (format "modus-themes-%s" suffix)))
        (suwi-symbol (intern (format "suwi-themes-%s" suffix))))
    (when (symbolp modus-symbol)
      (funcall (if is-function #'defalias #'defvaralias)
               suwi-symbol modus-symbol))))

(defun suwi-themes-define-option-aliases ()
  "Initialize the Suwi aliases for Modus customization knobs."
  (unless suwi-themes--aliased-p
    (dolist (suffix '(disable-other-themes to-toggle to-rotate after-load-theme-hook
                                           post-load-hook italic-constructs bold-constructs
                                           variable-pitch-ui mixed-fonts headings completions
                                           prompts common-palette-overrides))
      (suwi-themes-define-alias suffix))
    (setq suwi-themes--aliased-p t)))

(suwi-themes-define-option-aliases)

(defcustom suwi-themes-italics-by-default t
  "When non-nil, enable `modus-themes-italic-constructs' for Suwi themes.
This makes comments, docstrings, and other Modus-provided italic
constructs render in italics without requiring user configuration.
Set it to nil if you would rather keep the upstream Modus default and
manage `suwi-themes-italic-constructs' yourself."
  :group 'suwi-themes
  :type 'boolean)

(defun suwi-themes--apply-default-option-values ()
  "Apply opinionated defaults for Suwi on top of Modus options."
  (when suwi-themes-italics-by-default
    (setq suwi-themes-italic-constructs t)))

(suwi-themes--apply-default-option-values)

(defalias 'suwi-themes-load-theme 'modus-themes-load-theme
  "Load a Suwi theme by delegating to `modus-themes-load-theme'.")

(defalias 'suwi-themes-with-colors 'modus-themes-with-colors
  "Invoke BODY with the current Suwi palette bound.")

(defun suwi-themes--sorted-items ()
  "Return Suwi themes sorted light-first for display commands."
  (modus-themes-sort (copy-sequence suwi-themes-items) 'light))

;;;###autoload
(define-minor-mode suwi-themes-take-over-modus-themes-mode
  "Limit Modus theme commands so they only consider Suwi themes."
  :global t
  :init-value nil
  :group 'suwi-themes)

(cl-defmethod modus-themes-get-themes (&context (suwi-themes-take-over-modus-themes-mode (eql t)))
  "Return only Suwi themes when `suwi-themes-take-over-modus-themes-mode' is enabled."
  (suwi-themes--sorted-items))

;;;###autoload (autoload 'suwi-themes-toggle "suwi-themes")
(modus-themes-define-derivative-command suwi-themes toggle)
;;;###autoload (autoload 'suwi-themes-rotate "suwi-themes")
(modus-themes-define-derivative-command suwi-themes rotate)
;;;###autoload (autoload 'suwi-themes-select "suwi-themes")
(modus-themes-define-derivative-command suwi-themes select)
;;;###autoload (autoload 'suwi-themes-load-random "suwi-themes")
(modus-themes-define-derivative-command suwi-themes load-random)
;;;###autoload (autoload 'suwi-themes-load-random-dark "suwi-themes")
(modus-themes-define-derivative-command suwi-themes load-random-dark)
;;;###autoload (autoload 'suwi-themes-load-random-light "suwi-themes")
(modus-themes-define-derivative-command suwi-themes load-random-light)
;;;###autoload (autoload 'suwi-themes-list-colors "suwi-themes")
(modus-themes-define-derivative-command suwi-themes list-colors)
;;;###autoload (autoload 'suwi-themes-list-colors-current "suwi-themes")
(modus-themes-define-derivative-command suwi-themes list-colors-current)

(provide 'suwi-themes)

;;; suwi-themes.el ends here
