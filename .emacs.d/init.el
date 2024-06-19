(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
;; disable ring-bell
(setq ring-bell-function 'ignore)
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
;; completition
(ido-mode 1)
;; highlights matching parenthesis
(show-paren-mode 1)

;; set per-save backup
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

;; set per-session backup
(defun force-backup-of-buffer ()
  (when (not buffer-backed-up)
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(add-hook 'before-save-hook  'force-backup-of-buffer)

;; for wayland use wl-copy/wl-paste
;; credit: yorickvP on Github
(setq wl-copy-process nil)
(defun wl-copy (text)
  (setq wl-copy-process (make-process :name "wl-copy"
                                      :buffer nil
                                      :command '("wl-copy" "-f" "-n")
                                      :connection-type 'pipe
                                      :noquery t))
  (process-send-string wl-copy-process text)
  (process-send-eof wl-copy-process))
(defun wl-paste ()
  (if (and wl-copy-process (process-live-p wl-copy-process))
      nil ; should return nil if we're the current paste owner
      (shell-command-to-string "wl-paste -n | tr -d \r")))
(setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)

;; if selection-mode replace with type text
(delete-selection-mode)

;; Load the theme file
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(enable-theme 'kanagawa)

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

;; pdf-viewer
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-width)
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
  (add-hook 'pdf-view-mode-
	  (lambda ()
              (pdf-view-midnight-minor-mode)
              (setq pdf-view-midnight-colors '("#ffffff" . "#000000")))) ;; White text on black background
  (setq-default pdf-view-display-size 'fit-width)
  (setq pdf-view-continuous t)
  (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1))))
