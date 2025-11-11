;;; suwi-test-light-theme.el --- Sweet vivid test theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; MVP theme that demonstrates how Suwi themes build on the shared
;; light base palette while adding their own accent choices.

;;; Code:

(require 'suwi-themes-light-base)

(defconst suwi-test-light-palette-partial
  '((bg-main "#fff8ff")
    (fg-main "#43204d")
    (fg-alt "#b2166b")
    (bg-active "#f4cae8")
    (bg-inactive "#fff2fb")
    (accent-0 "#ff6bd3")
    (accent-1 "#ffb347")
    (accent-2 "#48d7c7")
    (accent-3 "#6a6dff")
    (rainbow-0 "#ff6bd3")
    (rainbow-1 "#ffb347")
    (rainbow-2 "#f9e154")
    (rainbow-3 "#48d7c7")
    (rainbow-4 "#6a6dff")
    (rainbow-5 "#c263ff")
    (rainbow-6 "#ff6090")
    (rainbow-7 "#2bc5f6")
    (rainbow-8 "#ffa6ff")
    (mail-cite-0 "#ff8fb1")
    (mail-cite-1 "#6a6dff")
    (mail-cite-2 "#2bc5f6")
    (mail-cite-3 "#48d7c7")
    (prompt "#c10d80")
    (keyword "#c557ff")
    (string "#ffaf66")
    (comment "#c971a0")
    (type "#2bc5f6")
    (fnname "#ff6bd3")
    (variable "#6a6dff")
    (constant "#ff5e89"))
  "Palette overrides applied by `suwi-test-light'.")

(defconst suwi-test-light-face-overrides
  '(
    `(org-level-1 ((,c :foreground ,accent-0 :weight bold :height 1.1)))
    `(org-level-2 ((,c :foreground ,accent-1 :weight semi-bold :height 1.05)))
    `(org-level-3 ((,c :foreground ,accent-2 :weight semi-bold)))
    `(org-level-4 ((,c :foreground ,accent-3)))
    `(link ((,c :foreground ,accent-0 :underline (:color ,accent-0 :style line)))))
  "Faces unique to `suwi-test-light' layered after the base overrides.")

(defcustom suwi-test-light-palette-overrides nil
  "Theme-local overrides for `suwi-test-light'."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-test-light-palette
  (append suwi-test-light-palette-partial suwi-base-light-palette-full))

(defconst suwi-test-light--all-face-overrides
  (append suwi-base-light-all-face-overrides suwi-test-light-face-overrides)
  "List passed to `modus-themes-theme' for `suwi-test-light'.")

(modus-themes-theme
 'suwi-test-light
 'suwi-themes
 "Sweet, vivid test palette for the Suwi framework."
 'light
 'modus-operandi-palette
 'suwi-test-light-palette
 'suwi-test-light-palette-overrides
 'suwi-test-light--all-face-overrides)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-test-light-theme)

;;; suwi-test-light-theme.el ends here
