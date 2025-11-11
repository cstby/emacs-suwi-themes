;;; suwi-walo-theme.el --- Sweet vivid test theme -*- lexical-binding:t -*-

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

(defconst suwi-walo-palette-partial
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
  "Palette entries that give `suwi-walo' its distinctive vibe.")

(defconst suwi-walo-custom-faces-partial
  '(
    `(org-level-1 ((,c :foreground ,accent-0 :weight bold :height 1.1)))
    `(org-level-2 ((,c :foreground ,accent-1 :weight semi-bold :height 1.05)))
    `(org-level-3 ((,c :foreground ,accent-2 :weight semi-bold)))
    `(org-level-4 ((,c :foreground ,accent-3)))
    `(link ((,c :foreground ,accent-0 :underline (:color ,accent-0 :style line)))))
  "Custom faces that give `suwi-walo' its distinctive vibe.")

(defcustom suwi-walo-palette-overrides nil
  "User overrides for `suwi-walo-palette'.
Entries here use the same (KEY . VALUE) format as Modus palette overrides."
  :group 'suwi-themes
  :type '(repeat (list symbol (choice symbol string))))

(defconst suwi-walo-palette
  (append suwi-walo-palette-partial suwi-base-light-palette-full)
  "Complete palette for the `suwi-walo', to be passed into `modus-themes-theme'.")

(defconst suwi-walo-custom-faces
  (append suwi-base-light-all-custom-faces suwi-walo-custom-faces-partial)
  "Complete custom-face list for `suwi-walo', to be passed into `modus-themes-theme'.")

(modus-themes-theme
 'suwi-walo
 'suwi-themes
 "Sweet, vivid test palette for the Suwi framework."
 'light
 'modus-operandi-palette
 'suwi-walo-palette
 'suwi-walo-palette-overrides
 'suwi-walo-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-walo-theme)

;;; suwi-walo-theme.el ends here
