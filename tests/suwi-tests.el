;;; suwi-tests.el --- Palette composition tests for Suwi themes -*- lexical-binding:t -*-

;; Copyright (C) 2026

;;; Commentary:
;;
;; Verify that Suwi themes preserve explicit palette composition and
;; theme-local overrides.

;;; Code:

(require 'ert)
(require 'modus-themes)
(require 'suwi-themes)
(require 'suwi-themes-light-base)
(require 'suwi-themes-dark-base)
(require 'suwi-walo-theme)
(require 'suwi-jazz-theme)
(require 'suwi-harbor-theme)
(require 'suwi-pimeja-theme)
(require 'suwi-unu-theme)

(defconst suwi-tests-active-themes '(suwi-walo suwi-jazz suwi-harbor suwi-pimeja suwi-unu)
  "Active Suwi themes covered by palette tests.")

(defun suwi-tests--new-user-palette (theme)
  "Return current user palette entries for THEME."
  (symbol-value
   (pcase theme
     ('suwi-walo 'suwi-walo-palette)
     ('suwi-jazz 'suwi-jazz-palette)
     ('suwi-harbor 'suwi-harbor-palette)
     ('suwi-pimeja 'suwi-pimeja-palette)
     ('suwi-unu 'suwi-unu-palette)
     (_ (error "Unknown active theme %S" theme)))))

(defun suwi-tests--theme-partial-palette (theme)
  "Return explicit theme-local palette entries for THEME."
  (symbol-value
   (pcase theme
     ('suwi-walo 'suwi-walo-palette-partial)
     ('suwi-jazz 'suwi-jazz-palette-partial)
     ('suwi-harbor 'suwi-harbor-palette-partial)
     ('suwi-pimeja 'suwi-pimeja-palette-partial)
     ('suwi-unu 'suwi-unu-palette-partial)
     (_ (error "Unknown active theme %S" theme)))))

(defun suwi-tests--theme-custom-faces (theme)
  "Return final custom-face entries for THEME."
  (symbol-value
   (pcase theme
     ('suwi-walo 'suwi-walo-custom-faces)
     ('suwi-jazz 'suwi-jazz-custom-faces)
     ('suwi-harbor 'suwi-harbor-custom-faces)
     ('suwi-pimeja 'suwi-pimeja-custom-faces)
     ('suwi-unu 'suwi-unu-custom-faces)
     (_ (error "Unknown active theme %S" theme)))))

(defun suwi-tests--theme-custom-faces-partial (theme)
  "Return theme-local custom-face entries for THEME."
  (symbol-value
   (pcase theme
     ('suwi-walo 'suwi-walo-custom-faces-partial)
     ('suwi-jazz 'suwi-jazz-custom-faces-partial)
     ('suwi-harbor 'suwi-harbor-custom-faces-partial)
     ('suwi-pimeja 'suwi-pimeja-custom-faces-partial)
     ('suwi-unu 'suwi-unu-custom-faces-partial)
     (_ (error "Unknown active theme %S" theme)))))

(defun suwi-tests--theme-base-custom-faces (theme)
  "Return the base custom-face entries used by THEME."
  (pcase theme
    ((or 'suwi-walo 'suwi-jazz 'suwi-harbor) suwi-base-light-all-custom-faces)
    ((or 'suwi-pimeja 'suwi-unu) suwi-base-dark-all-custom-faces)
    (_ (error "Unknown active theme %S" theme))))

(defun suwi-tests--resolved-value (color palette)
  "Return resolved value of COLOR in PALETTE."
  (modus-themes--retrieve-palette-value color palette))

(ert-deftest suwi-tests-active-themes-include-explicit-keys ()
  "Theme palettes retain each theme's explicit palette keys."
  (dolist (theme suwi-tests-active-themes)
    (let ((partial (suwi-tests--theme-partial-palette theme))
          (palette (suwi-tests--new-user-palette theme)))
      (dolist (entry partial)
        (should (assq (car entry) palette))))))

(ert-deftest suwi-tests-active-themes-compose-custom-faces-from-base ()
  "Theme custom faces append theme-local faces onto the appropriate base."
  (dolist (theme suwi-tests-active-themes)
    (should
     (equal (suwi-tests--theme-custom-faces theme)
            (append (suwi-tests--theme-base-custom-faces theme)
                    (suwi-tests--theme-custom-faces-partial theme))))))

(ert-deftest suwi-tests-active-themes-define-palette-overrides-vars ()
  "Theme definitions expose per-theme palette override variables."
  (dolist (theme suwi-tests-active-themes)
    (should (boundp (intern (format "%s-palette-overrides" theme))))))

(ert-deftest suwi-tests-theme-registry-derives-from-loaded-theme-definitions ()
  "Theme registry lists are populated from the loaded theme definitions."
  (suwi-themes--ensure-theme-files-loaded)
  (should (equal suwi-themes-light '(suwi-walo suwi-jazz suwi-harbor)))
  (should (equal suwi-themes-dark '(suwi-pimeja suwi-unu)))
  (should (equal suwi-themes-items
                 '(suwi-walo suwi-jazz suwi-harbor suwi-pimeja suwi-unu)))
  (should (equal (mapcar #'car suwi-themes-with-properties)
                 suwi-themes-items)))

(ert-deftest suwi-tests-take-over-mode-lists-only-suwi-themes ()
  "Take-over mode returns the Suwi theme set in light-first order."
  (let ((suwi-themes-take-over-modus-themes-mode t))
    (suwi-themes--ensure-theme-files-loaded)
    (should (equal (modus-themes-get-themes)
                   '(suwi-walo suwi-jazz suwi-harbor suwi-pimeja suwi-unu)))))

(ert-deftest suwi-tests-theme-alias-overrides-resolve-correctly ()
  "Shipped theme aliases override base palette values."
  (should (equal (suwi-tests--resolved-value 'fg-main suwi-harbor-palette)
                 (suwi-tests--resolved-value 'harbor-fg suwi-harbor-palette)))
  (should (equal (suwi-tests--resolved-value 'bg-active suwi-jazz-palette)
                 (suwi-tests--resolved-value 'jazz-azure suwi-jazz-palette))))

(provide 'suwi-tests)
;;; suwi-tests.el ends here
