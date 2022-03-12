;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod list-jobs ()
  "List the quantum program jobs you have run."
  (dex:get #U{*ibmq-server*}/jobs))

(defmethod create-job ()
  "Run a quantum program. Note the returned job ID.  You will use it to check the job's status and review results."
  (dex:post #U{*ibmq-server*}/jobs))

(defmethod get-job-details (job-id)
  "List the details about the specified quantum program job."
  (dex:get #U{*ibmq-server*}/jobs/{job-id}))

(defmethod delete-job (job-id)
  "Delete the specified job."
  (dex:delete #U{*ibmq-server*}/jobs/{job-id}))

(defmethod get-job-results (job-id)
  "Return the final result from this job."
  (dex:get #U{*ibmq-server*}/jobs/{job-id}/results))

(defmethod get-job-interim-results (job-id)
  "Return the interim results from this job. Interim results are kept two days after the job has finished running."
  (dex:get #U{*ibmq-server*}/jobs/{job-id}/interim-results))

(defmethod get-job-logs (job-id)
  "List all job logs for the specified job."
  (dex:get #U{*ibmq-server*}/jobs/{job-id}/logs))

(defmethod cancel-job (job-id)
  "Cancels the specified job."
  (dex:post #U{*ibmq-server*}/jobs/{job-id}/cancel))

(defmethod get-job-results-stream (job-id)
  "Get a result stream as the job runs using WebSocket."
  (dex:get #U{*ibmq-server*}/stream/jobs/{job-id}))
