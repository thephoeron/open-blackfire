;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :cl-user)

(defpackage open-blackfire/protocol-phi
  (:nicknames blackfire/protocol-phi
              protocol-phi
              phi)
  (:use c2cl)
  (:export ;; quantum objects
           #:blackfire-class
           #:blackfire-object
           #:quantum-object
           #:quantum-state
           #:quantum-state-space
           #:quantum-operator
           #:quantum-operation
           #:quantum-system
           ;; quantum functors
           #:adjoint
           #:controlled
           #:hermitian
           #:quantum-chaotic
           #:doubled
           #:double-controlled
           #:controlled-adjoint
           ;; quantum operations
           #:unitary #:u
           #:quantum-not #:qnot
           #:pauli-x #:x
           #:pauli-y #:y
           #:pauli-z #:z
           #:controlled-not #:cnot
           #:square-root-of-not #:srn
           #:nand
           #:hadamard #:h
           #:u-theta
           #:controlled-phase #:cphase
           #:u2
           #:swap
           #:id
           #:u[0]
           #:u[1]
           #:u[2]
           #:u[3]
           #:rotation
           #:r[x]
           #:r[y]
           #:r[z]
           #:t-gate #:pi/8
           #:adjoint-pi/8 #:t-dagger #:tdg
           #:s-gate #:pi/4
           #:adjoint-pi/4 #:s-dagger #:sdg
           #:sqrt-swap
           #:controlled-hadamard #:ch
           #:controlled-pauli-x #:cx
           #:controlled-pauli-y #:cy
           #:controlled-pauli-z #:cz
           #:toffoli #:ccnot
           #:fredkin #:cswap
           #:ising
           #:deutsch #:d-theta
           #:barenco #:b[3]
           #:measure #:m
           #:non-demolition-measurement #:ndm))

(in-package :open-blackfire/protocol-phi)
