(defun generate-components (n)
  (cons '(:file "main")
        (loop for i from 1 to n
              collect `(:file ,(format nil "day~2,'0d" i)))))


(defsystem "advent"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ("alexandria" "serapeum" "arrow-macros" "split-sequence")
  :components ((:module "src"
                :components #.(generate-components 1)))
  ;; ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "advent/tests"))))

(defsystem "advent/tests"
  :author ""
  :license ""
  :depends-on ("advent"
               "fiveam")
  :components ((:module "tests"
                :components #.(generate-components 1)))
  :description "Test system for advent"
  :perform (test-op (op c) (symbol-call :fiveam :run!
                                        (find-symbol* :advent :advent/tests))))
