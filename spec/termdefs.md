
## Terms and Definitions

For the purposes of this document, the following terms and definitions apply.

ISO and IEC maintain terminological databases for use in standardization at the following addresses:

 - ISO Online browsing platform: available at <https://www.iso.org/obp>
 - IEC Electropedia: available at <http://www.electropedia.org/>

[[def: Authentic Chained Data Container, ACDC]]

~ a directed acyclic graph with properties to provide a verifiable chain of proof-of-authorship. See the full [specification](https://trustoverip.github.io/tswg-acdc-specification/)

[[def: Autonomic identifier, AID]]

~ a self-managing cryptonymous identifier that must be self-certifying (self-authenticating) and must be encoded in CESR as a qualified Cryptographic primitive.

[[def: Autonomic identity system, AIS]]

~ an identity system that includes a primary root-of-trust in self-certifying identifiers that are strongly bound at issuance to a cryptographic signing (public, private) key pair. An AIS enables any entity to establish control over an AN in an independent, interoperable, and portable way.

[[def: Autonomic namespace, AN]]

~ a namespace that is self-certifying and hence self-administrating. An AN has a self-certifying prefix that provides cryptographic verification of root control authority over its namespace. All derived AIDs in the same AN share the same root-of-trust, source-of-truth, and locus-of-control (RSL). The governance of the namespace is therefore unified into one entity, that is, the controller who is/holds the root authority over the namespace.

[[def: Backer]]

~ an alternative to a traditional KERI based [[ref: Witness]] commonly using Distributed Ledger Technology (DLT) to store the [[ref: KEL]] for an identifier.

[[def: Concise Binary Object Representation, CBOR]]

~ a binary serialization format, similar in concept to JSON but aiming for greater conciseness. Defined in [[spec: RFC7049]].

[[def: Configuration traits, Modes]]

~ a list of specially defined strings representing a configuration of a KEL. See (Configuration traits field)[#configuration-traits-field].

[[def: Controller]]

~ an entity that can cryptographically prove the control authority over an AID and make changes on the associated KEL. A controller of a multi-sig AID may consist of multiple controlling entities.

[[def: Cryptographic Primitive]]

~ the serialization of a value associated with a cryptographic operation including but not limited to a digest (hash), a salt, a seed, a private key, a public key, or a signature.

[[def: Cryptonym]]

~ a cryptographic pseudonymous identifier represented by a string of characters derived from a random or pseudo-random secret seed or salt via a one-way cryptographic function with a sufficiently high degree of cryptographic strength (e.g., 128 bits, see appendix on cryptographic strength) [[13]] [[14]] [[12]] [[11]]. A Cryptonym is a type of Primitive. Due to the entropy in its derivation, a Cyptonym is a universally unique identifier and only the Controller of the secret salt or seed from which the Cryptonym is derived may prove control over the Cryptonym. Therefore the derivation function must be associated with the Cryptonym and may be encoded as part of the Cryptonym itself.

[[def: Current threshold]]

~ represents the number or fractional weights of signatures from the given set of current keys required to be attached to a [[ref: Message]] for the [[ref: Message]] to be considered fully signed.

[[def: Dead-Attack]]

~ an attack on an establishment event that occurs after the Key-state for that event has become stale because a later establishment event has rotated the sets of signing and pre-rotated keys to new sets. See (Security Properties of Prerotation)[#dead-attacks].

[[def: Decentralized key management infrastructure, DKMI]]

~ a key management infrastructure that does not rely on a single entity for the integrity and security of the system as a whole. Trust in a DKMI is decentralized through the use of technologies that make it possible for geographically and politically disparate entities to reach an agreement on the key state of an identifier [[ref: DPKI]].

[[def: Duplicity]]

~ the existence of more than one Version of a Verifiable KEL for a given AID.

[[def: End-verifiability]]

~ a data item or statement may be cryptographically securely attributable to its source (party at the source end) by any recipient verifier (party at the destination end) without reliance on any infrastructure not under the verifier's ultimate control.

[[def: Establishment event]]

~ a Key event that establishes or changes the Key state which includes the current set of authoritative keypairs (Key state) for an AID.

[[def: First-Seen]]

~ refers to the first instance of a [[ref: Message]] received by any [[ref: Witness]] or [[ref: Watcher]]. The first-seen event is always seen, and can never be unseen. It forms the basis for [[ref: Duplicity]] detection in KERI based systems.

[[def: Inception]]

~ the operation of creating an AID by binding it to the initial set of authoritative keypairs and any other associated information. This operation is made verifiable and Duplicity evident upon acceptance as the Inception event that begins the AID's KEL.

[[def: Inception event]]

~ an Establishment event that provides the incepting information needed to derive an AID and establish its initial Key state.

[[def: Interaction event]]

~ a Non-establishment event that anchors external data to the Key state as established by the most recent prior Establishment event.

[[def: KERI’s Algorithm for Witness Agreement, KAWA]]

~ a type of Byzantine Fault Tolerant (BFT) algorithm

[[def: Key event]]

~ concretely, the serialized data structure of an entry in the Key event log (KEL) for an AID. Abstractly, the data structure itself. Key events come in different types and are used primarily to establish or change the authoritative set of keypairs and/or anchor other data to the authoritative set of keypairs at the point in the KEL actualized by a particular entry.

[[def: Key event log, KEL]]

~ a Verifiable data structure that is a backward and forward chained, signed, append-only log of key events for an AID. The first entry in a KEL must be the one and only Inception event of that AID.

[[def: Key event message]]

~ message whose body is a Key event and whose attachments may include signatures on its body.

[[def: Key event receipt]]

~ message whose body references a Key event and whose attachments must include one or more signatures on that Key event.

[[def: Key event receipt log, KERL]]

~ a key event receipt log is a [[ref: KEL]] that also includes all the consistent key event receipt [[ref: Message]]s created by the associated set of witnesses. See annex [Key event receipt log](#key-event-receipt-log)

[[def: Key-State]]

~ a set of authoritative keys for an AID along with other essential information necessary to establish, evolve, verify, and validate control-signing authority for that AID. This information includes the current public keys and their thresholds (for a multi-signature scheme); pre-rotated key digests and their thresholds; [[ref: witness]]es and their thresholds; and configurations. An AID’s key state is first established through its [[ref:inception event]] and may evolve via subsequent [[ref: rotation event]]s. Thus, an AID’s key state is time-dependent.

[[def: Live-Attack]]

~ an attack that compromises either the current signing keys used to sign non-establishment events or the current pre-rotated keys needed to sign a subsequent establishment event. See (Security Properties of Prerotation)[#live-attacks].

[[def: Message]]

~ a serialized data structure that comprises its body and a set of serialized data structures that are its attachments. Attachments may include but are not limited to signatures on the body.

[[def: Next threshold]]

~ represents the number or fractional weights of signatures from the given set of next keys required to be attached to a [[ref: Message]] for the [[ref: Message]] to be considered fully signed.

[[def: Non-establishment event]]

~ a Key event that does not change the current Key state for an AID. Typically, the purpose of a Non-establishment event is to anchor external data to a given Key state as established by the most recent prior Establishment event for an AID.

[[def: Primitive:]]

~ a serialization of a unitary value. All Primitives in KERI must be expressed in CESR [[1]].

[[def: Rotation]]

~ the operation of revoking and replacing the set of authoritative keypairs for an AID. This operation is made verifiable and Duplicity evident upon acceptance as a Rotation event that is appended to the AID's KEL.

[[def: Rotation event]]

~ an Establishment Event that provides the information needed to change the Key state which includes a change to the set of authoritative keypairs for an AID.

[[def: Salt]]

~ random data fed as an additional input to a one-way function that hashes data.

[[def: Seal]]

~ a seal is a cryptographic commitment in the form of a cryptographic digest or hash tree root (Merkle root) that anchors arbitrary data or a tree of hashes of arbitrary data to a particular event in the key event sequence. See annex (Seal)[#seal].

[[def: Self-addressed data, SAD]]

~ a representation of data content from which a SAID is derived. The SAID is both cryptographically bound to (content-addressable) and encapsulated by (self-referential) its SAD [[ref: SAID]].

[[def: Self-addressing identifiers, SAID]]

~ an identifier that is content-addressable and self-referential. A SAID is uniquely and cryptographically bound to a serialization of data that includes the SAID as a component in that serialization [[ref: SAID]].

[[def: Self-certifying identifier, SCID]]

~ a type of Cryptonym that is uniquely cryptographically derived from the public key of an asymmetric signing keypair, `(public, private)`.

[[def: Validator]]

~ any entity or agent that evaluates whether or not a given signed statement as attributed to an identifier is valid at the time of its issuance.

[[def: Verifiable]]

~ a condition of a KEL: being internally consistent with integrity of its backward and forward chaining digest as well as authenticity of its non-repudiable signatures.

[[def: Verifier]]

~ any entity or agent that cryptographically verifies the signature(s) and digests on an event Message.

[[def: Version]]

~ an instance of a KEL for an AID in which at least one event is unique between two instances of the [[ref: KEL]]

[[def: Watcher]]

~ an _entity_ or _component_ that keeps a copy of a [[ref: KERL]] for an identifier but that is not designated by the _controller_ of the identifier as one of its witnesses. See annex [watcher](#watcher)

[[def: Witness]]

~ a _witness_ is an _entity_ or _component_ designated (trusted) by the _controller_ of an _identifier_. The primary role of a witness is to verify, sign, and keep events associated with an identifier. A _witness_ is the _controller_ of its own self-referential _identifier_ which may or may not be the same as the _identifier_ to which it is a _witness_. See Annex A under KAWA (KERI's Algorithm for Witness Agreement).
