;;; suwi-themes.el --- Core scaffolding for Suwi themes -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl Steib

;; Author: Carl Steib
;; Maintainer: Carl Steib
;; URL: https://codeberg.org/satase/emacs-suwi-themes
;; Version: 0.1.0
;; Keywords: faces, theme
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; The `suwi-themes' are a collection of themes for GNU Emacs whose goal
;; is to provide a simple and sweet framework for users to easily
;; define their own `modus-themes'.

;;; Code:

(require 'cl-lib)
(require 'modus-themes)
(require 'suwi-themes-common)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(defgroup suwi-themes nil
  "Sweet and simple themes.
The `suwi-themes' are built on top of the `modus-themes'."
  :group 'faces
  :group 'modus-themes
  :prefix "suwi-")

(defvar suwi-themes-light nil
  "Light Suwi theme symbols.")

(defvar suwi-themes-dark nil
  "Dark Suwi theme symbols.")

(defvar suwi-themes-items nil
  "All Suwi theme symbols.")

(defvar suwi-themes-with-properties nil
  "Metadata tuples describing each Suwi theme.")

;; Declared here so byte-compilation knows about the alias target
;; before `suwi-themes-define-option-aliases' runs.
(defvar suwi-themes-italic-constructs nil)

(defun suwi-themes--with-derived-fg-main (palette)
  "Return PALETTE with `fg-main' derived from `suwi-fg' when available.
Modus treats `fg-main' as a named color in the base palette, so a later
semantic mapping cannot override it.  When a concrete Suwi theme defines
`suwi-fg', materialize a theme-local `fg-main' entry up front."
  (if (or (assq 'fg-main palette)
          (not (assq 'suwi-fg palette)))
      palette
    (cons (list 'fg-main
                (modus-themes--retrieve-palette-value 'suwi-fg palette))
          palette)))

(defun suwi-themes--register-theme-metadata (theme description background-mode
                                                   core-palette palette-symbol
                                                   palette-overrides-symbol)
  "Register metadata for THEME.
DESCRIPTION, BACKGROUND-MODE, CORE-PALETTE, PALETTE-SYMBOL, and
PALETTE-OVERRIDES-SYMBOL are recorded in the Suwi theme registry."
  (let ((entry (list theme
                     'suwi-themes
                     description
                     background-mode
                     core-palette
                     palette-symbol
                     palette-overrides-symbol)))
    (setq suwi-themes-with-properties
          (append (assq-delete-all theme suwi-themes-with-properties)
                  (list entry)))
    (setq suwi-themes-light (delq theme suwi-themes-light))
    (setq suwi-themes-dark (delq theme suwi-themes-dark))
    (pcase background-mode
      ('light (setq suwi-themes-light (append suwi-themes-light (list theme))))
      ('dark (setq suwi-themes-dark (append suwi-themes-dark (list theme))))
      (_ (error "Unsupported background mode %S" background-mode)))
    (setq suwi-themes-items (append suwi-themes-light suwi-themes-dark))))

(defmacro suwi-define-theme (theme description background-mode core-palette
                                   base-palette base-custom-faces)
  "Define boilerplate for THEME using explicit Suwi palette composition.
DESCRIPTION, BACKGROUND-MODE, and CORE-PALETTE are passed to
`modus-themes-theme'.  BASE-PALETTE and BASE-CUSTOM-FACES are appended
to the theme-local partial palette and custom-face symbols."
  (declare (indent defun))
  (let* ((theme-name (symbol-name theme))
         (palette-symbol (intern (format "%s-palette" theme-name)))
         (palette-partial-symbol (intern (format "%s-palette-partial" theme-name)))
         (palette-overrides-symbol (intern (format "%s-palette-overrides" theme-name)))
         (custom-faces-symbol (intern (format "%s-custom-faces" theme-name)))
         (custom-faces-partial-symbol (intern (format "%s-custom-faces-partial" theme-name))))
    `(progn
       (defcustom ,palette-overrides-symbol nil
         ,(format "User palette overrides evaluated after `%s'." palette-symbol)
         :group 'suwi-themes
         :type '(repeat (list symbol (choice symbol string))))
       (defconst ,palette-symbol
         (append (suwi-themes--with-derived-fg-main ,palette-partial-symbol)
                 ,base-palette)
         ,(format "Complete palette for `%s'." theme))
       (defconst ,custom-faces-symbol
         (append ,base-custom-faces ,custom-faces-partial-symbol)
         ,(format "Complete custom-face list for `%s'." theme))
       (modus-themes-theme
        ',theme
        'suwi-themes
        ,description
        ',background-mode
        ',core-palette
        ',palette-symbol
        ',palette-overrides-symbol
        ',custom-faces-symbol)
       (suwi-themes--register-theme-metadata
        ',theme
        ,description
        ',background-mode
        ',core-palette
        ',palette-symbol
        ',palette-overrides-symbol)
       (modus-themes-register ',theme))))

(defmacro suwi-define-light-theme (theme description)
  "Define THEME as a light Suwi theme with DESCRIPTION and the shared light base."
  (declare (indent defun))
  `(suwi-define-theme ,theme
     ,description
     light
     modus-operandi-palette
     suwi-base-light-palette-full
     suwi-base-light-all-custom-faces))

(defmacro suwi-define-dark-theme (theme description)
  "Define THEME as a dark Suwi theme with DESCRIPTION and the shared dark base."
  (declare (indent defun))
  `(suwi-define-theme ,theme
     ,description
     dark
     modus-vivendi-palette
     suwi-base-dark-palette-full
     suwi-base-dark-all-custom-faces))

(defvar suwi-themes--aliased-p nil)

(defun suwi-themes-define-alias (suffix &optional is-function)
  "Alias `modus-themes-SUFFIX' as `suwi-themes-SUFFIX'.
If IS-FUNCTION is non-nil, alias SUFFIX as a function."
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

(defvar suwi-themes--theme-files-loaded-p nil
  "Non-nil when all concrete Suwi theme files have been loaded.")

(defconst suwi-themes-directory
  (file-name-directory
   (or load-file-name
       (locate-library "suwi-themes.el")
       (buffer-file-name)))
  "Directory that contains the Suwi theme sources.")

(defun suwi-themes--directory ()
  "Return the directory that contains the Suwi theme sources."
  suwi-themes-directory)

(defun suwi-themes--theme-file-features ()
  "Return concrete Suwi theme features derived from theme filenames."
  (mapcar
   (lambda (file)
     (intern (file-name-base file)))
   (sort
    (directory-files (suwi-themes--directory) nil "\\`suwi-.*-theme\\.el\\'")
    #'string-lessp)))

(defun suwi-themes--ensure-theme-files-loaded ()
  "Load all concrete Suwi theme files exactly once."
  (unless suwi-themes--theme-files-loaded-p
    (require 'suwi-themes-light-base)
    (require 'suwi-themes-dark-base)
    (dolist (feature (suwi-themes--theme-file-features))
      (require feature))
    (setq suwi-themes--theme-files-loaded-p t)))

(defun suwi-themes--sorted-items ()
  "Return Suwi themes sorted light-first for display commands."
  (suwi-themes--ensure-theme-files-loaded)
  (modus-themes-sort (copy-sequence suwi-themes-items) 'light))

;;;###autoload
(define-minor-mode suwi-themes-take-over-modus-themes-mode
  "Limit Modus theme commands so they only consider Suwi themes."
  :global t
  :init-value nil
  :group 'suwi-themes)

(cl-defmethod modus-themes-get-themes (&context (suwi-themes-take-over-modus-themes-mode (eql t)))
  "Return only Suwi themes when SUWI-THEMES-TAKE-OVER-MODUS-THEMES-MODE is enabled."
  (suwi-themes--sorted-items))

(defmacro suwi-themes-define-derivative-command (suffix)
  "Define Suwi command with SUFFIX after preloading all theme files."
  (let ((modus-command (intern (format "modus-themes-%s" suffix)))
        (suwi-command (intern (format "suwi-themes-%s" suffix))))
    `(defun ,suwi-command ()
       ,(format
         "Like `%s' but only for the `suwi-themes'.\nPreload all theme files first."
         modus-command)
       (interactive)
       (suwi-themes--ensure-theme-files-loaded)
       (cl-letf (((symbol-function 'modus-themes-get-themes)
                  (lambda ()
                    (modus-themes-get-all-known-themes 'suwi-themes))))
         (call-interactively ',modus-command)))))

;;;###autoload (autoload 'suwi-themes-toggle "suwi-themes")
(suwi-themes-define-derivative-command toggle)
;;;###autoload (autoload 'suwi-themes-rotate "suwi-themes")
(suwi-themes-define-derivative-command rotate)
;;;###autoload (autoload 'suwi-themes-select "suwi-themes")
(suwi-themes-define-derivative-command select)
;;;###autoload (autoload 'suwi-themes-load-random "suwi-themes")
(suwi-themes-define-derivative-command load-random)
;;;###autoload (autoload 'suwi-themes-load-random-dark "suwi-themes")
(suwi-themes-define-derivative-command load-random-dark)
;;;###autoload (autoload 'suwi-themes-load-random-light "suwi-themes")
(suwi-themes-define-derivative-command load-random-light)
;;;###autoload (autoload 'suwi-themes-list-colors "suwi-themes")
(suwi-themes-define-derivative-command list-colors)
;;;###autoload (autoload 'suwi-themes-list-colors-current "suwi-themes")
(suwi-themes-define-derivative-command list-colors-current)

(provide 'suwi-themes)

;;; suwi-themes.el ends here
