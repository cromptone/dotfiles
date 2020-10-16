;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq doom-font (font-spec :family "Hasklig"))
(setq doom-theme 'doom-laserwave)

(after! org-roam
        (setq org-roam-directory "~/zett"
              org-agenda-files (list "~/zett")
              deft-directory org-roam-directory
              deft-recursive t
              org-roam-graph-viewer nil
              org-ellipsis " ▾▾▾ "
              org-lowest-priority ?D
              org-default-priority ?D
              org-priority-faces '((?A . (:foreground "red" :weight bold))
                                   (?B . (:foreground "orange"))
                                   (?C . (:foreground "yellow"))
                                   (?D . (:foreground "green"))))
        (setq org-roam-capture-templates
              '(("d" "default" plain (function org-roam--capture-get-point)
                     :file-name "%<%Y-%m-%d>-${slug}"
                     :head "#+TITLE: ${title}\n#+roam_tags: ${TAGS}\n\n"
                     :unnarrowed t)
                ("p" "person" plain (function org-roam--capture-get-point)
                     :file-name "%<%Y-%m-%d>-${slug}"
                     :head "#+TITLE: ${title}\n#+roam_tags: person ${TAGS}\n\n"
                     :unnarrowed t))))

(after! avy
        (setq avy-all-windows t))

(use-package! org-fancy-priorities
              :hook (org-mode . org-fancy-priorities-mode)
              :config (setq org-fancy-priorities-list '("⚑" "⬆" "⬇" "☕")))

(setq display-line-numbers-type t)
(setq projectile-project-search-path '("~/Documents/GitHub/"))

(setenv "WORKON_HOME" (concat (getenv "CONDA_PREFIX") "/envs"))

(setq linum-format "%4d \u2502 ")

(setq ein:notebook-autosave-frequency 10)

(custom-set-faces
 '(ein:cell-input-area ((t (:background "#042028"))))
 '(ein:cell-input-prompt ((t (:inherit header-line :background "#002b35" :foreground "#859900" :inverse-video nil :weight bold))))
 '(ein:cell-output-prompt ((t (:inherit header-line :background "#002b35" :foreground "#dc322f" :inverse-video nil :weight bold)))))
