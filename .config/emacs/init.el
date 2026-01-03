(setq custom-file "~/.config/emacs/custom.el") ;; sperate custome file for custom changes
(setq inhibit-startup-screen t) ;; disable startup screen
(setq initial-scratch-message "") ;; set initial message to null
(setq ring-bell-function 'ignore) ;; disable ring-bell
(setq display-line-numbers-type 'relative) ;; set the format for displaying line numbers
(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 200) ;; default font
(menu-bar-mode -1) ;; disable menubar
(tool-bar-mode -1) ;; disable toolbar
(scroll-bar-mode -1) ;; disbale scrollbar
(global-display-line-numbers-mode) ;; enable line numbering
(show-paren-mode t) ;; highlights matching parenthesis
(load-theme 'modus-vivendi) ;; colorscheme
(delete-selection-mode) ;; if selection-mode replace with type text
(ido-mode t) ;; better
(load-file custom-file) ;; load custom-file

;; set per-save backup
(setq backup-directory-alist '(("" . "~/.local/share/emacs/backup/per-save")))

;; set per-session backup
(defun force-backup-of-buffer ()
  (when (not buffer-backed-up)
    (let ((backup-directory-alist '(("" . "~/.local/share/emacs/backup/per-session")))
          (kept-new-versions 3))
      (backup-buffer)))
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'before-save-hook  'force-backup-of-buffer)

;; for wayland use wl-copy/wl-paste
;; credit: yorickvP on Github
(setq wl-copy-process nil)
(defun wl-copy (text)
  (setq wl-copy-process 
        (make-process :name "wl-copy"
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

;; zoom in/zoom out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(global-set-key (kbd "C-;") 'comment-dwim) ;; comment

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

;; evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-undo-system 'undo-redo)

  ;; block cursors for all modes in evil mode
  (setq evil-default-cursor 'box)
  (setq evil-normal-state-cursor 'box)
  (setq evil-insert-state-cursor 'box)
  (setq evil-visual-state-cursor 'box)
  :config
  (evil-mode t))

;; more evil
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; smex
(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

;; php
(use-package php-mode
  :ensure t
  :mode "\\.php\\'")
(put 'set-goal-column 'disabled nil)
