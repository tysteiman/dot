(provide 'my-s3)

;; Variables
(defvar my--s3-buckets '((:name "notes" :path "~/notes" :bucket "tyler-steiman-notes"))
  "plist of s3 buckets to sync.

:name The display name of the bucket.
:path The local filepath to sync to.
:bucket The s3 bucket to sync to")

;; Functions
(defun my--s3-buckets-sync (direction)
  "Sync all configured S3 buckets in `my--s3-buckets' from LOCAL to REMOTE or REMOTE to LOCAL based on `direction'.

`direction' value of 'download' will do exactly that, same with `upload'"
  (dolist (dir my--s3-buckets)
    (let ((name (plist-get dir :name))
          (path (expand-file-name (plist-get dir :path)))
          (bucket (plist-get dir :bucket)))
      (async-shell-command
       (if (string= direction "upload")
           (format "aws s3 sync %s s3://%s" path bucket)
         (format "aws s3 sync s3://%s %s" bucket path))
       "*aws s3 sync*"))))

(defun my/s3-buckets-upload ()
  "Sync all configured S3 buckets in `my--s3-buckets' from LOCAL to REMOTE (upload)."
  (interactive)
  (my--s3-buckets-sync "upload"))

(defun my/s3-buckets-download ()
  "Sync all configured S3 buckets in `my--s3-buckets' from REMOTE to LOCAL (download)."
  (interactive)
  (my--s3-buckets-sync "download"))

;; Keybindings
(global-set-key (kbd "C-c n u") 'my/s3-buckets-upload)
(global-set-key (kbd "C-c n d") 'my/s3-buckets-download)

;; Display the buffer buffer at the bottom of the screen
(add-to-list 'display-buffer-alist
             '("*aws s3 sync*"
               (display-buffer-in-side-window)
               (side . bottom)
               (slot . -1)
               (window-height . 0.20)))
