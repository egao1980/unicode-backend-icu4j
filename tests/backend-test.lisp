;;;; Smoke + capability registry.

(in-package #:unicode-backend-icu4j/tests)

#+abcl
(deftest backend-installed
  (ok (typep *unicode-backend* 'icu4j-backend))
  (dolist (cap '(:properties :normalize :nfkc-casefold :casefold :idna
                 :script :emoji :char-name :breaks :uset))
    (ok (member cap (backend-capabilities *unicode-backend*))
        (format nil "capability ~s" cap))))

#-abcl
(deftest skip-non-abcl
  (ok t "non-ABCL: skip"))
