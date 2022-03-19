;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :cl-user)

(defpackage open-blackfire/quantum-cloud/ibm-quantum
  (:nicknames obfq/ibm)
  (:use c2cl protocol-phi uri-template yason json-mop simple-config)
  (:export #:*ibmq-server*
           ;; JSON Serialization Objects
           #:check
           #:health-response
           #:hub
           #:backend
           #:object-storage-info
           #:hub-info-hub
           #:hub-info-group
           #:hub-info-project
           #:hub-info
           #:run-job-response
           #:job-input
           #:object-storage-url
           #:job
           #:job-data-uploaded-response
           #:info-queue
           #:job-status
           #:parameter
           #:device-props-gate
           #:qubit
           #:device-properties
           #:job-update
           #:gate
           #:hamiltonian
           #:u-channel-lo
           #:device
           #:cmd-def
           #:discriminator
           #:meas-kernel
           #:pulse
           #:device-defaults
           #:jobs-limit
           #:backend-status
           #:booking-hub-info-hub
           #:booking-hub-info-group
           #:booking-hub-info-project
           #:booking-hub-info
           #:booking
           #:date
           #:access-token
           #:api-token
           #:urls
           #:user
           #:version-response
           ;; Request Methods
           #:get-user-bookings
           #:get-device-bookings-by-backend-name
           #:get-my-jobs-statuses-from-project-versioned
           #:get-my-jobs-statuses-from-project
           #:cancel-job
           #:job-data-uploaded
           #:get-job-download-url
           #:get-job-upload-url
           #:get-job-properties
           #:get-result-download-url
           #:job-result-downloaded
           #:get-job-status-versioned
           #:get-job-status
           #:get-job-versioned
           #:update-job
           #:get-job
           #:run-job
           #:get-project-devices-with-version
           #:get-device-with-specific-configuration-by-backend-name-by-name-hub
           #:get-jobs-limit
           #:get-device-properties
           #:get-device-queue-status
           #:all-hubs-as-collaborator
           #:health
           #:login-with-api-token
           #:me
           #:version))

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
