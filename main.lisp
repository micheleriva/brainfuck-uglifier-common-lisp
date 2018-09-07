(defun uglify (file)
  (let ((backup-file (concatenate 'string file "./test/test.bf")))
    (my-copy-file file backup-file)
    (with-open-file (in-stream backup-file)
      (with-open-file (out-stream file :direction :output :if-exists :supersede)
        (loop for line = (read-line in-stream nil)
           while line do
             (write-line (cl-ppcre:regex-replace-all "[^\.|,|\+|<|>|\-|\[|\]]" line "") out-stream))))))