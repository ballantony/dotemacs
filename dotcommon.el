;; Tony Ballantyne
;; 26th July 2020
;; Common dotemacs
;; Platform independent, no packages expected

;; ********************************************************
;; Common Settings

;; Package Manager
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

;; Startup Screen
(setq inhibit-startup-buffer-menu t)
(setq inhibit-startup-screen t)

;; Make M-k etc work for me
(setq sentence-end-double-space nil)

;; Allow repeated C-Space after C-u C-Space to jump through marks
(setq set-mark-command-repeat-pop 't)

;; Hooks
(add-hook 'text-mode-hook 'visual-line-mode)

;; Enable various Modes
(ido-mode t)
;(electric-pair-mode t)
; (desktop-save-mode 1)
; (desktop-read)			 

;; Allow M-o to omit files in Dired
(require 'dired-x)
(setq dired-omit-mode t)

;; org Mode Keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-ct" 'org-capture)


;; (setq org-todo-keywords
;;       (quote ((sequence "TODO" "NEXT" "|" "DONE"))))


;; Org Agenda Commands
(setq org-agenda-window-setup 'current-window)

(setq org-agenda-custom-commands
  '(("1" "Level 1 projects " tags "project+LEVEL=1")))

;; windmove easy window switching
;(windmove-default-keybindings 'meta)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Bookmarks save as they are created
(setq bookmark-save-flag 1)

;; Abbrev Mode
(setq-default abbrev-mode t)   ;; turn it on for all modes
(setq save-abbrevs 'silently)  ;; save abbrevs without prompting when files are saved

;; Alias, Setkeys, Mouseclicks
(global-set-key "\M-]" 'bookmark-jump)
(global-set-key (kbd "<next>") 'other-window)
(global-set-key (kbd "<f7> <f7>") 'org-mark-ring-push)
(global-set-key (kbd "C-<f7>") 'org-mark-ring-goto)

(defalias 'vlm 'visual-line-mode)
(defalias 'yes-or-no-p 'y-or-n-p) ;  stop having to type yes or no
(defalias 'cv 'customize-variable)
(defalias 'ts 'transpose-sentences)
(defalias 'tp 'transpose-paragraphs)
(defalias 'eb 'eval-buffer)

;; Mouse 3 for flyspell
(eval-after-load "flyspell"
  '(define-key flyspell-mode-map [down-mouse-3] 'flyspell-correct-word)) 

;; Force Backups
(setq version-control t	     ;; Use version numbers for backups
      kept-new-versions 16   ;; Number of newest versions to keep
      kept-old-versions 2    ;; Number of oldest versions to keep
      delete-old-versions t ;; Don't ask to delete excess backup versions
      backup-by-copying-when-linked t) ;; Copy linked files, don't rename.
(defun force-backup-of-buffer () ;; Backup each save, not each session
  (let ((buffer-backed-up nil))
    (backup-buffer)))
(add-hook 'before-save-hook  'force-backup-of-buffer)

;; Common Settings
;; ********************************************************



