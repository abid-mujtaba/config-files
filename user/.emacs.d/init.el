(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages"))

(setq package-enable-at-startup nil)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq evil-want-fine-undo t)
(setq evil-want-keybinding nil)

;; Free up Tab for org-mode
;; Must be defined before the evil package is loaded
(setq-default evil-want-C-i-jump nil)

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode t)

;; Enable evil-collection (evil bindings in all states)
(evil-collection-init)

;; Let w move to any line (not just the current line)
;; Source: https://github.com/PythonNut/evil-easymotion/issues/50
;; (evilem-make-motion evilem-motion-forward-word-begin #'evil-forward-word-begin)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow--define-theme bright)

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))

(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

;; Enable line numbers by default
;; Add space between line number and text
(setq linum-format "%d  ")
(global-linum-mode t)

;; Use gcc to toggle comments
(evil-commentary-mode)

;; Enable company-mode (for auto-completion)
(company-mode)

;; Use pytest as the default test runner for elpy
(setq elpy-test-runner 'elpy-test-pytest-runner)

;; Enable the python package
(elpy-enable)

;; Enable flycheck (realtime syntax checking)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;; Run black when saving buffer
(add-hook 'elpy-mode-hook 'python-black-on-save-mode)


(require 'magit)
(require 'git-gutter)
(require 'powerline)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-org org evil-collection python-black powerline markdown-mode magit evil-magit key-chord git-gutter flycheck evil-visual-mark-mode evil-easymotion evil-commentary elpy company-jedi color-theme-sanityinc-tomorrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Define , to be the easymotion leader key
(evilem-default-keybindings ",")

;; Enable mouse
(xterm-mouse-mode)

;; Uncomment to make easymotion cross lines for w, b, etc.
;;
;; (put 'visible-buffer 'bounds-of-thing-at-point (lambda () (cons (window-start) (window-end))))
;; (evilem-make-motion evilem-motion-forward-word-begin #'evil-forward-word-begin :scope 'visible-buffer)
;; (evilem-make-motion evilem-motion-forward-WORD-begin #'evil-forward-WORD-begin :scope 'visible-buffer)
;; (evilem-make-motion evilem-motion-forward-word-end #'evil-forward-word-end :scope 'visible-buffer)
;; (evilem-make-motion evilem-motion-forward-WORD-end #'evil-forward-WORD-end :scope 'visible-buffer)
;; (evilem-make-motion evilem-motion-backward-word-begin #'evil-backward-word-begin :scope 'visible-buffer)
;; (evilem-make-motion evilem-motion-backward-WORD-begin #'evil-backward-WORD-begin :scope 'visible-buffer)
;; (evilem-make-motion evilem-motion-backward-word-end #'evil-backward-word-end :scope 'visible-buffer)
;; (evilem-make-motion evilem-motion-backward-WORD-end #'evil-backward-WORD-end :scope 'visible-buffer)
