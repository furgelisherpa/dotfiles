;; disable ring-bell
(setq ring-bell-function 'ignore)2
;; default font
(set-face-attribute 'default nil :font "ComicShannsMono Nerd Font" :height 200)
;; disable menubar
(menu-bar-mode -1)
;; disable toolbar
(tool-bar-mode -1)
;; disbale scrollbar
(scroll-bar-mode -1)
;; enable line numbering
(global-display-line-numbers-mode)
;; set the format for displaying line numbers
(setq display-line-numbers-type 'relative)

;; set per-save backup
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

;; set per-sessin backup
(defun force-backup-of-buffer ()
  (when (not buffer-backed-up)
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)

;; installing package manager
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)
