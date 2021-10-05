(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (tango-dark)))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(safe-local-variable-values (quote ((TeX-command-extra-options . "-shell-escape"))))
 '(scroll-conservatively 10000)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-language-environment "UTF-8")

;; font size
(set-face-attribute 'default nil :height 140)

;; window size
;;(add-to-list 'default-frame-alist '(height . 50))
;;(add-to-list 'default-frame-alist '(width . 110))

(add-to-list 'default-frame-alist '(/ (display-pixel-height) (frame-char-height)))
(add-to-list 'default-frame-alist '(/ (/ (display-pixel-width) 2) (frame-char-width)))

(setq indent-tabs-mode t)
(setq tab-width 6)
(setq-default indent-tabs-mode t)
(setq-default tab-width 6)

(defvaralias 'c-basic-offset 'tab-width)

;; directory view
(add-to-list 'load-path "~/.emacs.d/emacs-neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq visible-bell 1)

;; languages
(add-to-list 'load-path "~/.emacs.d/glsl-mode")
(require 'glsl-mode)

(add-to-list 'load-path "~/.emacs.d/lammps-mode")
(require 'lammps-mode)

(add-to-list 'load-path "~/.emacs.d/go-mode.el")
(require 'go-mode)
(setq go-mode-indent-tabs-mode t)

(defun indent-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))

(global-set-key [f12] 'indent-buffer)

(global-set-key [f11] 'tabify)

(global-set-key [f6] 'preview-clearout-document)
(global-set-key [f7] 'preview-document)

(global-set-key (kbd "C-a") 'replace-string)

(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

(defun my/add-auctex-file-variables ()
  (interactive)
  (if (and (not buffer-read-only)
		   (string= (file-name-extension (buffer-file-name)) "tex"))
	  (progn
		(add-file-local-variable 'coding 'utf-8-unix)
		(add-file-local-variable 'TeX-engine 'luatex)
		(goto-char (point-min)))))

(add-hook 'LaTeX-mode-hook 'my/add-auctex-file-variables)

;; compile latex document
(defun latex-compile ()
  (interactive)
  (save-buffer)
  (TeX-command "LaTeX" 'TeX-master-file))

(global-set-key [f5] 'latex-compile)

;; open shell on bottom (with size 30%) and switch to it
(defun bottom-shell ()
  (interactive)
  (let ((w (split-window-below (round (* 0.7 (window-height))))))
	(select-window w)
	(shell))
  (switch-to-buffer "*shell*"))

;; open shell in same window
(push (cons "*shell*" display-buffer--same-window-action) display-buffer-alist)

;; don't ask confirmation to kill
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(global-set-key [f9] 'bottom-shell)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

;; don't move cursor when scrolling
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))

