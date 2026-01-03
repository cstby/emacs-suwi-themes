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



    )
  "Common palette shared by every Suwi theme, to be layered on a modus theme palette.")

(defconst suwi-common-custom-faces
  '(
    `(mode-line
      (
       (((supports :box t))
        :box (:line-width -1 :color ,border-mode-line-active))
       (t :underline ,border-mode-line-active)))
    `(mode-line-inactive
      ((,c :inherit modus-themes-ui-variable-pitch
           :background ,bg-mode-line-inactive
           :foreground ,fg-mode-line-inactive)
       (((supports :box t))
        :box (:line-width -1 :color ,border-mode-line-inactive))
       (t :underline ,border-mode-line-inactive)))
    `(org-table ((,c :foreground ,accent-1)))
    `(diff-hl-insert ((,c :background ,bg-added :foreground ,fg-added)))
    `(diff-hl-delete ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(diff-hl-change ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(highlight-numbers-number ((,c :foreground ,accent-2)))
    `(show-paren-match ((,c :background ,bg-paren-match :foreground ,fg-main :weight bold)))
    `(vertical-border ((,c :foreground ,border))))
  "Common custom faces for all suwi themes, to be layered on top of `modus-themes-faces'.")


(defconst suwi-themes-light '(suwi-walo suwi-jazz)
  "Light Suwi theme symbols.")

(defconst suwi-themes-dark '(suwi-pimeja)
  "Dark Suwi theme symbols.")

(defconst suwi-themes-items
  (append suwi-themes-light suwi-themes-dark)
  "All Suwi theme symbols.")

(defconst suwi-themes-with-properties
  '((suwi-walo suwi-themes "Sweet vivid Suwi light theme." light modus-operandi-palette suwi-walo-palette suwi-walo-palette-overrides)
    (suwi-jazz suwi-themes "Retro pastel Suwi light theme." light modus-operandi-palette suwi-jazz-palette suwi-jazz-palette-overrides)
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
