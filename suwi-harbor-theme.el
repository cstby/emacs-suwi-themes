;;; suwi-harbor-theme.el --- Retro pastel Suwi light theme -*- lexical-binding:t -*-

;; Copyright (C) 2025  Carl

;; Author: Carl
;; Maintainer: Carl
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))

;;; Commentary:
;;
;; Light Suwi variant inspired by the Solo Harbor palette.  Uses the
;; shared light base and tweaks a handful of accents to echo the
;; teal–purple cup motif without adding extra custom faces.

;;; Code:

(require 'suwi-themes-light-base)

(defconst suwi-harbor-palette-partial
  '(
    (harbor-fg "#3A2F6E")
    (harbor-0 "#2E2ABF")
    (harbor-2 "#6A5CFF")
    (harbor-3 "#9A8CFF")

    ;; (harbor-fg "#0B3446")
    ;; (harbor-0 "#008299")
    ;; (harbor-2 "#D94574")
    ;; (harbor-3 "#FF7F96")

    ;; Solo Harbor raw colors
    ;; (harbor-a "#012638")
    ;; (harbor-b "#008195")
    ;; (harbor-c "#03AAC2")
    ;; (harbor-d "#FB6793")
    ;; (harbor-e "#FF97A5")

    ;; (harbor-a "#073042")
    ;; (harbor-b "#008195")
    ;; (harbor-c "#028FA6")
    ;; (harbor-d "#E14B7A")
    ;; (harbor-e "#FF7F96")

    ;; (harbor-b "#007488")

    ;; (harbor-c "#3FA8BA")
    ;; (harbor-c "#2F8FA3")
    ;; (harbor-c "#2fa285") ; change chroma -15 degrees
    ;; (harbor-c "#3f8492") ; desaturate -15%



    ;; Palette entries mapped to Modus semantics

    ;; Accent 0: directories, unstaged changes, local git branches,
    ;; Accent 1: git remotes
    ;; Accent 2: git hashes, magit filename
    ;; Accent 3: pretty much never used. magit tags,

    (accent-0 harbor-0)
    (accent-1 harbor-0)
    (accent-2 harbor-2)
    (accent-3 harbor-3)

    (fg-main harbor-fg))
  "Palette entries that give `suwi-harbor' its distinctive vibe.")

(defconst suwi-harbor-custom-faces-partial nil
  "No extra custom faces; rely on the shared light base.")

(suwi-define-theme suwi-harbor
  "Retro pastel palette for the Suwi framework."
  light
  modus-operandi-palette
  suwi-base-light-palette-full
  suwi-base-light-all-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide 'suwi-harbor-theme)

;;; suwi-harbor-theme.el ends here
