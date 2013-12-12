;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; I'm japanese
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; Font
(set-face-attribute 'default nil :family "Ricty" :height 160)
(set-fontset-font "fontset-default" 'japanese-jisx0208 '("Ricty" . "iso10646-*"))

;; Line number
(global-set-key "\M-n" 'linum-mode)

;; C-h backspace
(global-set-key "\C-h" 'delete-backward-char)

;; C-z disabled
(global-set-key "\C-z" nil)

;; Indent use space
(setq-default indent-tabs-mode nil)

;; Hide toolbar
(tool-bar-mode -1)

;; Higlight bracket
(show-paren-mode 1)

;; Highligt current line
(setq hl-line-face 'underline)
;(set-face-attribute hl-line-face nil :underline t)
(global-hl-line-mode t)

;; Line number
(global-set-key "\M-n" 'linum-mode)

;; Display column number
(column-number-mode 1)

;; Disable male backup file
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Delete auto save file
(setq delete-auto-save-files t)

;; Disabled new window by drag and drop
(setq ns-pop-up-frames nil)

;; File name ignore case
(setq completion-ignore-case t)

;; Auto reload
(global-auto-revert-mode 1)

;; Custom themes
(load-theme 'wombat)

;; for whitespace-mode via http://d.hatena.ne.jp/syohex/20110119/1295450495
(require 'whitespace)
;; see whitespace.el for more details
(setq whitespace-style '(face tabs tab-mark spaces space-mark empty))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-tab "#adff2f")
(set-face-background 'whitespace-tab 'nil)
(set-face-underline  'whitespace-tab t)
(set-face-foreground 'whitespace-space "#7cfc00")
(set-face-background 'whitespace-space 'nil)
(set-face-bold-p 'whitespace-space t)
(set-face-underline  'whitespace-empty t)
(global-whitespace-mode 1)

;; Trackpad scroll
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

;; Uniqu buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; load path
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; elpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; tabbar
(require 'cl) ; for emacs-22.0.50 on Vine Linux 4.2
 (when (require 'tabbar nil t)
    (setq tabbar-buffer-groups-function
    (lambda (b) (list "All Buffers")))
    (setq tabbar-buffer-list-function
          (lambda ()
            (remove-if
             (lambda(buffer)
               (find (aref (buffer-name buffer) 0) " *"))
             (buffer-list))))
    (tabbar-mode))
(global-set-key [(control shift tab)] 'tabbar-backward)
(global-set-key [(control tab)] 'tabbar-forward)
;; tabbar face
 (set-face-attribute
   'tabbar-default-face nil
   :background "gray60")
  (set-face-attribute
   'tabbar-unselected-face nil
   :background "gray85"
   :foreground "gray30"
   :box nil)
  (set-face-attribute
   'tabbar-selected-face nil
   :background "#f2f2f6"
   :foreground "black"
   :box nil)
  (set-face-attribute
   'tabbar-button-face nil
   :box '(:line-width 1 :color "gray72" :style released-button))
  (set-face-attribute
   'tabbar-separator-face nil
   :height 0.7)


;;;;;;;;;; elpa

;; mark-multiple
(require 'inline-string-rectangle)
(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)

(add-hook 'sgml-mode-hook
          (lambda ()
            (require 'rename-sgml-tag)
            (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)))

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-hook 'web-mode-hook  'web-mode-hook)
;; color
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))                          ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "#E6B422" :weight bold))))             ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "#C97586"))))                          ; 属性名など
 '(web-mode-html-attr-value-face
   ((t (:foreground "#82AE46"))))                          ; 属性値
 '(web-mode-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-server-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)

;; php-mode
(setq php-mode-force-pear t)

(add-hook 'php-mode-hook
  '(lambda ()
     (c-set-offset 'case-label' 4)
     (c-set-offset 'arglist-intro' 4)
     (c-set-offset 'arglist-cont-nonempty' 4)
     (c-set-offset 'arglist-close' 0)
     (require 'php-completion)
     (php-completion-mode t)
     (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
     (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))

;; flymake-php
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)

;; git-gutter+
(global-git-gutter+-mode t)

;; sr-speedbar
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
