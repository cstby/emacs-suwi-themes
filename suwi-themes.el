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
  '((fg-heading-0 accent-0)
    (fg-heading-1 accent-1)
    (fg-heading-2 accent-2)
    (fg-heading-3 accent-3)
    (fg-heading-4 accent-0)
    (fg-heading-5 accent-1)
    (fg-heading-6 accent-2)
    (fg-heading-7 accent-3)
    (fg-heading-8 accent-0)

    (bg-tab-bar bg-alt)
    (bg-tab-current bg-main)
    (bg-tab-other bg-active)

    (fg-completion-match-0 accent-0)
    (fg-completion-match-1 accent-1)
    (fg-completion-match-2 accent-2)
    (fg-completion-match-3 accent-3)

    (bg-line-number-active unspecified)
    (fg-line-number-active accent-2)
    (bg-line-number-inactive bg-alt)
    (fg-line-number-inactive fg-dim)

    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-cyan-intense)
    (bg-search-static bg-magenta-subtle)
    (bg-search-replace bg-red-intense))
  "Common palette shared by every Suwi theme, to be layered on a modus theme palette.")

(defconst suwi-common-custom-faces
  '(
    `(mode-line
      ((default :inherit modus-themes-ui-variable-pitch
                :background ,bg-mode-line-active
                :foreground ,fg-mode-line-active)
       (((supports :box t))
        :box (:style released-button :color ,border))
       (t :underline ,border)))
    `(mode-line-inactive
      ((,c :inherit modus-themes-ui-variable-pitch
           :background ,bg-mode-line-inactive
           :foreground ,fg-mode-line-inactive)))
    `(magit-section-highlight ((,c :background ,bg-alt)))
    `(org-block ((,c :background ,bg-alt :box (:line-width 1 :color ,bg-alt))))
    `(org-table ((,c :foreground ,accent-1)))
    `(diff-hl-insert ((,c :background ,bg-added :foreground ,fg-added)))
    `(diff-hl-delete ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(diff-hl-change ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(highlight-numbers-number ((,c :foreground ,accent-2)))
    `(show-paren-match ((,c :background ,bg-paren-match :foreground ,fg-main :weight bold)))
    `(vertical-border ((,c :foreground ,border))))
  "Common custom faces for all suwi themes, to be layered on top of `modus-themes-faces'.")

(defconst suwi-themes-items '(suwi-walo suwi-pimeja)
  "List of Suwi theme symbols managed by the entry point.")

(dolist (theme suwi-themes-items)
  (modus-themes-register theme))

(defun suwi-themes--sorted-items ()
  "Return Suwi themes sorted light-first for display commands."
  (modus-themes-sort (copy-sequence suwi-themes-items) 'light))

(define-minor-mode suwi-themes-take-over-modus-themes-mode
  "Limit Modus theme commands so they only consider Suwi themes."
  :global t
  :init-value nil
  :group 'suwi-themes)

(cl-defmethod modus-themes-get-themes (&context (suwi-themes-take-over-modus-themes-mode (eql t)))
  "Return only Suwi themes when `suwi-themes-take-over-modus-themes-mode' is enabled."
  (suwi-themes--sorted-items))

(modus-themes-define-derivative-command suwi-themes toggle)
(modus-themes-define-derivative-command suwi-themes rotate)
(modus-themes-define-derivative-command suwi-themes select)
(modus-themes-define-derivative-command suwi-themes load-random)
(modus-themes-define-derivative-command suwi-themes load-random-dark)
(modus-themes-define-derivative-command suwi-themes load-random-light)
(modus-themes-define-derivative-command suwi-themes list-colors)
(modus-themes-define-derivative-command suwi-themes list-colors-current)

(provide 'suwi-themes)

;;; suwi-themes.el ends here
