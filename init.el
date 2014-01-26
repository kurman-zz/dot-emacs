(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
              '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(clojure-mode pkg-info rainbow-delimiters paredit)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Paredit, YES!!! %-)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)

;; Cider (nRepl) with suggested settings
(add-to-list 'load-path "/Users/kurman/.emacs.d/custom/cider")
(require 'cider)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq nrepl-buffer-name-separator "-")
(setq nrepl-buffer-name-show-port t)
(setq cider-repl-display-in-current-window t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)

;; Auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'ido)
(ido-mode t)

;;; M+x install-packages  - (melpa)  and select icicles
(add-to-list 'load-path "/Users/kurman/.emacs.d/elpa/icicles-20131224.459/icicles-mac.el")
 (require 'icicles)

(add-to-list 'load-path "/Users/kurman/.emacs.d/custom/dart-mode")
(require 'dart-mode)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

(setq web-mode-engines-alist
      '(("\\.html\\'" . "angular")))

(add-to-list 'load-path "/Users/kurman/.emacs.d/custom/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(add-to-list 'load-path "/Users/kurman/.emacs.d/custom/helm")
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)


(add-to-list 'load-path "/Users/kurman/.emacs.d/custom/projectile")
(require 'projectile)
(require 'helm-projectile)

(add-to-list 'load-path "/Users/kurman/.emacs.d/custom/ruby-mode")

(autoload 'ruby-mode "ruby-mode" "Major mode for editing Ruby code" t)
(require 'ruby-mode)

(add-to-list 'auto-mode-alist
               '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
               '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

;; Always show line numbers
(global-linum-mode t)

;; Shell in emacs
(global-set-key (kbd "C-x C-m")  'shell)

;; Kill Ring popup
(add-to-list 'load-path "/Users/kurman/.emacs.d/custom/browse-kill-ring")
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

(global-set-key "\C-cy" '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))

;; Show buffers in the same window
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Join lines
(global-set-key "\C-cq" 'join-line)

;; Limit dired columns
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
;;; Then customize by running
;;; M-x customize-group RET ls-lisp RET
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ls-lisp-verbosity nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
