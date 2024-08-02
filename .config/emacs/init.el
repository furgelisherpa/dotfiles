(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
;; disable ring-bell
(setq ring-bell-function 'ignore)
;; default font
(set-face-attribute 'default nil :font "ComicShannsMono Nerd Font" :height 150)
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
; highlights matching parenthesis
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

;; if selection-mode replace with type text
(delete-selection-mode)

;; zoom in/zoom out
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

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

;; projectile
(use-package projectile
  :ensure t
  :config
  (setq projectile-indexing-method 'hybrid)
  (setq projectile-sort-order 'default)
  (setq projectile-enable-caching t)
  (setq projectile-require-project-root nil)
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-switch-project-action #'projectile-find-dir)
  (setq projectile-completion-system 'ivy))

;; which-key
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode 1)
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-allow-imprecise-window-fit nil
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.8
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit nil
        which-key-separator " → " ))

;; load-theme
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package ivy
  :ensure t
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

(use-package pdf-view
  :ensure nil
  :after pdf-tools
  :bind (:map pdf-view-mode-map
        ("C-s" . isearch-forward))
  :custom (pdf-view-use-unicode-ligther nil))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ivy gruvbox-theme which-key projectile use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
