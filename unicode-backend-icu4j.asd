(defsystem "unicode-backend-icu4j"
  :version "0.1.0"
  :description "unicode-protocol backend over cl-stack-icu4j (ICU4J / ABCL)"
  :author "egao1980"
  :license "MIT"
  :depends-on ("unicode-protocol" "cl-stack-icu4j")
  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "backend")
               (:file "properties")
               (:file "normalize")
               (:file "case")
               (:file "idna")
               (:file "break")
               (:file "uset"))
  :in-order-to ((test-op (test-op "unicode-backend-icu4j/tests")))
  :properties
  (:cl-repo (:provides ("unicode-backend-icu4j"))))

(defsystem "unicode-backend-icu4j/tests"
  :depends-on ("unicode-backend-icu4j" "rove")
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "backend-test")
               (:file "properties-test")
               (:file "normalize-test")
               (:file "case-test")
               (:file "idna-test")
               (:file "break-test")
               (:file "uset-test"))
  :perform (test-op (o c)
             (unless (symbol-call :rove :run c)
               (error "tests failed for ~A" (component-name c)))))
