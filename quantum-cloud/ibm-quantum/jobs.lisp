;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod list-jobs ()
  "List the quantum program jobs you have run."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/jobs :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'jobs-response))
      (400 (json-to-clos body 'error-container))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod create-job ()
  "Run a quantum program. Note the returned job ID.  You will use it to check the job's status and review results."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:post #U{*ibmq-server*}/jobs :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-close body 'job-create-response))
      (400 (json-to-clos body 'error-container))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod get-job-details (job-id)
  "List the details about the specified quantum program job."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/jobs/{job-id} :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 (json-to-clos body 'job-response))
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod delete-job (job-id)
  "Delete the specified job."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:delete #U{*ibmq-server*}/jobs/{job-id} :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (204 t)
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod get-job-results (job-id)
  "Return the final result from this job."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/jobs/{job-id}/results :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 body)
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod get-job-interim-results (job-id)
  "Return the interim results from this job. Interim results are kept two days after the job has finished running."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/jobs/{job-id}/interim-results :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 body)
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod get-job-logs (job-id)
  "List all job logs for the specified job."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/jobs/{job-id}/logs :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (200 body)
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      (410 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod cancel-job (job-id)
  "Cancels the specified job."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:post #U{*ibmq-server*}/jobs/{job-id}/cancel :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      (204 t)
      (401 (json-to-clos body 'error-container))
      (403 (json-to-clos body 'error-container))
      (404 (json-to-clos body 'error-container))
      ;; Job is a non-cancellable status
      (409 (json-to-clos body 'error-container))
      (otherwise nil))))

(defmethod get-job-results-stream (job-id)
  "Get a result stream as the job runs using WebSocket."
  (multiple-value-bind (body status response-headers uri stream)
      (dex:get #U{*ibmq-server*}/stream/jobs/{job-id} :headers (list (cons "x-access-token" *ibmq-api-key*)))
    (case status
      ;; this should be a WebSocket stream
      (200 body)
      ;; Found, also returns a WebSocket stream
      (303 (json-to-clos body 'error-container))
      ;; Unauthorized
      (401 (json-to-clos body 'error-container))
      ;; Internal server error
      (500 (json-to-clos body 'error-container))
      ;; In case of total failure, return NIL
      (otherwise nil))))
