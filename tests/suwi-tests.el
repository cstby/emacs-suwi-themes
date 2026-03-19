;;; suwi-tests.el --- Palette composition tests for Suwi themes -*- lexical-binding:t -*-

;; Copyright (C) 2026  Carl Steib

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
(suwi-themes--ensure-theme-files-loaded)

(defun suwi-tests--themes ()
  "Return all discovered Suwi themes."
  suwi-themes-items)

(defun suwi-tests--theme-symbol (theme suffix)
  "Return THEME's symbol ending in SUFFIX."
  (intern (format "%s-%s" theme suffix)))

(defun suwi-tests--theme-value (theme suffix)
  "Return THEME's value for symbol ending in SUFFIX."
  (symbol-value (suwi-tests--theme-symbol theme suffix)))

(defun suwi-tests--theme-palette (theme)
  "Return the final palette entries for THEME."
  (suwi-tests--theme-value theme "palette"))

(defun suwi-tests--theme-partial-palette (theme)
  "Return explicit theme-local palette entries for THEME."
  (suwi-tests--theme-value theme "palette-partial"))

(defun suwi-tests--theme-custom-faces (theme)
  "Return final custom-face entries for THEME."
  (suwi-tests--theme-value theme "custom-faces"))

(defun suwi-tests--theme-custom-faces-partial (theme)
  "Return theme-local custom-face entries for THEME."
  (suwi-tests--theme-value theme "custom-faces-partial"))

(defun suwi-tests--theme-base-custom-faces (theme)
  "Return the base custom-face entries used by THEME."
  (cond
   ((memq theme suwi-themes-light) suwi-base-light-all-custom-faces)
   ((memq theme suwi-themes-dark) suwi-base-dark-all-custom-faces)
   (t (error "Unknown active theme %S" theme))))

(defun suwi-tests--theme-base-palette (theme)
  "Return the base palette entries used by THEME."
  (cond
   ((memq theme suwi-themes-light) suwi-base-light-palette-full)
   ((memq theme suwi-themes-dark) suwi-base-dark-palette-full)
   (t (error "Unknown active theme %S" theme))))

(defun suwi-tests--resolved-value (color palette)
  "Return resolved value of COLOR in PALETTE."
  (modus-themes--retrieve-palette-value color palette))

(defun suwi-tests--palette-keys (palette)
  "Return the keys defined in PALETTE."
  (mapcar #'car palette))

(defun suwi-tests--missing-palette-keys (reference palette)
  "Return keys present in REFERENCE but absent from PALETTE."
  (seq-remove (lambda (key) (assq key palette))
              (suwi-tests--palette-keys reference)))

(ert-deftest suwi-tests-active-themes-include-explicit-keys ()
  "Theme palettes retain each theme's explicit palette keys."
  (dolist (theme (suwi-tests--themes))
    (let ((partial (suwi-tests--theme-partial-palette theme))
          (palette (suwi-tests--theme-palette theme)))
      (dolist (entry partial)
        (should (assq (car entry) palette))))))

(ert-deftest suwi-tests-active-themes-compose-custom-faces-from-base ()
  "Theme custom faces append theme-local faces onto the appropriate base."
  (dolist (theme (suwi-tests--themes))
    (should
     (equal (suwi-tests--theme-custom-faces theme)
            (append (suwi-tests--theme-base-custom-faces theme)
                    (suwi-tests--theme-custom-faces-partial theme))))))

(ert-deftest suwi-tests-active-themes-define-palette-overrides-vars ()
  "Theme definitions expose per-theme palette override variables."
  (dolist (theme (suwi-tests--themes))
    (should (boundp (suwi-tests--theme-symbol theme "palette-overrides")))))

(ert-deftest suwi-tests-active-themes-define-framework-symbols ()
  "Each discovered theme exposes the expected framework symbols."
  (dolist (theme (suwi-tests--themes))
    (dolist (suffix '("palette" "palette-partial" "custom-faces" "custom-faces-partial"))
      (should (boundp (suwi-tests--theme-symbol theme suffix))))))

(ert-deftest suwi-tests-theme-registry-derives-from-loaded-theme-definitions ()
  "Theme registry lists are populated from the loaded theme definitions."
  (suwi-themes--ensure-theme-files-loaded)
  (should suwi-themes-light)
  (should suwi-themes-dark)
  (should (equal suwi-themes-items
                 (append suwi-themes-light suwi-themes-dark)))
  (should-not (seq-intersection suwi-themes-light suwi-themes-dark #'eq))
  (should (equal (sort (copy-sequence (mapcar #'car suwi-themes-with-properties)) #'string-lessp)
                 (sort (copy-sequence suwi-themes-items) #'string-lessp))))

(ert-deftest suwi-tests-base-palettes-cover-modus-keywords ()
  "Composed Suwi base palettes provide every Modus palette keyword."
  (should-not
   (suwi-tests--missing-palette-keys
    modus-themes-operandi-palette
    suwi-base-light-palette-full))
  (should-not
   (suwi-tests--missing-palette-keys
    modus-themes-vivendi-palette
    suwi-base-dark-palette-full)))

(ert-deftest suwi-tests-take-over-mode-lists-only-suwi-themes ()
  "Take-over mode returns the Suwi theme set in light-first order."
  (let ((suwi-themes-take-over-modus-themes-mode t))
    (suwi-themes--ensure-theme-files-loaded)
    (should (equal (modus-themes-get-themes)
                   (suwi-themes--sorted-items)))))

(ert-deftest suwi-tests-theme-alias-overrides-resolve-correctly ()
  "Explicit theme-local aliases override base palette values."
  (dolist (theme (suwi-tests--themes))
    (let ((partial (suwi-tests--theme-partial-palette theme))
          (palette (suwi-tests--theme-palette theme)))
      (dolist (entry partial)
        (when (symbolp (cadr entry))
          (should (equal (suwi-tests--resolved-value (car entry) palette)
                         (suwi-tests--resolved-value (cadr entry) palette))))))))

(ert-deftest suwi-tests-suwi-fg-derives-theme-foreground ()
  "Themes either derive or inherit `fg-main' correctly."
  (dolist (theme (suwi-tests--themes))
    (let ((partial (suwi-tests--theme-partial-palette theme))
          (palette (suwi-tests--theme-palette theme))
          (base-palette (suwi-tests--theme-base-palette theme)))
      (when (assq 'suwi-fg partial)
        (should (equal (suwi-tests--resolved-value 'fg-main palette)
                       (suwi-tests--resolved-value 'suwi-fg palette))))
      (unless (assq 'suwi-fg partial)
        (should-not (assq 'fg-main partial))
        (should (equal (suwi-tests--resolved-value 'fg-main palette)
                       (suwi-tests--resolved-value 'fg-main base-palette)))))))

(provide 'suwi-tests)
;;; suwi-tests.el ends here
