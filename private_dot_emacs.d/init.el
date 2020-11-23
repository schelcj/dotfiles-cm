(require 'package)

;; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default)))
 '(package-selected-packages (quote (deft evil solarized-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; is there any other theme?
(load-theme 'solarized-dark t)

;; I've been using vi/vim for far too long...
(require 'evil)
(evil-mode 1)

;; misc org-mode settings
(setq org-agenda-files '("~/Documents/Org/"))
(setq org-log-done `time)
;; (setq org-log-done `note)

;; https://jblevins.org/projects/deft/
;; this is mainly to give me access to my hundreds of vim-pad notes
(require 'deft)
(setq deft-extensions '("txt"))
(setq deft-directory "~/Documents/Notes")

;; https://www.emacswiki.org/emacs/RecentFiles
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; get rid of that stupid toolbar
(tool-bar-mode -1)
