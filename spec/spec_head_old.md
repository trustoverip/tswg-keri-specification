Key Event Receipt Infrastructure (KERI)
==================

**Specification Status**: v0.9 Draft

**Latest Draft:**

[https://github.com/trustoverip/tswg-keri-specification](https://github.com/trustoverip/tswg-keri-specification)

**Author:**

- [Samuel Smith](https://github.com/SmithSamuelM), [Prosapien](https://prosapien.com/)

**Editors:**

- [Kevin Griffin](https://github.com/m00sey), [GLEIF](https://gleif.org/)

**Contributors:**

- [Henk van Cann](https://github.com/henkvancann), [Blockchainbird](https://blockchainbird.org/)
- [Kor Dwarshuis](https://github.com/kordwarshuis), [Blockchainbird](https://blockchainbird.org/)

**Participate:**

~ [GitHub repo](https://github.com/trustoverip/tswg-keri-specification)
~ [Commit history](https://github.com/trustoverip/tswg-keri-specification/commits/main)

## Introduction

The original design of the Internet Protocol (IP) has no security layer(s) [[RFC0791](#RFC0791)], providing no built-in mechanism for secure attribution to the source of an IP packet. Anyone can forge an IP packet, and a recipient may not be able to ascertain when or if the packet was sent by an imposter. This means that secure attribution mechanisms for the Internet must be overlaid. This documents presents an identifier system security overlay, called the Key Event Receipt Infrastructure (KERI) protocol, that serves as a trust spanning layer for the Internet. This overlay includes a primary root-of-trust in a [[ref: Self-certifying identifier]] (SCID) that provides a formalism for Autonomic identifiers (AIDs), Autonomic namespaces (ANs), and the basis for a universal Autonomic Identity System (AIS).

The KERI protocol provides verifiable authorship (authenticity) of any message or data item via secure cryptographically verifiable attribution to a SCID as a primary root-of-trust [[4](#ref4)] [[16](#ref16)] [[18](#ref18)] [[19](#ref19)] [[17](#ref17)] [[15](#ref15)]. This root-of-trust is cryptographic, not administrative, because it does not rely on any trusted third-party administrative process but may be established with cryptographically verifiable data structures. This cryptographic root-of-trust enables end verifiability where every data item may be cryptographically attributable to its source by any recipient verifier, without reliance on any infrastructure not under the verifier's ultimate control. Therefore, KERI has no security dependency on any other infrastructure and does not rely on security guarantees that may or may not be provided by the traditional internet infrastructure. This makes intervening operational infrastructure replaceable, enabling ambient verifiability (verification by anyone, anywhere, at any time).

A SCID is strongly bound at inception to a cryptographic keypair that is self-contained unless control over the SCID needs to be transferred to a new keypair. The KERI protocol provides end-verifiable control provenance over a variant of SCID, called an Autonomic identifier (AID), via signed transfer statements in an append-only chained Key event log (KEL). The key management operation for tansferring control over an AID is implemented via a novel key [pre-rotation](#pre-rotation) scheme [[6](#ref6)]. With pre-rotation, control over an AID can be re-established by rotating to a one-time use set of unexposed but pre-committed rotation keypairs. This approach fixes the foundational flaw in traditional Public key infrastructure (PKI), which is insecure key rotation. KERI enables decentralized public key infrastructure (DPKI) that is more secure and more portable. KERI may be viewed as a viable reboot of the Web-of-Trust concept for DPKI because KERI fixes the hard problem of DPKI, which is key rotation.

Two primary trust modalities motivated the design of the KERI protocol, namely a direct (one-to-one) mode and an indirect (one-to-any) mode. In the direct mode, two entities establish trust over AIDs via a direct exchange of their counterparts' verified signatures. In the indirect mode, trust over AIDs depends on witnessed Key event receipt logs (KERLs) as a secondary root-of-trust for validating key events. The security and accountability guarantees of indirect mode are provided by KERI’s Algorithm for Witness Agreement (KAWA) among a set of key event Witnesses. The KAWA approach may be much more performant and scalable than more complex approaches that depend on a total ordering distributed consensus ledger. Nevertheless, KERI may employ a distributed consensus ledger when other considerations make it the best choice.

The KERI approach to Decentralized key management infrastructure (DKMI) allows for more granular composition. Moreover, because KERI is event streamed, it enables DKMI to operate in-stride with data events streaming applications such as web 3.0, IoT, and others where performance and scalability are more important. The core KERI engine is independent of identifier namespace. This makes KERI a candidate for a universal portable DKMI. This system uses the design principle of minimally sufficient means for appropriate levels of security, performance, and adoptability to be a viable candidate as the DKMI that underpins a trust-spanning layer for the Internet.

## Scope

Implementation design of a protocol-based decentralized key management infrastructure that enables secure attribution of data to a cryptographically derived identifier with strong (cryptographically verifiable) bindings between each of the identifier, a set of asymmetric signing key pairs that are the key state, a controlling entity that holds the private keys, and a cryptographically verifiable data structure that enables changes to that key state. Thus, security over secure attribution is reduced to key management. This key management includes, for the first time, a practical solution to the hard problem of public key rotation. There is no reliance on trusted third parties. The resulting secure attribution is fully end-to-end verifiable.

Because of the reliance on asymmetric (public, private) digital signing key pairs, this may be viewed as a type of decentralized public key infrastructure (DPKI). The protocol supports cryptographic agility for both pre- and post-quantum attack resistance. The application scope includes any electronically transmitted information. The implementation dependency scope assumes no more than cryptographic libraries that provide cryptographic strength pseudo-random number generators, cryptographic strength digest algorithms, and cryptographic strength digital signature algorithms.

## Normative references

The following documents are referred to in the text in such a way that some or all of their content constitutes requirements of this document. For dated references, only the edition cited applies. For undated references, the latest edition of the referenced document (including any amendments) applies.

* ISO/IEC 7498-1:1994 Information technology — Open Systems Interconnection — Basic Reference Model: The Basic Model. June 1999. Introduction. Retrieved 26 August 2022.

[a]. IETF RFC-2119 Key words for use in RFCs to Indicate Requirement Levels
[a]: https://www.rfc-editor.org/rfc/rfc2119.txt

[b]. IETF RFC-4648 Base64
[b]: https://www.rfc-editor.org/rfc/rfc4648.txt

[c]. IETF RFC-3339 DateTime
[c]: https://www.rfc-editor.org/rfc/rfc3339.txt


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

[//]: # (KERI foundational overview {#sec:content})
