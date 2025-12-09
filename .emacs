(custom-set-variables
 '(column-number-mode t)
 '(tab-bar-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(tango-dark))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 ;; '(package-selected-packages '(magit dash auctex nhexl-mode lsp-mode yasnippet
 ;; 						 lsp-treemacs helm-lsp projectile hydra
 ;; 						 flycheck company avy which-key helm-xref
 ;; 						 dap-mode rust-mode anzu))
 '(scroll-conservatively 10000)
 '(tool-bar-mode nil))
(custom-set-faces
 )

(set-language-environment "UTF-8")

;; font size
(set-face-attribute 'default nil :height 170)

;; window size
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 84))
(add-to-list 'default-frame-alist '(/ (display-pixel-height) (frame-char-height)))
(add-to-list 'default-frame-alist '(/ (/ (display-pixel-width) 2) (frame-char-width)))

;; set mode string
(add-to-list 'global-mode-string '(" %i"))

;; set tabs
(setq indent-tabs-mode t)
(setq tab-width 6)
(setq-default indent-tabs-mode t)
(setq-default tab-width 6)
(defvaralias 'c-basic-offset 'tab-width)

;; revert to file on disk
(global-auto-revert-mode t)

;; disable backup
(setq backup-inhibited t)
;; disable auto save
(setq auto-save-default nil)

;; no bell
(setq visible-bell 1)

(put 'downcase-region 'disabled nil)

;; === packages ===

;; (setq package-archives '(("elpa" . "http://tromey.com/elpa/")
;; 				 ("melpa" . "http://melpa.org/packages/")
;; 				 ("gnu" . "http://elpa.gnu.org/packages/")
;; 				 ("marmalade" . "http://marmalade-repo.org/packages/")))
;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))
;; (dolist (package package-selected-packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; directory view
(add-to-list 'load-path "~/.emacs.d/emacs-neotree")
(require 'neotree)

;; languages

(add-to-list 'load-path "~/.emacs.d/glsl-mode")
(require 'glsl-mode)

(add-to-list 'load-path "~/.emacs.d/lammps-mode")
(require 'lammps-mode)

(add-to-list 'load-path "~/.emacs.d/go-mode.el")
(require 'go-mode)
(setq go-mode-indent-tabs-mode t)

;; === user-defined functions ===

(defun indent ()
  "Indent region"
  (interactive)
  (if (region-active-p)
	(indent-rigidly (region-beginning) (region-end) 6)
    (indent-rigidly (line-beginning-position) (line-end-position) 6)
    )
  )

(defun unindent ()
  "Unindent region"
  (interactive)
  (if (region-active-p)
	(indent-rigidly (region-beginning) (region-end) -6)
    (indent-rigidly (line-beginning-position) (line-end-position) -6)
    )
  )

(defun indent-buffer ()
  "Indent the whole buffer"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun findmake ()
  "Go up directory and compile using makefile when found"
  (interactive)
  (when (locate-dominating-file default-directory "Makefile")
    (with-temp-buffer
	(cd (locate-dominating-file default-directory "Makefile"))
	(compile "make -k"))))

(defun risky-local-variable-p (sym &optional _ignored) nil) ;; remember risky local variable (compile-command)
(setq compilation-scroll-output t)
(setq compilation-window-height 6)
(setq compilation-read-command nil) ;; compile right away
(setq compilation-ask-about-save nil) ;; save automatically

(defun bottom-shell ()
  "Open shell on bottom of window and switch to it"
  (interactive)
  (let ((w (split-window-below (round (* 0.7 (window-height))))))
    (select-window w)
    (shell))
  (switch-to-buffer "*shell*"))

;; open shell in same window
(push (cons "*shell*" display-buffer--same-window-action) display-buffer-alist)

;; don't ask confirmation to kill
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))

(defun my-kill-emacs ()
  "No confirmation to exit"
  (interactive)
  (save-some-buffers nil t)
  (kill-emacs))

;; don't move cursor when scrolling
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))

;; === keybindings ===

;; close emacs
(global-set-key (kbd "C-x C-c") 'my-kill-emacs)

;; select all
(global-set-key (kbd "C-a") 'mark-whole-buffer)

;; find and replace
(global-set-key (kbd "C-w") 'replace-string)

;; tab bar shortcuts
(global-set-key (kbd "C-t") 'tab-new)
(global-set-key (kbd "S-C-t") 'tab-close)
(global-set-key (kbd "C-x C-g") 'find-file-other-tab)

;; window navigation
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; mouse font scale
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

;; indentation
(global-set-key (kbd "<tab>") 'indent)
(global-set-key (kbd "<backtab>") 'unindent)

;; run script file
(global-set-key [f2] 'executable-interpret)

;; find makefile and run it
(global-set-key [f3] 'findmake)

;; run makefile
(global-set-key [f4] 'compile)

;; open tree view
(global-set-key [f8] 'neotree-toggle)

;; open a shell
(global-set-key [f9] 'bottom-shell)

;; auto indent the buffer
(global-set-key [f12] 'indent-buffer)

;; get error
(global-set-key (kbd "C-c ö") 'previous-error)
(global-set-key (kbd "C-c ä") 'next-error)

;; === extra stuff ===

;; (helm-mode)
;; (require 'helm-xref)
;; (define-key global-map [remap find-file] #'helm-find-files)
;; (define-key global-map [remap execute-extended-command] #'helm-M-x)
;; (define-key global-map [remap switch-to-buffer] #'helm-mini)

;; (define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
;; (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)

;; (which-key-mode)

;; (global-anzu-mode +1)

;; (defun my/add-auctex-file-variables ()
;;   (interactive)
;;   (if (and (not buffer-read-only)
;; 	     (string= (file-name-extension (buffer-file-name)) "tex"))
;; 	(progn
;; 	  (add-file-local-variable 'coding 'utf-8-unix)
;; 	  (add-file-local-variable 'TeX-engine 'luatex)
;; 	  (goto-char (point-min)))))

;; (add-hook 'LaTeX-mode-hook 'my/add-auctex-file-variables)

;; ;; compile latex document
;; (defun latex-compile ()
;;   (interactive)
;;   (save-buffer)
;;   (TeX-command "LaTeX" 'TeX-master-file))

;;(global-set-key [f5] 'latex-compile)

;; (defun start-lsp ()
;;   "Start LSP"
;;   (interactive)
;;   (add-hook 'c-mode-hook 'lsp)
;;   (add-hook 'c++-mode-hook 'lsp)
;;   (lsp))

;; (global-set-key [f6] 'start-lsp)

;; (setq gc-cons-threshold (* 100 1024 1024)
;;       read-process-output-max (* 1024 1024)
;;       treemacs-space-between-root-nodes nil
;;       company-idle-delay 0.0
;;       company-minimum-prefix-length 1
;;       lsp-idle-delay 0.1)  ;; clangd is fast

;; (with-eval-after-load 'lsp-mode
;;   (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;   (require 'dap-cpptools)
;;   (yas-global-mode))

