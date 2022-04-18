(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(tango-dark))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages '(nhexl-mode auctex))
 '(safe-local-variable-values
   '((compile-command . "pdflatex koitermaa_pic.tex")
     (compile-command . "make -k pdf")
     (TeX-command-extra-options . "-shell-escape")))
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

(defun addtab ()
  "Add literal tab character."
  (interactive)
  (goto-char (point-at-bol))
    (if (region-active-p)
      (replace-regexp "^" "\t"
                      nil (region-beginning) (region-end))
     (replace-regexp "^" "\t" nil (point-at-bol) (point-at-eol))
     )
    )

(defun deltab ()
  "Remove first tab character of line if found."
  (interactive)
  (goto-char (point-at-bol))
    (if (region-active-p)
      (replace-regexp "^\t" ""
                      nil (region-beginning) (region-end))
     (replace-regexp "^\t" "" nil (point-at-bol) (point-at-eol))
     )
    )

;; custom tab behaviour
(global-set-key (kbd "<C-tab>") 'addtab)
(global-set-key (kbd "<backtab>") 'deltab)

(defun delws ()
  "Remove leading whitespace."
  (interactive)
  (goto-char (point-at-bol))
    (if (region-active-p)
      (replace-regexp "^[\s\t]*" ""
                      nil (region-beginning) (region-end))
     (replace-regexp "^[\s\t]*" "" nil (point-at-bol) (point-at-eol))
     )
    )

(global-set-key [f10] 'delws)

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

(global-set-key (kbd "C-w") 'replace-string)
(global-set-key (kbd "C-a") 'mark-whole-buffer)

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

(defun risky-local-variable-p (sym &optional _ignored) nil) ;; remember risky local variable (compile-command)
(setq compilation-scroll-output t)
(setq compilation-window-height 6)
(setq compilation-read-command nil) ;; compile right away
(setq compilation-ask-about-save nil) ;; save automatically
(global-set-key [f4] 'compile)

(defun findmake ()
  "Go up directory and compile using makefile when found"
  (interactive)
  (when (locate-dominating-file default-directory "Makefile")
  (with-temp-buffer
    (cd (locate-dominating-file default-directory "Makefile"))
    (compile "make -k"))))

(global-set-key [f3] 'findmake)

;; run file
(global-set-key [f2] 'executable-interpret)

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

(defun my-kill-emacs ()
  "No confirmation to exit"
  (interactive)
  (save-some-buffers nil t)
  (kill-emacs))
(global-set-key (kbd "C-x C-c") 'my-kill-emacs)

(global-auto-revert-mode t)
;;(global-auto-revert-mode -1)
;;(defun ask-user-about-supersession-threat (fn)
;;  "Don't ask if files change on disk"
;;  )
;;(defun ask-user-about-lock (file opponent)
;;  "Don't ask about file lock"
;;   t)

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

