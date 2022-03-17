;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :cl-user)

(defpackage open-blackfire/quantum-cloud/ibm-quantum
  (:nicknames obfq/ibm)
  (:use c2cl protocol-phi uri-template yason json-mop simple-config)
  (:export #:*ibmq-server*))

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(enable-uri-template-syntax)

;; Load BLACKFIRE config file
(load-config "~/.blackfirerc")

;; Update base to new IBM Quantum v2 URL
(defparameter *ibmq-server* "api.quantum-computing.ibm.com")

;; Define IBM Quantum API Key from BLACKFIRE config file
(defparameter *ibmq-api-key* (format nil "apiKey ~A" (config :ibmq)))

;; IBM Quantum API v2 requires a session-based access token, so all requests
;; need to check this value, set it to NIL if expired, and if expired or NIL,
;; use the login endpoint to get a fresh access token object
(defparameter *ibmq-access-token* nil)

;; Some YASON configuration
(setf yason:*parse-json-booleans-as-symbols* t
      yason:*parse-json-null-as-keyword* t
      yason:*parse-object-key-fn* #'cl-strings:kebab-case)
