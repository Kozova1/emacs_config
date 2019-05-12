(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(electric-pair-mode t)
 '(electric-pair-pairs
   (quote
    ((34 . 34)
     (8216 . 8217)
     (8220 . 8221)
     (123 . 125)
     (39 . 39))))
 '(package-selected-packages
   (quote
    (spaceline powerline-evil ergoemacs-status arduino-mode sr-speedbar auto-complete web-mode base16-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; base16-gruvbox-dark-hard-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar base16-gruvbox-dark-hard-colors
  '(:base00 "#1d2021"
    :base01 "#3c3836"
    :base02 "#504945"
    :base03 "#665c54"
    :base04 "#bdae93"
    :base05 "#d5c4a1"
    :base06 "#ebdbb2"
    :base07 "#fbf1c7"
    :base08 "#fb4934"
    :base09 "#fe8019"
    :base0A "#fabd2f"
    :base0B "#b8bb26"
    :base0C "#8ec07c"
    :base0D "#83a598"
    :base0E "#d3869b"
    :base0F "#d65d0e")
  "All colors for Base16 Gruvbox dark, hard are defined here.")

;; Define the theme
(deftheme base16-gruvbox-dark-hard)

;; Add all the faces to the theme
(base16-theme-define 'base16-gruvbox-dark-hard base16-gruvbox-dark-hard-colors)

;; Mark the theme as provided
(provide-theme 'base16-gruvbox-dark-hard)

(provide 'base16-gruvbox-dark-hard-theme)

;;; base16-gruvbox-dark-hard-theme.el ends here

(ac-config-default)
(global-auto-complete-mode t)
(global-display-line-numbers-mode)
(setq sr-speedbar-right-side nil)
(setq speedbar-use-images t)
;;(spaceline-emacs-theme)
(powerline-default-theme)
(setq powerline-default-separator 'wave)
