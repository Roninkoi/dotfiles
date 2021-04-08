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

;; window size
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 120))

;; font size
(set-face-attribute 'default nil :height 140)

(setq indent-tabs-mode t)
(setq tab-width 4)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq visible-bell 1)

(add-to-list 'load-path "~/.emacs.d/glsl-mode")
(require 'glsl-mode)

(add-to-list 'load-path "~/.emacs.d/go-mode")
(require 'go-mode)
(setq go-mode-indent-tabs-mode t)

(add-to-list 'load-path "~/.emacs.d/opencl-mode")
(require 'opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f12] 'indent-buffer)

(global-set-key [f11] 'tabify)

(global-set-key [f6] 'preview-clearout-document)
(global-set-key [f7] 'preview-document)

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

(defun latex-compile ()
    (interactive)
    (save-buffer)
    (TeX-command "LaTeX" 'TeX-master-file))

(global-set-key [f5] 'latex-compile)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))

