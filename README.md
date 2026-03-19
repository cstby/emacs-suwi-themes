<h1 align="center">Suwi Themes for Emacs</h1>

<p align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/EmacsIcon.svg/120px-EmacsIcon.svg.png" />
</p>
<p align="center">
<img src="https://img.shields.io/badge/status-active-2ea043" alt="Status">
<img src="https://img.shields.io/badge/Emacs-28.1+-7F5AB6?logo=gnu-emacs" alt="Emacs">
<img src="https://img.shields.io/badge/modus--themes-5.0.0+-4c6ef5" alt="Modus Themes">
<img src="https://img.shields.io/badge/License-GPL%20v3-A42E2B?logo=gnu" alt="GPL License">
</p>

<br/>

<p align="center">A simple and sweet theme collection built on top of <code>modus-themes</code>.</p>

<br/>

## About

Suwi Themes is a small collection of themes built on top of `modus-themes`.

It's also a framework for making your own theme. Here is an example from `suwi-unu`:

``` elisp

(defconst suwi-unu-palette-partial
  '((suwi-fg "#d1cbe7")
    (suwi-primary "#aeabed")
    (suwi-secondary "#8a80ff")
    (suwi-tertiary "#614dff"))
  "Palette entries that give `suwi-unu' its distinctive vibe.")

```


## Requirements

- Emacs 28.1 or newer
- `modus-themes` 5.0.0 or newer

## Installation

Suwi Themes is not yet available on MELPA.

### `use-package`

```elisp
(use-package suwi-themes
  :vc (:url "https://codeberg.org/satase/emacs-suwi-themes"
       :rev :newest)
  :config
  (require 'suwi-themes))
```

After installation, load any tracked Suwi theme:

```elisp
(load-theme 'suwi-unu t)
```

### Manual

Add the package directory to `load-path`, then require the core
entrypoint:

```elisp
(add-to-list 'load-path "/path/to/suwi-themes")
(require 'suwi-themes)
```

After that, load any tracked Suwi theme:

```elisp
(load-theme 'suwi-walo t)
```

The core package adds its own directory to `custom-theme-load-path`, so `require 'suwi-themes` is enough to make all the theme files
discoverable.

## Creating a theme

The sections below cover the basic structure. For concrete examples, look at the theme files in this repo.

### Colors

A Suwi theme needs only three colors:

- `suwi-primary` is used for constants, builtins, directories, prompts, and other primary accents.
- `suwi-secondary` is used for function names, variables, files, dates, and other reference-like accents.
- `suwi-tertiary` is used for strings, tags, hashes, identifiers, and other literal or annotation-like accents.

Keywords stay neutral by default. If you want them colored, define `suwi-keyword` explicitly in your theme palette.

If you want to change the default foreground text color, define `suwi-fg`. If you leave it unset, the theme inherits the base foreground from the shared light or dark palette.

### Faces

Most themes don't need face overrides. Start with palette entries and let the shared Suwi and Modus mappings do the rest.

If you do need a theme-specific face tweak, add it to that theme's `*-custom-faces-partial`. This is useful for the small number of package faces that you want to handle directly.

### File

The easiest way to start is to copy an existing theme and replace the name and colors. The file name should follow the `suwi-*-theme.el` pattern. The framework discovers all themes from filenames, so new themes do not require edits elsewhere.


## Contributing

If you want to add your theme to this collection, open a PR with:
- Your theme file
- Screenshots and, once it exists, edits to the gallery.
- A short rationale for why your theme belongs in this collection.


Contributions are accepted under the same license as this project: GPLv3 or any later version. Contributors retain copyright to their own work. If you add a new file, put your own copyright line in that file header. For example:

```elisp
;; Copyright (C) 2026 Jane Doe
```


## License

Distributed under the GNU General Public License, version 3 or any
later version. See [LICENSE](LICENSE).

## What is "suwi" anyways?

The word "suwi" means "sweet" in [toki pona](https://en.wikipedia.org/wiki/Toki_Pona). Some themes use toki pona words (like "unu" for "purple").
