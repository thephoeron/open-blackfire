;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defclass check ()
  ((name :json-type :string)
   (status :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass health-response ()
  ((status :json-type :string)
   (checks :json-type (:list check)))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub ()
  ((name :json-key "name" :json-type :string)
   (title :json-key "title" :json-type :string)
   (description :json-key "description" :json-type :string)
   (creation-date :json-key "creationDate" :json-type :string)
   (deleted-p :json-key "deleted" :json-type :bool)
   (ui :json-key "ui" :json-type :hash-table)
   (groups :json-key "groups" :json-type :hash-table)
   (private-p :json-key "private" :json-type :bool)
   (license-not-required-p :json-key "licenseNotRequired" :json-type :bool)
   (default-p :json-key "isDefault" :json-type :bool))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass backend ()
  ((name :json-key "name" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass object-storage-info ()
  ((download-q-object-url-endpoint :json-key "downloadQObjectUrlEndpoint" :json-type :string)
   (upload-qobject-url-endpoint :json-key "uploadQobjectUrlEndpoint" :json-type :string)
   (upload-url :json-key "uploadUrl" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info-hub ()
  ((name :json-key "name" :json-type :string)
   (priority :json-key "priority" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info-group ()
  ((name :json-key "name" :json-type :string)
   (priority :json-key "priority" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info-project ()
  ((name :json-key "name" :json-type :string)
   (priority :json-key "priority" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hub-info ()
  ((hub :json-key "hub" :json-type hub-info-hub)
   (group :json-key "group" :json-type hub-info-group)
   (project :json-key "project" :json-type hub-info-project))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass run-job-response ()
  ((id :json-key "id" :json-type :string)
   (kind :json-key "kind" :json-type :string)
   (seed :json-key "seed" :json-type :string)
   (backend :json-key "backend" :json-type backend)
   (status :json-key "status" :json-type :string)
   (creation-date :json-key "creationDate" :json-type :string)
   (object-storage-info :json-key "objectStorageInfo" :json-type object-storage-info)
   (allow-object-storage :json-key "allowObjectStorage" :json-type :bool)
   (summary-data :json-key "summaryData" :json-type :hash-table)
   (summary :json-key "summary" :json-type :hash-table)
   (time-per-step :json-key "timePerStep" :json-type :hash-table)
   (run-error :json-key "error" :json-type :hash-table)
   (ip :json-key "ip" :json-type :hash-table)
   (hub-info :json-key "hubInfo" :json-type hub-info)
   (name :json-key "name" :json-type :string)
   (tags :json-key "tags" :json-type (:list :string))
   (end-date :json-key "endDate" :json-type :string)
   (cost :json-key "cost" :json-type :number)
   (share-level :json-key "shareLevel" :json-type :string)
   (user-id :json-key "userId" :json-type :string)
   (run-mode :json-key "runMode" :json-type :string)
   (experiment-tag :json-key "experimentTag" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-input ()
  ((allow-object-storage :json-key "allowObjectStorage" :json-type :bool)
   (backend :json-key "backend" :json-type backend)
   (share-level :json-key "shareLevel" :json-type :string)
   (name :json-key "name" :json-type :string)
   (tags :json-key "tags" :json-type (:list :string))
   (experiment-tag :json-key "experimentTag" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass object-storage-url ()
  ((url :json-key "url" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job ()
  ((id :json-key "id" :json-type :string)
   (kind :json-key "kind" :json-type :string)
   (backend :json-key "backend" :json-type backend)
   (status :json-key "status" :json-type :string)
   (creation-date :json-key "creationDate" :json-type :string)
   (summary-data :json-key "summaryData" :json-type :hash-table)
   (time-per-step :json-key "timePerStep" :json-type :hash-table)
   (job-error :json-key "error" :json-type :hash-table)
   (ip :json-key "ip" :json-type :hash-table)
   (hub-info :json-key "hubInfo" :json-type hub-info)
   (name :json-key "name" :json-type :string)
   (tags :json-key "tags" :json-type (:list :string))
   (end-date :json-key "endDate" :json-type :string)
   (cost :json-key "cost" :json-type :number)
   (share-level :json-key "shareLevel" :json-type :string)
   (user-id :json-key "userId" :json-type :string)
   (run-mode :json-key "runMode" :json-type :string)
   (experiment-tag :json-key "experimentTag" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-data-uploaded-response ()
  ((job :json-key "job" :json-type job))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass info-queue ()
  ((status :json-key "status" :json-type :string)
   (queue-position :json-key "position" :json-type :number)
   (hub-priority :json-key "hubPriority" :json-type :number)
   (group-priority :json-key "groupPriority" :json-type :number)
   (project-priority :json-key "projectPriority" :json-type :number)
   (estimated-start-time :json-key "estimatedStartTime" :json-type :string)
   (estimated-complete-time :json-key "estimatedCompleteTime" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-status ()
  ((status :json-key "status" :json-type :string)
   (kind :json-key "kind" :json-type :string)
   (creation-date :json-key "creationDate" :json-type :string)
   (end-date :json-key "endDate" :json-type :string)
   (id :json-key "id" :json-type :string)
   (backend :json-key "backend" :json-type backend)
   (name :json-key "name" :json-type :string)
   (tags :json-key "tags" :json-type (:list :string))
   (hub-info :json-key "hubInfo" :json-type hub-info)
   (share-level :json-key "shareLevel" :json-type :string)
   (info-queue :json-key "infoQueue" :json-type info-queue)
   (experiment-tag :json-key "experimentTag" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass parameter ()
  ((date :json-key "date" :json-type :string)
   (name :json-key "name" :json-type :string)
   (unit :json-key "unit" :json-type :string)
   (value :json-key "value" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device-props-gate ()
  ((gate :json-key "gate" :json-type :string)
   (name :json-key "name" :json-type :string)
   (parameters :json-key "parameters" :json-type (:list parameter))
   (qubits :json-key "qubits" :json-type (:vector :number)))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass qubit ()
  ((date :json-key "date" :json-type :string)
   (name :json-key "name" :json-type :string)
   (unit :json-key "unit" :json-type :string)
   (value :json-key "value" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device-properties ()
  ((backend-name :json-key "backend_name" :json-type :string)
   (last-update-date :json-key "last_update_date" :json-type :string)
   (backend-version :json-key "backend_version" :json-type :string)
   (gates :json-key "gates" :json-type (:list device-props-gate))
   (qubits :json-key "qubits" :json-type (:list (:vector qubit)))
   (general :json-key "general" :json-type (:list qubit)))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass job-update ()
  ((name :json-key "name" :json-type :string)
   (tags :json-key "tags" :json-type (:list :string))
   (experiment-tag :json-key "experimentTag" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass gate ()
  ((coupling-map :json-key "coupling_map" :json-type (:list (:vector :number)))
   (name :json-key "name" :json-type :string)
   (parameters :json-key "parameters" :json-type (:list :string))
   (qasm-def :json-key "qasm_def" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass hamiltonian ()
  ((description :json-key "description" :json-type :string)
   (h-latex :json-key "h_latex" :json-type :string)
   (h-str :json-key "h_str" :json-type (:list :string))
   (osc :json-key "osc" :json-type :hash-table)
   (vars :json-key "vars" :json-type :hash-table))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass u-channel-lo ()
  ((q :json-key "q" :json-type :number)
   (scale :json-key "scale" :json-type (:vector :number)))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device ()
  ((allow-q-object-p :json-key "allow_q_object" :json-type :bool)
   (backend-name :json-key "backend_name" :json-type :string)
   (backend-version :json-key "backend_version" :json-type :string)
   (n-qubits :json-key "n_qubits" :json-type :number)
   (basis-gates :json-key "basis_gates" :json-type (:list :string))
   (gates :json-key "gates" :json-type (:list gate))
   (local-p :json-key "local" :json-type :bool)
   (simulator-p :json-key "simulator" :json-type :bool)
   (conditional-p :json-key "conditional" :json-type :bool)
   (open-pulse-p :json-key "open_pulse" :json-type :bool)
   (memory-p :json-key "memory" :json-type :bool)
   (max-shots :json-key "max_shots" :json-type :number)
   (coupling-map :json-key "coupling_map" :json-type (:list (:vector :number)))
   (n-uchannels :json-key "n_uchannels" :json-type :number)
   (u-channel-lo :json-key "u_channel_lo" :json-type (:list (:vector u-channel-lo)))
   (meas-levels :json-key "meas_levels" :json-type (:list :number))
   (qubit-lo-range :json-key "qubit_lo_range" :json-type (:list (:vector :number)))
   (meas-lo-range :json-key "meas_lo_range" :json-type (:list (:vector :number)))
   (dt :json-key "dt" :json-type :number)
   (dtm :json-key "dtm" :json-type :number)
   (rep-times :json-key "rep_times" :json-type (:list :number))
   (meas-kernels :json-key "meas_kernels" :json-type (:list :string))
   (discriminators :json-key "discriminators" :json-type (:list :string))
   (credits-required-p :json-key "credits_required" :json-type :bool)
   (description :json-key "description" :json-type :string)
   (hamiltonian :json-key "hamiltonian" :json-type hamiltonian)
   (max-experiments :json-key "max_experiments" :json-type :number)
   (meas-map :json-key "meas_map" :json-type (:list (:vector :number)))
   (n-registers :json-key "n_registers" :json-type :number)
   (online-date :json-key "online_date" :json-type :string)
   (sample-name :json-key "sample_name" :json-type :string)
   (url :json-key "url" :json-type :string)
   (allow-q-circuit-p :json-key "allow_q_circuit" :json-type :bool)
   (allow-object-storage-p :json-key "allow_object_storage" :json-type :bool))
  (:metaclass json-serializable-class)
  (:documentation ""))

;; This JSON Serialization Object looks like it's gonna cause some trouble.
;; Note the VECTOR over HASH-TABLE JSON-Type
(defclass cmd-def ()
  ((name :json-key "name" :json-type :string)
   (qubits :json-key "qubits" :json-type (:vector :number))
   (cmd-sequence :json-key "sequence" :json-type (:vector :hash-table)))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass discriminator ()
  ((name :json-key "name" :json-type :string)
   (params :json-key "params" :json-type :hash-table))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass meas-kernel ()
  ((name :json-key "name" :json-type :string)
   (params :json-key "params" :json-type :hash-table))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass pulse ()
  ((name :json-key "name" :json-type :string)
   (samples :json-key "samples" :json-type (:vector (:vector :number))))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass device-defaults ()
  ((buffer :json-key "buffer" :json-type :number)
   (cmd-def :json-key "cmd_def" :json-type (:vector cmd-def))
   (discriminator :json-key "discriminator" :json-type discriminator)
   (meas-freq-est :json-key "meas_freq_est" :json-type (:vector :number))
   (meas-kernel :json-key "meas_kernel" :json-type meas-kernel)
   (pulse-library :json-key "pulse_library" :json-type (:vector pulse))
   (qubit-freq-est :json-key "qubit_freq_est" :json-type (:vector :number)))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass jobs-limit ()
  ((maximum-jobs :json-key "maximumJobs" :json-type :number)
   (running-jobs :json-key "runningJobs" :json-type :number))
  (:metaclass json-serializable-class)
  (:documentation ""))

;; It's objects like this why we can't rely on automatic conversion of symbols
;; to JSON key-names
(defclass backend-status ()
  ((state :json-key "state" :json-type :bool)
   (message :json-key "message" :json-type :string)
   (status :json-key "status" :json-type :bool)
   (length-queue :json-key "lengthQueue" :json-type :number)
   (backend-version :json-key "backend_version" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info-hub ()
  ((name :json-key "name" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info-group ()
  ((name :json-key "name" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info-project ()
  ((name :json-key "name" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking-hub-info ()
  ((hub :json-key "hub" :json-type booking-hub-info-hub)
   (group :json-key "group" :json-type booking-hub-info-group)
   (project :json-key "project" :json-type booking-hub-info-project))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass booking ()
  ((user-id :json-key "userId" :json-type :string)
   (device-id :json-key "deviceId" :json-type :string)
   (hub-info :json-key "hubInfo" :json-type booking-hub-info)
   (creation-date :json-key "creationDate" :json-type :string)
   (initial-date :json-key "initialDate" :json-type :string)
   (end-date :json-key "endDate" :json-type :string)
   (deleted-p :json-key "deleted" :json-type :bool)
   (mode :json-key "mode" :json-type :string)
   (jobs-moved-from-priority-p :json-key "jobsMovedFromPriority" :json-type :bool)
   (id :json-key "id" :json-type :string)
   (backend-name :json-key "backendName" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

;; why is there an empty object defined in the OpenAPI spec? disabling it for now
;  (defclass date ()
;    ()
;    (:metaclass json-serializable-class)
;    (:documentation ""))

(defclass access-token ()
  ((id :json-key "id" :json-type :string)
   (ttl :json-key "ttl" :json-type :number)
   (created :json-key "created" :json-type :string)
   (user-id :json-key "userId" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass api-token ()
  ((api-token :json-key "apiToken" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass urls ()
  ((http :json-key "http" :json-type :string)
   (ws :json-key "ws" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))

;; I'm a little concerned about this object casually including a user's plaintext
;; password. Going to have to handle it in the response processing somehow.
(defclass user ()
  ((id :json-key "id" :json-type :string)
   (email :json-key "email" :json-type :string)
   (username :json-key "username" :json-type :string)
   (password :json-key "password" :json-type :string)
   (user-type :json-key "userType" :json-type :hash-table)
   (first-name :json-key "firstName" :json-type :string)
   (last-name :json-key "lastName" :json-type :string)
   (institution :json-key "institution" :json-type :string)
   (roles :json-key "roles" :json-type (:vector :string))
   (ibm-q-network :json-key "ibmQNetwork" :json-type :bool)
   (urls :json-key "urls" :json-type urls)
   (subscriptions :json-key "subscriptions" :json-type :hash-table)
   (credit :json-key "credit" :json-type :hash-table)
   (needs-refill :json-key "needsRefill" :json-type :bool)
   (email-verified :json-key "emailVerified" :json-type :bool)
   (q-network-roles :json-key "qNetworkRoles" :json-type (:vector :string))
   (can-schedule-backends :json-key "canScheduleBackends" :json-type :bool))
  (:metaclass json-serializable-class)
  (:documentation ""))

(defclass version-response ()
  ((api-public :json-key "api-public" :json-type :string)
   (api-app :json-key "api-app" :json-type :string)
   (api-utils :json-key "api-utils" :json-type :string)
   (api-app-ws :json-key "api-app-ws" :json-type :string)
   (api-auth :json-key "api-auth" :json-type :string)
   (version :json-key "version" :json-type :string))
  (:metaclass json-serializable-class)
  (:documentation ""))
