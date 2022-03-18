;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod get-user-bookings ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-device-bookings-by-backend-name ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-my-jobs-statuses-from-project-versioned ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-my-jobs-statuses-from-project ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod cancel-job ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod job-data-uploaded ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-job-download-url ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-job-upload-url ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-job-properties ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-result-download-url ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod job-result-downloaded ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-job-status-versioned ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-job-status ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-job-versioned ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod update-job ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-job ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod run-job ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-project-devices-with-version ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-device-with-specific-configuration-by-backend-name-by-name-hub ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-jobs-limit ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-device-properties ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod get-device-queue-status ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod all-hubs-as-collaborator ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod health ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod login-with-api-token ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:post )
    (json-to-clos response-body 'json-object)))

(defmethod me ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))

(defmethod version ()
  ""
  (multiple-value-bind (response-body response-status response-headers response-uri response-stream)
      (dex:request uri :method :get)
    (json-to-clos response-body 'json-object)))
