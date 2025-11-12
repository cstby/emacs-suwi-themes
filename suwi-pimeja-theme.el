;;; suwi-pimeja-theme.el --- Moody dark test theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; First dark representative of the Suwi theme family.  Builds on the
;; shared dark base palette while nudging a few key accents toward a
;; neon “pimeja” mood.

;;; Code:

(require 'suwi-themes-dark-base)

(defconst suwi-pimeja-palette-partial
  '((bg-main "#0b0f16")
    (fg-main "#fdf2ff")
    (fg-alt "#ffa7e1")
    (bg-active "#212639")
    (bg-inactive "#111522")
    (accent-0 "#ff6bcf")
    (accent-1 "#ffb347")
    (accent-2 "#29d8c2")
    (accent-3 "#7fa5ff")
    (rainbow-0 "#ff6bcf")
    (rainbow-1 "#ffb347")
    (rainbow-2 "#29d8c2")
    (rainbow-3 "#7fa5ff")
    (rainbow-4 "#ffa5ff")
    (rainbow-5 "#65c3ff")
    (rainbow-6 "#ff669f")
    (rainbow-7 "#3dd2ff")
    (rainbow-8 "#ffcbff")
    (prompt "#ff8ee0")
    (keyword "#cfa3ff")
    (string "#f4c46a")
    (comment "#7c85a5")
    (type "#4cd8ff")
    (fnname "#ff7dd8")
    (variable "#7fa5ff")
    (constant "#ff7aa5"))
  "Palette entries that give `suwi-pimeja' its distinctive vibe.")

(defconst suwi-pimeja-custom-faces-partial
  '(
    `(org-level-1 ((,c :foreground ,accent-0 :weight bold :height 1.05)))
    `(org-level-2 ((,c :foreground ,accent-1 :weight semi-bold)))
    `(org-level-3 ((,c :foreground ,accent-2)))
    `(org-level-4 ((,c :foreground ,accent-3)))
    `(link ((,c :foreground ,accent-2 :underline (:color ,accent-2 :style line)))))
  "Custom faces unique to `suwi-pimeja'.")

(defcustom suwi-pimeja-palette-overrides nil
  "User palette overrides evaluated after `suwi-pimeja-palette'."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-pimeja-palette
  (append suwi-pimeja-palette-partial suwi-base-dark-palette-full)
  "Complete palette for `suwi-pimeja'.")

(defconst suwi-pimeja-custom-faces
  (append suwi-base-dark-all-custom-faces suwi-pimeja-custom-faces-partial)
  "Complete custom-face list for `suwi-pimeja'.")

(modus-themes-theme
 'suwi-pimeja
 'suwi-themes
 "Moody dark palette for the Suwi framework."
 'dark
 'modus-vivendi-palette
 'suwi-pimeja-palette
 'suwi-pimeja-palette-overrides
 'suwi-pimeja-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-pimeja-theme)

;;; suwi-pimeja-theme.el ends here
