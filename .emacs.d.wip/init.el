;; emacs configuration

(push "/Users/cmagid/brew/bin" exec-path)
(push "/usr/local/bin" exec-path)
(push "/Users/cmagid/.rvm/gems/ruby-1.9.3-p327@emacs24/bin" exec-path)
(push "/Users/cmagid/.rvm/gems/ruby-1.9.3-p327@global/bin" exec-path)
(push "/Users/cmagid/.rvm/rubies/ruby-1.9.3-p327/bin" exec-path)
(push "/Users/cmagid/.rvm/bin" exec-path)
(push "/Users/cmagid/brew/sbin" exec-path)
(push "/usr/local/Cellar/emacs/HEAD/bin" exec-path)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

(set-frame-font "Menlo-16")

(require 'package)
;; (setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; ================================================================ additions

(require 'cl)

(global-set-key (kbd "C->") (quote forward-word))
(global-set-key (kbd "C-<") (quote backward-word))

;; Insert date
(defun insert-date () "Insert according to locale's date and time format." (interactive)
  (insert (format-time-string "%c" (current-time))))

;; Flash screen for c-g do not ring bell
(set-variable (quote visible-bell) t nil)

;;Non-nil means open files upon request from the Workspace in a new frame.
(setq ns-pop-up-frames nil)

;; Simple code fold toggling, makes indenting more meaningful
;; See: http://emacs.wordpress.com/2007/01/16/quick-and-dirty-code-folding/
(defun jao-selective-display ()
  "Activate selective display based on the column at point"
  (interactive)
  (set-selective-display
   (if selective-display
       nil
     (+ 1 (current-column)))))
;; WARNING (global-set-key "." (quote jao-selective-display))
;; no good because prefix in some modes
;; [C-c C-space]
(global-set-key (quote [3 67108896]) (quote jao-selective-display))

;; ;; dirtree depends upon http://www.emacswiki.org/emacs/windata.el
;; (require 'dirtree)
;; ;; redefine dired key binding to be dirtree
;; (global-set-key "d" (quote dirtree))

;; (require 'mark-more-like-this)
;; (global-set-key (kbd "C-<") 'mark-previous-like-this)
;; (global-set-key (kbd "C->") 'mark-next-like-this)
;; (global-set-key (kbd "C-M-m") 'mark-more-like-this) ; like the other two, but takes an argument (negative is previous)

;;
;; Never understood why Emacs doesn't have this function. https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;;
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn (rename-file name new-name 1) (rename-buffer new-name) (set-visited-file-name new-name) (set-buffer-modified-p nil))))))

;; Note trailing white space
(setq-default show-trailing-whitespace t)

;; Remove trailing white space
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Note where column 80 is
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
;(global-whitespace-mode t) interfers with nXhtml for rhtml files

(require 'yaml-mode)

;; switch between horizontal split to vertical and reverse ; http://www.emacswiki.org/emacs/ToggleWindowSplit
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
																		 (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))
(define-key ctl-x-4-map "t" 'toggle-window-split)

;(require 'markerpen)

;; Not using auto-pair modes
;;(wrap-region-global-mode t) ; It does not work in rails mode

;;http://ergoemacs.org/emacs_manual/emacs/Saving-Emacs-Sessions.html
(desktop-save-mode 1)
(setq desktop-restore-eager 10)
;;http://www.emacswiki.org/DeskTop
(setq history-length 1250)

;;(define-key global-map (kbd "C-+") 'col-highlight-flash)
(define-key global-map (kbd "C-+") 'crosshairs-mode)

(defun ansi-color-file ()
  "Show the ansi color escape code in log file correctly"
  (interactive)
  (let (var1)
    (setq var1 'some)
    (ansi-color-apply-on-region (point-min) (point-max))))

;; enable command arrow for movements
(global-set-key [s-left] (quote backward-sexp))
(global-set-key [s-right] (quote forward-sexp))

;; Org-mode todo list macro
(fset 'cmm-add-todo-in-org-mode
   [?\C-a ?* ?  ?t ?o ?d ?o ?\C-\[ ?b ?\C-\[ ?u ?: ?  ?\C-\[ ?x ?i ?n ?s ?e ?r ?  ?d ?a ?\C-m ?\C-\M-m M-right ?S ?u ?m ?m ?a ?r ?y ?: ?\C-\M-m ?T ?o ?d ?a ?y ?: ?\C-\M-m ?L ?o ?n ?g ?  ?T ?e ?r ?m ?: ?\C-\M-m ?S ?c ?r ?a ?t ?c ?h ?\C-c ?\C-u])

(defalias 'cmm-global-replace-t-toggle-mark-Q-Query-Replace 'find-name-dired)

;(load-theme 'tango)
;;(load-theme (quote wheatgrass) nil nil)
(require 'color-theme-railscasts) ; implicit M-x color-theme-railscasts

(require 'textmate)
(textmate-mode)

;; http://stackoverflow.com/questions/1817370/using-ediff-as-git-mergetool
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(defun local-ediff-before-setup-hook ()
  (setq local-ediff-saved-frame-configuration (current-frame-configuration))
  (setq local-ediff-saved-window-configuration (current-window-configuration))
;  (local-ediff-frame-maximize)
  (if git-mergetool-emacsclient-ediff-active
      (raise-frame)))

(defun local-ediff-quit-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(defun local-ediff-suspend-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(add-hook 'ediff-before-setup-hook 'local-ediff-before-setup-hook)
(add-hook 'ediff-quit-hook 'local-ediff-quit-hook 'append)
(add-hook 'ediff-suspend-hook 'local-ediff-suspend-hook 'append)

;; Useful for ediff merge from emacsclient.
(defun git-mergetool-emacsclient-ediff (local remote base merged)
  (setq git-mergetool-emacsclient-ediff-active t)
  (if (file-readable-p base)
      (ediff-merge-files-with-ancestor local remote base nil merged)
    (ediff-merge-files local remote nil merged))
  (recursive-edit))

(defun git-mergetool-emacsclient-ediff-after-quit-hook ()
  (exit-recursive-edit))

(add-hook 'ediff-after-quit-hooks 'git-mergetool-emacsclient-ediff-after-quit-hook 'append)


;; http://www.emacswiki.org/emacs/MacOSTweaks#toc4
(defun mac-open-terminal ()
   (interactive)
   (let ((dir ""))
     (cond
      ((and (local-variable-p 'dired-directory) dired-directory)
       (setq dir dired-directory))
      ((stringp (buffer-file-name))
       (setq dir (file-name-directory (buffer-file-name))))
      )
     (do-applescript
      (format "
 tell application \"Terminal\"
   activate
   try
     do script with command \"cd %s\"
   on error
     beep
   end try
 end tell" dir))
     ))

;; https://github.com/Fuco1/smartparens
;; (require 'smartparens)
;; (smartparens-global-mode 1)
;; use simpler wrap-region

(require 'wrap-region)
;(wrap-region-mode t)
(wrap-region-global-mode t)

;; enable use of emacsclient
(server-start) ;;; Use C-x # to close an emacsclient buffer.

;; https://github.com/capitaomorte/yasnippet
;;(require 'yasnippet)
;; (setq yas/snippet-dirs
;;       '("~/.emacs.d/snippets/2"            ;; personal snippets
;;         "~/.emacs.d/snippets/1"
;;         "~/.emacs.d/elpa/yasnippet-20130112.1823/snippets" ;; the default collection

;;         ))
;; (yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.
;; (yas-reload-all 1)

;; For rhtml files [I am guessing this needs to be after yasnippets]
(load "~/.emacs.d/nxhtml/autostart.el")
;; http://stackoverflow.com/questions/10022379/having-eruby-nxhtml-mumamo-mode-be-set-every-time-i-open-a-html-erb-file
(require 'mumamo-fun)
(setq mumamo-chunk-coloring 'submode-colored)
(add-to-list 'auto-mode-alist '("\\.rhtml?$" . eruby-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\.erb$" . eruby-nxhtml-mumamo-mode))
;; Workaround the annoying warnings:
;;    Warning (mumamo-per-buffer-local-vars):
;;    Already 'permanent-local t: buffer-file-name
(when (and (equal emacs-major-version 24)
           (equal emacs-minor-version 2))
  (eval-after-load "mumamo"
    '(setq mumamo-per-buffer-local-vars
           (delq 'buffer-file-name mumamo-per-buffer-local-vars))))

(shell nil)

(require 'auto-complete)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20121203.832/dict/")
(require 'auto-complete-config)
(ac-config-default)
;; http://emacswiki.org/emacs/AutoComplete
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))
                       ))
(real-global-auto-complete-mode t)


;; Can not get auto-complete to work
;(add-to-list 'load-path "~/.emacs.d")    ; This may not be appeared if you have already added.
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (require 'auto-complete-config)
;; (ac-config-default)
; ================================================================ debugging

;*ERROR*: Symbol's function definition is void: local-ediff-frame-maximize
