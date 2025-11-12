# Light Base Palette Reference (Captured 2025-11-12)

This snapshot preserves the `suwi-base-light-palette` before importing the full Modus Operandi palette. Use it to reapply the current colors after the flattening work.

```elisp
(defconst suwi-base-light-palette
  '(
    ;; Light theme colors
    (suwi-white "#fafafa")
    (white-1 "#f4f4f4")
    (white-2 "#efefef")
    (grey "#dbdbdb")
    (black "#242424")


    (lavender "#eaeafa")
    (azure "#eafafa")
    (honeydew "#eafaea")
    (rose "#faeaea")

    (slate "#778ca3")

    (gold "#b88812")
    (orange "#ff5200")
    (red "#fe2500")
    (pink "#fa1090")
    (violet "#c71585")
    (purple+1 "#9d2dab")
    (purple "#3b2685")
    (blue "#005cc5")
    (blue+1 "#00afef")
    (teal "#009c9f")
    (teal+1 "#04c4c7")
    (green "#10d7ae")

    ;; Modus palette mappings

    (bg-alt "#ffdceb") ; not actually a key

    ;; keep these for now
    (bg-mode-line-active bg-dim)
    (fg-mode-line-active fg-main)
    (bg-mode-line-inactive bg-main)
    (fg-mode-line-inactive fg-dim)


  "Base light palette shared by all light suwi themes (pre-flattening snapshot).")
```
