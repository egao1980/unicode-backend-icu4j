(in-package #:unicode-backend-icu4j)

#+abcl
(progn
  (defmethod backend-binary-property-p ((backend icu4j-backend) code-point property)
    (declare (ignore backend))
    (icu:has-binary-property-p code-point property))

  (defmethod backend-int-property ((backend icu4j-backend) code-point property)
    (declare (ignore backend))
    (icu:int-property code-point property))

  (defmethod backend-script-extensions ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:script-extensions code-point))

  (defmethod backend-char-name ((backend icu4j-backend) code-point &key (choice :unicode))
    (declare (ignore backend))
    (icu:char-name code-point :choice choice))

  (defmethod backend-lookup-name ((backend icu4j-backend) name)
    (declare (ignore backend))
    (icu:char-from-name name))

  (defmethod backend-numeric-value ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:numeric-value code-point))

  (defmethod backend-digit-value ((backend icu4j-backend) code-point &key (radix 10))
    (declare (ignore backend))
    (icu:digit-value code-point :radix radix))

  (defmethod backend-mirror-char ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:char-mirror code-point))

  (defmethod backend-age ((backend icu4j-backend) code-point)
    (declare (ignore backend))
    (icu:char-age code-point))

  (defmethod backend-property-value-name ((backend icu4j-backend) property value &key short)
    (declare (ignore backend))
    (cond
      ((integerp value)
       (or (icu:property-value-name property value :short short)
           (princ-to-string value)))
      ((keywordp value)
       (string-downcase (symbol-name value)))
      (t (princ-to-string value))))
) ; progn
