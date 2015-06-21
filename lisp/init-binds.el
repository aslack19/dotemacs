;;─────────────────────────────────────────────────────────────────────────────
;; Jump to other buffers
;;─────────────────────────────────────────────────────────────────────────────


(global-set-key (kbd "C-M-<left>") 'windmove-left)
(global-set-key (kbd "C-M-<right>") 'windmove-right)
(global-set-key (kbd "C-M-<up>") 'windmove-up)
(global-set-key (kbd "C-M-<down>") 'windmove-down)


;;─────────────────────────────────────────────────────────────────────────────
;; Add a consistent behavior when jumping paragraphs both backward and forward
;;─────────────────────────────────────────────────────────────────────────────


(defun me/goto-previous-block ()
  "Jump to previous paragraph."

  (interactive)
  (skip-chars-backward "\n")
  (when (not (search-backward-regexp "\n[[:blank:]]*\n" nil t)) (goto-char (point-min)))
  (skip-chars-forward "\n"))


(defun me/goto-next-block ()
  "Jump to next paragraph."

  (interactive)
  (skip-chars-forward "\n")
  (when (not (search-forward-regexp "\n[[:blank:]]*\n" nil t)) (goto-char (point-max)))
  (skip-chars-forward "\n"))


(global-set-key (kbd "<C-up>") 'me/goto-previous-block)
(global-set-key (kbd "<C-down>") 'me/goto-next-block)


;;─────────────────────────────────────────────────────────────────────────────
;; Add ways to swap lines around point
;;─────────────────────────────────────────────────────────────────────────────


(defun me/move-line-up ()
  "Move up the current line under point."

  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))


(defun me/move-line-down ()
  "Move down the current line under point."

  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


(global-set-key (kbd "<M-up>") 'me/move-line-up)
(global-set-key (kbd "<M-down>") 'me/move-line-down)


;;─────────────────────────────────────────────────────────────────────────────
;; End of init-binds.el
;;─────────────────────────────────────────────────────────────────────────────


(provide 'init-binds)