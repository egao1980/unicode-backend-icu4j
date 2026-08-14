(in-package #:unicode-backend-icu4j)

#+abcl
(progn
  (defmethod backend-idna-name-to-ascii ((backend icu4j-backend) name &key options)
    (declare (ignore backend))
    (icu:idna-name-to-ascii name :options options))

  (defmethod backend-idna-name-to-unicode ((backend icu4j-backend) name &key options)
    (declare (ignore backend))
    (icu:idna-name-to-unicode name :options options))

  (defmethod backend-idna-label-to-ascii ((backend icu4j-backend) label &key options)
    (declare (ignore backend))
    (icu:idna-label-to-ascii label :options options))

  (defmethod backend-idna-label-to-unicode ((backend icu4j-backend) label &key options)
    (declare (ignore backend))
    (icu:idna-label-to-unicode label :options options))

  (defmethod backend-idna-map ((backend icu4j-backend) string &key std3 transitional)
    (let ((opts '()))
      (when std3 (push :std3 opts))
      (when transitional (push :transitional opts))
      (backend-idna-name-to-unicode backend string :options opts)))
)
