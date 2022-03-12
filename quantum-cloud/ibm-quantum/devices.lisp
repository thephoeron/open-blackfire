;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/quantum-cloud/ibm-quantum)

(defmethod list-devices ()
  "Returns a list of all the devices your service instance has access to."
  (dex:get #U{*ibmq-server*}/devices))

(defmethod get-device-properties (device-id)
  "Returns the properties for the specified device."
  (dex:get #U{*ibmq-server*}/devices/{device-id}/properties))

(defmethod get-device-configuration (device-id)
  "Returns the configuration for the specified device."
  (dex:get #U{*ibmq-server*}/devices/{device-id}/configuration))

(defmethod get-device-status (device-id)
  "Returns the status for the specified device ID."
  (dex:get #U{*ibmq-server*}/devices/{device-id}/status))

(defmethod get-device-defaults (device-id)
  "Returns the defaults for the specified device."
  (dex:get #U{*ibmq-server*}/devices/{device-id}/defaults))
