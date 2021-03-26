;; get rid of that stupid toolbar
(tool-bar-mode -1)

;; want my line numbers back
; (setq global-linum-mode t)
(setq global-display-line-numbers-mode t)

(setq backup-directory-alist
      `(("." . ,"~/tmp/")))

;; (setq backup-directory-alist
;;                 `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;                 `((".*" ,temporary-file-directory t)))

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
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files '("~/Dropbox/Org/concert-projects.org") nil (org-trello))
 '(package-selected-packages
   '(gruvbox-theme ob-mermaid mermaid-mode evil-org org-trello neotree org-protocol-jekyll buffer-flip markdown-mode+ markdown-mode org-bullets org-beautify-theme org-download pdf-tools magit perlbrew org-journal powerline-evil powerline deft evil solarized-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; is there any other theme?
(load-theme 'solarized-dark t)
;; (load-theme `gruvbox-dark-medium t)

;; I've been using vi/vim for far too long...
(require 'evil)
(evil-mode 1)

;; misc org-mode settings
(setq org-agenda-files '("~/Dropbox/Org/"))
(setq org-log-done `time)
(add-hook 'org-mode-hook 'org-indent-mode)
;; (setq org-log-done `note)

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(global-set-key [f7] 'org-journal-new-entry)
(global-set-key [f9] 'org-agenda)
(global-set-key [f12] 'org-capture)

(defun transform-square-brackets-to-round-ones(string-to-transform)
  "Transforms [ into ( and ] into ), other chars left unchanged."
  (concat 
  (mapcar #'(lambda (c) (if (equal c ?[) ?\( (if (equal c ?]) ?\) c))) string-to-transform))
  )

(setq org-directory "~/Dropbox/Org")
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq org-hide-emphasis-markers t)
(setq org-capture-templates
      '(("m" "Meeting" entry (file org-default-notes-file)
	 "* %u MEETING with %?\n")
        ("n" "Note" entry (file org-default-notes-file)
	 "* NOTE %?\n/Entered on/ %U")
        ("t" "Todo" entry (file org-default-notes-file)
	 "* TODO %?\n/Entered on/ %U")
	("p" "Protocol" entry (file+headline ,(file org-default-notes-file) "Inbox")
        "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")	
	("L" "Protocol Link" entry (file+headline ,(file org-default-notes-file) "Inbox")
        "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n") ))

(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(font-lock-add-keywords 'org-mode
                        '(("^\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; enable evil mode in the org-agenda buffers
;; (require 'evil-org)
;; (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
;; (add-hook 'org-mode-hook 'evil-org-mode)

;; org-journal setup
(require 'org-journal)
(setq org-journal-dir "~/Dropbox/Org/journal/")
(setq org-journal-date-format "%A, %d %B %Y")

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; load up babel languages
(org-babel-do-load-languages 'org-babel-load-languages
    '((shell      . t)
	(js         . t)
	(emacs-lisp . t)
	(perl       . t)
	(python     . t)
	(ruby       . t)
	(css        . t)
	(plantuml   . t)))

;; (add-to-list 'org-agenda-custom-commands
;;              '("w" "Waiting For" tags "+waitingfor"))

;; (add-to-list 'org-agenda-custom-commands
;;              '("f" "Follow Up" tags "+followup"))

;; (add-to-list 'org-agenda-custom-commands
;;              '("h" "On Hold" tags "+ohhold"))

;; (add-to-list 'org-agenda-custom-commands
;;              '("i" "In Progress" tags "+inprogress"))

;; https://jblevins.org/projects/deft/
;; this is mainly to give me access to my hundreds of vim-pad notes
(require 'deft)
(setq deft-directory "~/Dropbox/Notes")
(setq deft-extensions '("org" "txt" "md"))
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-use-filename-as-title t)
(setq deft-file-naming-rules
       '((noslash . "-")
         (nospace . "-")
         (case-fn . downcase)))
(global-set-key [f8] `deft)


;; https://www.emacswiki.org/emacs/RecentFiles
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; bring back powerline
(require 'powerline)
(powerline-default-theme)

;; bring in magit
(require 'magit)

(require 'pdf-tools)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)

(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

;; buffer-flip for alt-tab buffer switching
(require `buffer-flip)
(global-set-key (kbd "M-<tab>") 'buffer-flip)

;; transient keymap used once cycling starts
(setq buffer-flip-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-<tab>")   'buffer-flip-forward) 
        (define-key map (kbd "M-S-<tab>") 'buffer-flip-backward)
        (define-key map (kbd "M-ESC")     'buffer-flip-abort)
        map))

;; buffers matching these patterns will be skipped
(setq buffer-flip-skip-patterns 
      '("^\\*helm\\b"
        "^\\*swiper\\*$"))

;; setup emacsclient
;;
;; commands to setup gconf:
;; gconftool-2 -s /desktop/gnome/url-handlers/org-protocol/command '/usr/bin/emacsclient %s' --type String
;; gconftool-2 -s /desktop/gnome/url-handlers/org-protocol/enabled --type Boolean true
;; (server-start)
;; (add-to-list 'load-path "~/Dropbox/Org")
;; (require 'org-protocol)

(require `org-trello)


;; load mermaid graph editor
(setenv "PATH" (concat "/home/schelcj/Downloads/node-v10.15.3-linux-x64/bin" ":" (getenv "PATH")))
(require 'mermaid-mode)
(setq mermaid-mmdc-location "/home/schelcj/node_modules/.bin/mmdc")
;; (require 'ob-mermaid)
;; (setq ob-mermaid-cli-path "/home/schelcj/node_modules/.bin/mmdc")

;; GTD setup following
;; https://www.labri.fr/perso/nrougier/GTD/index.html
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c j") 'org-journal-new-entry)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Hide tags in org-agenda todo search results
;; (setq org-agenda-hide-tags-regexp ".")
