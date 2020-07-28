;; Tony Ballantyne
;; 28th July 2020
;; Package Specific dotemacs

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil Mode

(when (require 'evil nil t)
  ;; (evil-mode 1)
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (setq-default evil-cross-lines t)
   ;(defalias 'evil-insert-state 'evil-emacs-state)
; Evil insert mode just like Emacs
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)

; Make Escape work given above
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state))

; Enable evil-surround mode
(when (require 'evil-surround nil t)
  (global-evil-surround-mode 1)

  (global-set-key (kbd "<f6>") 'evil-mode)
  (global-set-key (kbd "C-M-z") 'evil-mode))

;; Evil Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


