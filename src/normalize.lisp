(in-package #:unicode-backend-icu4j)

#+abcl
(progn
  (defmethod backend-normalize ((backend icu4j-backend) string form)
    (declare (ignore backend))
    (icu:normalize string form))

  (defmethod backend-normalized-p ((backend icu4j-backend) string form)
    (declare (ignore backend))
    (icu:normalized-p string form))

  (defmethod backend-quick-check ((backend icu4j-backend) string form)
    (declare (ignore backend))
    (icu:quick-check string form))

  (defmethod backend-normalization-boundary-before-p ((backend icu4j-backend) code-point form)
    (declare (ignore backend))
    (icu:has-boundary-before-p code-point form))

  (defmethod backend-normalization-boundary-after-p ((backend icu4j-backend) code-point form)
    (declare (ignore backend))
    (icu:has-boundary-after-p code-point form))

  (defmethod backend-raw-decomposition ((backend icu4j-backend) code-point form)
    (declare (ignore backend))
    (icu:raw-decomposition code-point form))
)
