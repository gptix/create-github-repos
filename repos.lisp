#|Here's an example curl request calling that endpoint, where TOKEN should be replaced with your OAuth token:

curl -v -H "Authorization: token TOKEN" https://api.github.com/user/repos -d '{"name":"chocolate-lightning"}'
|#

(load "~/quicklisp/setup.lisp"))
(ql:quickload 'drakma)

(drakma:http-request "https://api.github.com/gptix/repos"
                         :method :post
                         :content '{
		     "name": "chocolate-thunder"}
		     )

(defparameter *GITHUB-NAME* "gptix")
(defparameter *GITHUB-API-BASE-URL* "http://api.github.com/")
(defparameter *MY-NEW-GITHUB-REPO-PATH*
  (concatenate  'string  *GITHUB-API-BASE-URL* *GITHUB-NAME* "/repos"))q

  
(defun make-new-repo (proposed-name)
  (drakma:http-request *MY-NEW-GITHUB-REPO-PATH*
		      :method :post
		      :content (make-content-string proposed-name)))

(defun make-content-string (proposed-name)
  (concatenate 'string "{\"name\": " proposed-name "}\""))


(make-new-repo "chocolate-thunder")
