;; Copyright (c) 2022, "the Phoeron" Colin J.E. Lupton <thephoeron@protonmail.com>
;; Released under the MIT License. See open-blackfire/LICENSE for more information.

(in-package :open-blackfire/protocol-phi)

;;;; === [[ :: QUANTUM FUNCTORS :: ]] ===================================================================================================================== ;;;;

(defgeneric adjoint (quantum-function &rest args)
  (:documentation
    "The ADJOINT Quantum Functor, a composable, higher-order function over Quantum Operators which returns the Adjoint quantum operator for QUANTUM-FUNCTION argument."))

(defgeneric controlled (quantum-function &rest args)
  (:documentation
    "The CONTROLLED Quantum Functor, a composable, higher-order function over Quantum Operators which returns an n-ary Controlled quantum operator for the QUANTUM-FUNCTION argument."))

(defgeneric hermitian (quantum-function &rest args)
  (:documentation "The HERMITIAN Quantum Functor, a composable, higher-order function over Quantum Funcallables which returns the Hermitian variant of the QUANTUM-FUNCTION argument."))

(defgeneric quantum-chaotic (quantum-function &rest args)
  (:documentation "The QUANTUM-CHAOTIC Quantum Functor, a composable, higher-order function over Quantum Funcallables which returns the Quantum-Chaotic variant of the QUANTUM-FUNCTION argument."))

(defgeneric doubled (quantum-function &rest args)
  (:documentation "The DOUBLED Quantum Functor, a composable, higher-order function over Quantum Funcallables which returns the Doubled variant of the QUANTUM-FUNCTION argument."))

(defgeneric double-controlled (quantum-function &rest args)
  (:documentation "The DOUBLE-CONTROLLED Quantum Functor, a composable, higher-order function over Quantum Funcallables which returns the Double-Controlled variant of the QUANTUM-FUNCTION argument."))

(defgeneric controlled-adjoint (quantum-function &rest args)
  (:documentation "The CONTROLLED-ADJOINT Quantum Functor, a composable, higher-order function over Quantum Funcallables which returns the Controlled-Adjoint variant of the QUANTUM-FUNCTION argument."))

;;;; ------------------------------------------------------------------------------------------------------------------------------------------------------ ;;;;
;;;; === QUANTUM OPERATORS ================================================================================================================================ ;;;;

;;;; === [[ :: UNIVERSAL PARAMETERIZED UNITARY QUANTUM OPERATOR :: ]] ===================================================================================== ;;;;

(defgeneric U (quantum-system qubit theta phi lamda)
  (:documentation "U Gate: Universal Parameterized Unitary Quantum Operator."))

(defgeneric unitary (quantum-system quantum-register theta phi lamda)
  (:documentation "Alternate name for Quantum Operator #'U."))

;;;; === [[ :: PAULI-X GATE (aka, QUANTUM-NOT GATE) :: ]] ================================================================================================= ;;;;

(defgeneric pauli-x (quantum-system qubit)
  (:documentation "Pauli-X Gate (1-Qubit): also known as QNOT, the Quantum-NOT Gate.."))

(defgeneric x (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'PAULI-X."))

(defgeneric qnot (quantum-system qubit)
  (:documentation "The 1-Qubit Quantum NOT gate; we redefine it in full here, primarily for the
   debugging advantages."))

(defgeneric quantum-not (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'QNOT."))

;;;; === [[ :: PAULI-Y GATE :: ]] ========================================================================================================================= ;;;;

(defgeneric pauli-y (quantum-system qubit)
  (:documentation "The 1-Qubit Pauli-Y Gate."))

(defgeneric y (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'PAULI-Y."))

;;;; === [[ :: PAULI-Z GATE :: ]] ========================================================================================================================= ;;;;

(defgeneric pauli-z (quantum-system qubit)
  (:documentation "The 1-Qubit Pauli-Z Gate."))

(defgeneric z (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'PAULI-Z."))

;;;; === [[ :: CNOT GATE :: ]] ============================================================================================================================ ;;;;

(defgeneric cnot (quantum-system qubit[0] qubit[1])
  (:documentation "Quantum Controlled-NOT gate"))

(defgeneric controlled-not (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'CNOT."))

;;;; === [[ :: Square-Root of NOT GATE :: ]] ============================================================================================================== ;;;;

(defgeneric square-root-of-not (quantum-system qubit)
  (:documentation "1-Qubit Quantum Square-Root-of-NOT gate"))

(defgeneric srn (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'SQUARE-ROOT-OF-NOT."))

;;;; === [[ :: QUANTUM-NAND GATE :: ]] ==================================================================================================================== ;;;;

(defgeneric nand (quantum-system qubit[0] qubit[1] qubit[2])
  (:documentation "3-Qubit Quantum NAND gate"))

;;;; === [[ :: HADAMARD GATE :: ]] ======================================================================================================================== ;;;;

(defgeneric hadamard (quantum-system qubit)
  (:documentation "1-Qubit Quantum Hadamard gate"))

(defgeneric h (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'HADAMARD."))

;;;; === [[ :: QUANTUM U-THETA (1-Qubit Rotation) GATE :: ]] ============================================================================================== ;;;;

(defgeneric u-theta (quantum-system qubit theta)
  (:documentation "1-qubit Quantum U(theta) rotation gate"))

;;;; === [[ :: QUANTUM CONDITIONAL-PHASE GATE :: ]] ======================================================================================================= ;;;;

(defgeneric controlled-phase (quantum-system qubit[0] qubit[1] alpha)
  (:documentation "Quantum conditional/controlled phase gate"))

(defgeneric cphase (quantum-system quantum-register alpha)
  (:documentation "Alternate name for Quantum Operator #'CONTROLLED-PHASE."))

;;;; === [[ :: QUANTUM U2 (Generalized Rotation) GATE :: ]] =============================================================================================== ;;;;

(defgeneric u2 (quantum-system qubit phi theta psi alpha)
  (:documentation "Quantum U2 (Generalized Rotation) gate."))

;;;; === [[ :: QUANTUM SWAP GATE :: ]] ==================================================================================================================== ;;;;

(defgeneric swap (quantum-system qubit[0] qubit[1])
  (:documentation "A quantum gate that swaps the amplitudes for the two specified qubits."))

;;;; === [[ :: PARAMETRIC UNITARY GATES :: ]] ============================================================================================================= ;;;;

(defgeneric id (quantum-system qubit)
  (:documentation "Quantum Identity Gate"))

(defgeneric u[0] (quantum-system qubit gamma)
  (:documentation "U[0] Gate. Parameter GAMMA is silently ignored. Some of the time... more or less... probably."))

(defgeneric u[1] (quantum-system qubit lamda)
  (:documentation "U[1] Gate."))

(defgeneric u[2] (quantum-system qubit phi lamda)
  (:documentation "U[2] Gate."))

(defgeneric u[3] (quantum-system qubit theta phi lamda)
  (:documentation "U[3] Gate."))

;;;; === [[ :: PARAMETRIC ROTATION GATES :: ]] ============================================================================================================ ;;;;

;;;; Phase shift: $R_{\phi}$

(defgeneric rotation (quantum-system qubit phi)
  (:documentation "R_{\phi} Rotation Gate, a.k.a., phase-shift operator."))

;;;; Standard Rotations

(defgeneric r[x] (quantum-system qubit theta)
  (:documentation "X-Axis Bloch-Sphere Rotation Gate."))

(defgeneric r[y] (quantum-system qubit theta)
  (:documentation "Y-Axis Bloch-Sphere Rotation Gate."))

(defgeneric r[z] (quantum-system qubit phi)
  (:documentation "Z-Axis Bloch-Sphere Rotation Gate."))

;;;; T gate (pi/8)

(defgeneric t-gate (quantum-system quantum-register)
  (:documentation "T-Gate, a.k.a., Quantum Operator #'PI/8."))

(defgeneric pi/8 (quantum-system qubit)
  (:documentation "Quantum Operator {\pi}/8, a.k.a., T-Gate."))

;;;; T^dagger (adjoint pi/8)

(defgeneric adjoint-pi/8 (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'T-DAGGER."))

(defgeneric t-dagger (quantum-system qubit)
  (:documentation "T^{\dagger}-Gate, a.k.a., the Adjoint of {\pi}/8."))

(defgeneric tdg (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'T-DAGGER."))

;;;; S gate (pi/4)

(defgeneric s-gate (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'PI/4."))

(defgeneric pi/4 (quantum-system qubit)
  (:documentation "S-Gate, a.k.a., the {\pi}/4 Gate."))

;;;; S^dagger (adjoint pi/4)

(defgeneric sdg (quantum-system qubit)
  (:documentation "S^{\dagger}-Gate, a.k.a., the Adjoint of {\pi}/4."))

(defgeneric s-dagger (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'SDG."))

(defgeneric adjoint-pi/4 (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'SDG."))

;;;; Square root of Swap gate (√SWAP)

(defgeneric sqrt-swap (quantum-system qubit[0] qubit[1])
  (:documentation "Square-root of SWAP Gate."))

(defgeneric square-root-of-swap (quantum-system quantum-register)
  (:documentation "Alternate name for Quantum Operator #'SQRT-SWAP."))

;;;; Controlled Pauli Gates (cX cY cZ)

(defgeneric controlled-pauli-x (quantum-system control target)
  (:documentation "Controlled Pauli-X quantum operator."))

(defgeneric cx (quantum-system quantum-register)
  (:documentation "cX Gate, a.k.a., Quantum Operator #'CONTROLLED-PAULI-X."))

(defgeneric controlled-pauli-y (quantum-system control target)
  (:documentation "Controlled Pauli-Y quantum operator."))

(defgeneric cy (quantum-system quantum-register)
  (:documentation "cY Gate, a.k.a., Quantum Operator #'CONTROLLED-PAULI-Y."))

(defgeneric controlled-pauli-z (quantum-system control target)
  (:documentation "Controlled Pauli-Z quantum operator."))

(defgeneric cz (quantum-system quantum-register)
  (:documentation "cZ Gate, a.k.a., Quantum Operator #'CONTROLLED-PAULI-Z."))

;;;; Controlled Hadamard gate

(defgeneric controlled-hadamard (quantum-system control target)
  (:documentation "Controlled Hadamard quantum operator."))

(defgeneric ch (quantum-system quantum-register)
  (:documentation "cH Gate, a.k.a., Quantum Operator #'CONTROLLED-HADAMARD."))

;;;; Toffoli (CCNOT) gate

(defgeneric toffoli (quantum-system qubit[0] qubit[1] qubit[2])
  (:documentation "Toffoli Gate"))

(defgeneric ccnot (quantum-system qubit[0] qubit[1] qubit[2])
  (:documentation "Doubly-Controlled NOT Gate, a.k.a., Toffoli Gate."))

;;;; Fredkin (CSWAP) gate

(defgeneric fredkin (quantum-system qubit)
  (:documentation "Fredkin Gate"))

(defgeneric cswap (quantum-system qubit)
  (:documentation "Controlled SWAP Gate, a.k.a., Fredkin Gate."))

;;;; Ising (XX) gate

(defgeneric ising (quantum-system qubit[0] qubit[1] phi)
  (:documentation "Ising (XX) Gate."))

;;;; === [[ :: UNIVERSAL QUANTUM GATES :: ]] ============================================================================================================== ;;;;

;;;; Deutsch $D_{\theta}$ Gate:

(defgeneric d-theta (quantum-system qubit[0] qubit[1] qubit[2] theta)
  (:documentation "Deutsch D_{\theta} Singly-Universal Quantum Gate."))

(defgeneric deutsch (quantum-system quantum-register theta)
  (:documentation "Alternate name for Quantum Operator D-THETA."))

;;;; Barenco B[3] Gate:

(defgeneric b[3] (quantum-system qubit[0] qubit[1] phi alpha theta)
  (:documentation "Barenco B[3] Singly-Universal Quantum Gate."))

(defgeneric barenco (quantum-system quantum-register phi alpha theta)
  (:documentation "Alternate name for Quantum Operator #'B[3]."))

;;;; === [[ :: QUANTUM MEASUREMENT :: ]] ================================================================================================================== ;;;;

(defgeneric measure (quantum-system quantum-register)
  (:documentation "Bell Measurement quantum operation."))

(defgeneric m (quantum-system quantum-register)
  (:documentation "Bell Measurement Gate."))

(defgeneric non-demolition-measurement (quantum-system quantum-register)
  (:documentation "Non-Demolition Measurement quantum operation."))

(defgeneric ndm (quantum-system quantum-register)
  (:documentation "Non-Demolition Measurement Gate."))
