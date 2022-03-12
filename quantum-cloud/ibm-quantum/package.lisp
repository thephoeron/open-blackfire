;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :cl-user)

(defpackage open-blackfire/quantum-cloud/ibm-quantum
  (:nicknames obfq/ibm)
  (:use cl protocol-phi uri-template)
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

;; IIRC, I think users have to configure the server as well as their API Key
;; manually, will check this. But for now a sensible default.
(defparameter *ibmq-server* "https://runtime-us-east.quantum-computing.ibm.com")

;; DEPRECATE
;; I don't think I actually need this function. URI-TEMPLATE automatically
;; captures lexical bindings in template expansion, so I should be able to just
;; add the URI head as another template variable in the Dexador request form
(defun ibmq-route (route-string &key &allow-other-keys)
  "Generate a fully resolved URI for a REST API call from a route template string and arbitrary keyword parameters."
  (let ((server-url *ibmq-server*))
    #U{server-url}{route-string}))
