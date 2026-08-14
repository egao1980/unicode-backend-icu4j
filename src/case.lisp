(in-package #:unicode-backend-icu4j)

#+abcl
(progn
  (defmethod backend-simple-casefold ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:simple-fold-case code-point))

  (defmethod backend-simple-downcase ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:simple-to-lower code-point))

  (defmethod backend-simple-upcase ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:simple-to-upper code-point))

  (defmethod backend-simple-titlecase ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:simple-to-title code-point))

  (defmethod backend-casefold ((backend icu4j-backend) string &key)
    (backend-normalize backend string :nfkc-casefold))

  (defmethod backend-downcase ((backend icu4j-backend) string &key)
    (declare (ignore backend))
    (icu:to-lower string))

  (defmethod backend-upcase ((backend icu4j-backend) string &key)
    (declare (ignore backend))
    (icu:to-upper string))

  (defmethod backend-titlecase ((backend icu4j-backend) string &key)
    (declare (ignore backend))
    (icu:to-title string))
)
