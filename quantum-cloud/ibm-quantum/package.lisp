;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :cl-user)

(defpackage open-blackfire/quantum-cloud/ibm-quantum
  (:nicknames obfq/ibm)
  (:use cl protocol-phi uri-template yason json-mop simple-config)
  (:export #:*ibmq-server*
           ;; Component Objects
           #:program-create
           #:program-response
           #:programs-response
           #:program-metadata
           #:program-update
           #:job-run-params
           #:job-response
           #:job-create-response
           #:jobs-response
           #:job-status
           #:job-state
           #:error-container
           #:devices-response
           #:device-properties-response
           #:device-configuration-response
           #:device-defaults-response
           #:device-status-response
           ;; Auth Methods
           #:clear-authorization-cache
           ;; Program Methods
           #:create-program
           #:list-programs
           #:get-program
           #:delete-program
           #:update-program
           #:update-program-data
           #:set-program-public
           #:set-program-private
           ;; Job Methods
           #:list-jobs
           #:create-job
           #:get-job-details
           #:delete-job
           #:get-job-results
           #:get-job-interim-results
           #:get-job-logs
           #:cancel-job
           #:get-job-results-stream
           ;; Device Methods
           #:list-devices
           #:get-device-properties
           #:get-device-configuration
           #:get-device-status
           #:get-device-defaults))

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(enable-uri-template-syntax)

;; Load BLACKFIRE config file
(load-config "~/.blackfirerc")

;; Update base to new IBM Quantum v2 URL
(defparameter *ibmq-server* "api.quantum-computing.ibm.com")

;; Define IBM Quantum API Key from BLACKFIRE config file
(defparameter *ibmq-api-key* (format nil "apiKey ~A" (config :ibmq)))

;; Some YASON configuration
(setf yason:*parse-json-booleans-as-symbols* t
      yason:*parse-json-null-as-keyword* t
      yason:*parse-object-key-fn* #'cl-strings:kebab-case)
