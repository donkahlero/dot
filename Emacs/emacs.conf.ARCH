;This is the TacoEmacs for ArchLinux
;------------------------------------------------------------------

;Backup Config
;Store Backup files in a folder .emacs.d/save in the home directory
;Keep 6 new versions - and 2 old ones
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
kept-new-versions 6
kept-old-versions 2
version-control t)

;Whistespace
;Unnessecary whitespaces and chars over 80 in a rows are marked
(load "whitespace.el")
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;Erlang Part.
;Requires erlang
;Set a load path - needs to be for the current erlang version
(setq load-path (cons  "/lib/erlang/lib/tools-2.8.2/emacs"
load-path))
(setq erlang-root-dir "/lib/erlang")
(setq exec-path (cons "/lib/erlang/bin" exec-path))
(require 'erlang-start)
(require 'erlang-flymake)
(setq erlang-electric-commands '())

;LaTeX
;Requires texlive-most texlive-bin auctex
;(add-to-list 'exec-path "/Library/TeX/texbin")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
