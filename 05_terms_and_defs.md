# Terms and Definitions

For the purposes of this document, the following terms and definitions apply.

ISO and IEC maintain terminological databases for use in standardization at the following addresses:

 - ISO Online browsing platform: available at <https://www.iso.org/obp>
 - IEC Electropedia: available at <http://www.electropedia.org/>


Primitive
: a serialization of a unitary value. A cryptographic Primitive is the serialization of a value associated with a cryptographic operation including but not limited to a digest (hash), a salt, a seed, a private key, a public 

Qualified
: when Qualified, a cryptographic Primitive includes a prepended derivation code (as a proem) that indicates the cryptographic algorithm or suite used for that derivation. This simplifies and compactifies the essential information needed to use that cryptographic Primitive. All cryptographic Primitives expressed in either text or binary CESR are qualified by definition {{CESR-ID}}. Qualification is an essential property of CESR {{CESR-ID}}.

Cryptonym
: a cryptographic pseudonymous identifier represented by a string of characters derived from a random or pseudo-random secret seed or salt via a one-way cryptographic function with a sufficiently high degree of cryptographic strength (e.g. 128 bits, see appendix on cryptographic strength) {{OWF}}{{COWF}}{{TMCrypto}}{{QCHC}}. A Cryptonym is a type of Primitive. Due the enctropy in its derivation, a Cryptonym is a universally unique identifier and only the Controller of the secret salt or seed from which the Cryptonym is derived may prove control over the Cryptonym. Therefore, the derivation function must be associated with the Cryptonym and may be encoded as part of the Cryptonym itself.

Self-certifying identifier (SCID)
: a type of Cryptonym that is uniquely cryptographically derived from the public key of an asymmetric non-repudiable signing keypair, (public, private). 

Autonomic identifier (AID)
: a self-managing cryptonymous identifier that must be self-certifying (self-authenticating) and must be encoded in CESR as a qualified cryptographic Primitive. 

Key state
: includes the set of currently authoritative keypairs for an AID and any other information necessary to secure or establish control authority over an AID.

Key event
: concretely, the serialized data structure of an entry in the Key event log (KEL) for an AID. Abstractly, the data structure itself. Key events come in different types and are used primarily to establish or change the authoritative set of keypairs and/or anchor other data to the authoritative set of keypairs at the point in the KEL actualized by a particular entry.

Establishment event
: a key event that establishes or changes the Key state which includes the current set of authoritative keypairs (Key state) for an AID.

Non-establishment event
: a key event that does not change the current Key state for an AID. Typically, the purpose of a non-establishment event is to anchor external data to a given Key state as established by the most recent prior Establishment event for an AID.

Inception event
: an Establishment Event that provides the incepting information needed to derive an AID and establish its initial Key state.

Inception
: the operation of creating an AID by binding it to the initial set of authoritative keypairs and any other associated information. This operation is made verifiable and Duplicity evident upon acceptance as the Inception event that begins the AID's KEL.

Rotation event
: an Establishment event that provides the information needed to change the Key state which includes a change to the set of authoritative keypairs for an AID.

Rotation
: the operation of revoking and replacing the set of authoritative keypairs for an AID. This operation is made verifiable and Duplicity evident upon acceptance as a Rotation event that is appended to the AID's KEL.

Interaction event
: a Non-establishment Event that anchors external data to the Key state as established by the most recent prior Establishment event.

Key event log (KEL)
: a Verifiable data structure that is a backward and forward chained, signed, append-only log of key events for an AID. The first entry in a KEL must be the one and only Inception event of that AID.

Version
: more than one version of a KEL for an AID exists when for any two instances of a KEL at least one event is unique between the two instances.

Verifiable
: a KEL is verifiable means all content in a KEL including the digests and the signatures on that content is verifiably compliant with respect to the KERI protocol. In other words, the KEL is internally consistent and has integrity vis-a-vis its backward and forward chaining digests and authenticity vis-a-vis its non-repudiable signatures. As a Verifiable data structure, the KEL satisfies the KERI protocol-defined rules for that verifiability. This includes the cryptographic verification of any digests or signatures on the contents so digested or signed.

Duplicity
: the existence of more than one version of a verifiable KEL for a given AID. Because every event in a KEL must be signed with non-repudiable signatures any inconsistency between any two instances of the KEL for a given AID is provable evidence of Duplicity on the part of the signers with respect to either or both the Key state of that AID and/or any anchored data at a given Key state.  A shorter KEL that does not differ in any of its events with respect to another, but a longer KEL is not duplicitous but merely incomplete.  To clarify, Duplicity evident means that Duplicity is provable via the presentation of a set of two or more mutually inconsistent but independently verifiable instances of a KEL.

Verifier
: any entity or agent that cryptographically verifies the signature(s) and/or digests on an event message. In order to verify a signature, a Verifier must first determine which set of keys are or were the controlling set for an identifier when an event was issued. In other words, a Verifier first must establish control authority for an identifier. For identifiers that are declared as non-transferable at inception, this control establishment merely requires a copy of the Inception event for the identifier. For identifiers that are declared transferable at Inception, this control establishment requires a complete copy of the sequence of Establishment events (Inception and all Rotations) for the identifier up to the time at which the statement was issued.

Validator
: any entity or agent that evaluates whether or not a given signed statement as attributed to an identifier is valid at the time of its issuance.  A valid statement must be verifiable, that is, has a verifiable signature from the current controlling keypair(s) at the time of its issuance. Therefore, a Validator first must act as a Verifier in order to establish the root authoritative set of keys. Once verified, the Validator may apply other criteria or constraints to the statement in order to determine its validity for a given use case. When that statement is part of a Verifiable data structure then the cryptographic verification includes verifying digests and any other structural commitments or constraints.  To elaborate, with respect to an AID, for example, a Validator first evaluates one or more KELs in order to determine if it can rely on (trust) the Key state (control authority) provided by any given KEL. A necessary but insufficient condition for a valid KEL is it is verifiable i.e., is internally inconsistent with respect to compliance with the KERI protocol. An invalid KEL from the perspective of a Validator may be either unverifiable or may be verifiable but duplicitous with respect to some other verifiable version of that KEL.  Detected Duplicity by a given Validator means that the Validator has seen more than one verifiable version of a KEL for a given AID. Reconcilable Duplicity means that one and only one version of a KEL as seen by a Validator is accepted as the authoritative version for that validator. Irreconcilable Duplicity means that none of the versions of a KEL as seen by a Validator are accepted as the authoritative one for that Validator. The conditions for reconcilable duplicity are described later.

Message
: consists of a serialized data structure that comprises its body and a set of serialized data structures that are its attachments. Attachments may include but are not limited to signatures on the body.

Key event message
: a Message whose body is a Key event and whose attachments may include signatures on its body.

Key event receipt
: a Message whose body references a Key event and whose attachments must include one or more signatures on that Key event.
