Key Event Receipt Infrastructure (KERI)
==================

**Specification Status**: v1.0 Draft

**Latest Draft:**

[https://github.com/trustoverip/tswg-keri-specification](https://github.com/trustoverip/tswg-keri-specification)

**Author:**

- [Samuel Smith](https://github.com/SmithSamuelM), [Prosapien](https://prosapien.com/)

**Editors:**

**Contributors:**

**Participate:**

~ [GitHub repo](https://github.com/trustoverip/tswg-keri-specification)
~ [Commit history](https://github.com/trustoverip/tswg-keri-specification/commits/main)

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/51
:::

[//]: # (\maketitle)

[//]: # (\newpage)

[//]: # (\toc)

[//]: # (\newpage)

[//]: # (::: forewordtitle)

## Foreword

This publicly available specification was approved by the ToIP Foundation Steering Committee on [dd month yyyy must match date in subtitle above]. The ToIP permalink for this document is:

            [permalink for this deliverable: see instructions on this [wiki page](https://wiki.trustoverip.org/display/HOME/File+Names+and+Permalinks)]

The mission of the Trust over IP (ToIP) Foundation is to define a complete architecture for Internet-scale digital trust that combines cryptographic assurance at the machine layer with human accountability at the business, legal, and social layers. Founded in May 2020 as a non-profit hosted by the Linux Foundation, the ToIP Foundation has over 400 organizational and 100 individual members from around the world.

Any trade name used in this document is information given for the convenience of users and does not constitute an endorsement.

This document was prepared by the ToIP Technical Stack Working Group.

Any feedback or questions on this document should be directed to https://github.com/trustoverip/tswg-keri-specification/issues

THESE MATERIALS ARE PROVIDED “AS IS.” The Trust Over IP Foundation, established as the Joint Development Foundation Projects, LLC, Trust Over IP Foundation Series ("ToIP"), and its members and contributors (each of ToIP, its members and contributors, a "ToIP Party") expressly disclaim any warranties (express, implied, or otherwise), including implied warranties of merchantability, non-infringement, fitness for a particular purpose, or title, related to the materials. The entire risk as to implementing or otherwise using the materials is assumed by the implementer and user. 
IN NO EVENT WILL ANY ToIP PARTY BE LIABLE TO ANY OTHER PARTY FOR LOST PROFITS OR ANY FORM OF INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES OF ANY CHARACTER FROM ANY CAUSES OF ACTION OF ANY KIND WITH RESPECT TO THESE MATERIALS, ANY DELIVERABLE OR THE ToIP GOVERNING AGREEMENT, WHETHER BASED ON BREACH OF CONTRACT, TORT (INCLUDING NEGLIGENCE), OR OTHERWISE, AND WHETHER OR NOT THE OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/47
:::

[//]: # (:::)

[//]: # (\newpage)

[//]: # (::: introtitle)

## Introduction

[//]: # (:::)

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/48
:::

This document presents a decentralized identifier-system-based security overlay for the Internet. This overlay is called the Key Event Receipt Infrastructure (KERI) protocol. KERI is an innovative type of decentralized key management infrastructure that benefits from a novel key rotation scheme called key prerotation [[ref: DAD]]. This fixes the foundational flaw in exiting PKI (public key infrastructure), which is insecure key rotation. KERI enables decentralized public key infrastructure (DPKI) that is more secure and more portable.  KERI may be viewed as a viable reboot of the Web-of-Trust concept for DPKI because KERI fixes the hard problem of DPKI which is key rotation. 

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/29
:::

KERI's identifier system-based security overlay for the Internet provides each identifier with a primary root-of-trust from Self-certifying identifiers (SCIDs) [[ref: UIT]] [[ref: SCPK]] [[ref: SFS]] [[ref: SCPN]] [[ref: SCURL]]. This root-of-trust is cryptographic, not administrative, because it does not rely on any trusted third-party administrative process but may be established with cryptographically verifiable data structures. This cryptographic root-of-trust enables what is called end-to-end verifiability or end-verifiability for short. By end-verifiable, it means that every data item may be cryptographically securely attributable to its source by any recipient verifier without reliance on any infrastructure not under the verifier's ultimate control. KERI's end-verifiability is pervasive. It means that everything in KERI or that depends on KERI is also end-verifiable; therefore, KERI has no security dependency on any other infrastructure, including conventional PKI. It also does not rely on security guarantees that may or may not be provided by web or internet infrastructure.  This cryptographic root-of-trust provides a formalism for Autonomic identifiers (AIDs) and Autonomic namespaces (ANs) that provide the basis for a universal Autonomic Identity System (AIS). This system uses the design principle of minimally sufficient means for appropriate levels of security, performance, and adoptability to be a viable candidate as the DKMI that underpins a trust-spanning layer for the Internet. 

The primary root-of-trust are SCIDs that are strongly bound at issuance to a cryptographic signing (public, private) keypair which is self-contained until/unless control needs to be transferred to a new keypair. In that event, an append-only chained Key event log (KEL) of signed transfer statements provides end-verifiable control provenance. This makes intervening operational infrastructure replaceable because the event logs may be served up by any infrastructure, including ambient infrastructure. End-verifiable logs on ambient infrastructure enable ambient verifiability (Verifiable by anyone, anywhere, at any time).

The primary key management operation is key Rotation (transference) via a novel key pre-rotation scheme [[ref: DAD]]. Two primary trust modalities motivated the design, these are a direct (one-to-one) mode and an indirect (one-to-any) mode. The indirect mode depends on witnessed Key event receipt logs (KERL) as a secondary root-of-trust for validating events, which is the background for the acronym KERI, Key Event Receipt Infrastructure. In the direct mode, the identity Controller establishes control via verified signatures of the controlling keypair. The indirect mode extends that trust basis with witnessed Key event receipt logs (KERLs) for validating events. The security and accountability guarantees of indirect mode are provided by KERI’s Agreement Algorithm for Control Establishment (KA2CE) among a set of Witnesses.

The KAWA approach may be much more performant and scalable than more complex approaches that depend on a total ordering distributed consensus ledger. Nevertheless, KERI may employ a distributed consensus ledger when other considerations make it the best choice. The KERI approach to DKMI allows for more granular composition. Moreover, because KERI is event streamed, it enables DKMI to operate in-stride with data events streaming applications such as web 3.0, IoT, and others where performance and scalability are more important. The core KERI engine is identifier namespace independent. This makes KERI a candidate for a universal portable DKMI.

The main motivation for this work is to provide a secure decentralized foundation of attributional trust for the Internet as a trustable spanning layer in the form of an identifier system security overlay. This identifier system security overlay provides verifiable authorship (authenticity) of any message or data item via secure (Cryptographically verifiable) attribution to a cryptonymous (cryptographic strength pseudonymous) SCID [[ref: SCID]] [[ref: UIT]] [[ref: SCPK]] [[ref: SFS]] [[ref: SCPN]] [[ref: SCURL]] [[ref: PKI]].

Thus, KERI addresses major flaw in the original design of the Internet Protocol (IP) which is that the Internet has no security layer(s) (i.e., Session or Presentation layers) to provide interoperable Verifiable authenticity [[spec: RFC0791]]. There was no built-in mechanism for secure attribution to the source of a packet. Specifically, the IP packet header includes a source address field that indicates the IP address of the device that sent the packet. Anyone (including any intermediary) can forge an IP packet. Because the source address of such a packet can be undetectably forged, a recipient may not be able to ascertain when or if the packet was sent by an imposter.  This means that secure attribution mechanisms for the Internet must be overlaid (bolted-on). KERI provides such a security overlay specifically an identifier system security overlay.

[//]: # (\mainmatter)

[//]: # (\doctitle)

## Scope

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/49
:::

The identity system-based secure overlay for the Internet, based on KERI, includes a primary root-of-trust in Self-certifying identifiers (SCIDs). This root-of-trust presents a formalism for Autonomic identifiers (AIDs) and Autonomic namespaces (ANs), which are part of an Autonomic identity system (AIS). This system uses the design principle of minimally sufficient means to provide a candidate trust spanning layer for the Internet. Associated with this system is a Decentralized key management infrastructure (DKMI). 

The primary root-of-trust are SCIDs that are strongly bound at issuance to a cryptographic signing (public, private) keypair, which is self-contained until/unless control needs to be transferred to a new keypair. In that event, an append-only chained key-event log of signed transfer statements provides end-verifiable control provenance. This makes intervening operational infrastructure replaceable because the event logs may be served up by any infrastructure including ambient infrastructure. End verifiable logs on ambient infrastructure enable ambient verifiability (verifiable by anyone, anywhere, at any time).

The primary key management operation is key Rotation (transference) via a novel key pre-rotation scheme. Two primary trust modalities motivated the design, a direct (one-to-one) mode and an indirect (one-to-any) mode. The indirect mode depends on witnessed Key event receipt logs (KERL) as a secondary root-of-trust for validating events., which is the background for the acronym KERI, Key event receipt infrastructure. In the direct mode, the identity Controller establishes control via verified signatures of the controlling keypair. The indirect mode extends that trust basis with witnessed KERL for validating events. The security and accountability guarantees of indirect mode are provided by KERI’s Algorithm for Witness Agreement (KAWA) among a set of Witnesses.

The KAWA approach may be much more performant and scalable than more complex approaches that depend on a total ordering distributed consensus ledger. Nevertheless, KERI may employ a distributed consensus ledger when other considerations make it the best choice. The KERI approach to DKMI allows for a more granular composition. Moreover, because KERI is event streamed, it enables DKMI to operate in-stride with data events streaming applications such as web 3.0, IoT, and others where performance and scalability are more important. The core KERI engine is identifier namespace independent. This makes KERI a candidate for a universal portable DKMI.


## Normative references

The following documents are referred to in the text in such a way that some or all of their content constitutes requirements of this document. For dated references, only the edition cited applies. For undated references, the latest edition of the referenced document (including any amendments) applies.

[//]: # (::: { #nrm:osi .normref label="ISO/IEC 7498-1:1994" })

[//]: # (ISO/IEC 7498-1:1994 Information technology — Open Systems Interconnection — Basic Reference Model: The Basic Model)

[//]: # (:::)


## Terms and Definitions

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/50
:::

For the purposes of this document, the following terms and definitions apply.

ISO and IEC maintain terminological databases for use in standardization at the following addresses:

 - ISO Online browsing platform: available at <https://www.iso.org/obp>
 - IEC Electropedia: available at <http://www.electropedia.org/>

[[def: Primitive]]:
~ a serialization of a unitary value.  All Primitives in KERI must be expressed in CESR  [[ref: CESR-ID]].

[[def: Cryptographic Primitive]]

~ the serialization of a value associated with a cryptographic operation including but not limited to a digest (hash), a salt, a seed, a private key, a public key, or a signature. 

[[def: Cryptonym]]

~ a cryptographic pseudonymous identifier represented by a string of characters derived from a random or pseudo-random secret seed or salt via a one-way cryptographic function with a sufficiently high degree of cryptographic strength (e.g., 128 bits, see appendix on cryptographic strength) [[ref: OWF]] [[ref: COWF]] [[ref: TMCrypto]] [[ref: QCHC]]. A Cryptonym is a type of Primitive . Due to the entropy in its derivation, a Cyptonym is a universally unique identifier and only the Controller of the secret salt or seed from which the Cryptonym is derived may prove control over the Cryptonym. Therefore the derivation function must  be associated with the Cryptonym and may be encoded as part of the Cryptonym itself.

[[def: Self-certifying identifier (SCID)]]

~ a type of Cryptonym that is uniquely cryptographically derived from the public key of an asymmetric non-repudiable signing keypair, `(public, private)`. 

[[def: Autonomic identifier (AID)]]

~ a self-managing cryptonymous identifier that must be self-certifying (self-authenticating) and must be encoded in CESR as a qualified Cryptographic primitive. 

[[def: Key state]]

~ includes the set of currently authoritative keypairs for an AID and any other information necessary to secure or establish control authority over an AID.

[[def: Key event]]

~ concretely, the serialized data structure of an entry in the Key event log (KEL) for an AID. Abstractly, the data structure itself. Key events come in different types and are used primarily to establish or change the authoritative set of keypairs and/or anchor other data to the authoritative set of keypairs at the point in the KEL actualized by a particular entry.

[[def: Establishment event]]

~ a Key event that establishes or changes the Key state which includes the current set of authoritative keypairs (Key state) for an AID.

[[def: Non-establishment event]]

~ a Key event that does not change the current Key state for an AID. Typically the purpose of a Non-establishment event is to anchor external data to a given Key state as established by the most recent prior Establishment event for an AID.

[[def: Inception event]]

~ an Establishment event that provides the incepting information needed to derive an AID and establish its initial Key state.

[[def: Inception]]

~ the operation of creating an AID by binding it to the initial set of authoritative keypairs and any other associated information. This operation is made verifiable and Duplicity evident upon acceptance as the Inception event that begins the AID's KEL.

[[def: Rotation event]]

~ an Establishment Event that provides the information needed to change the Key state which includes a change to the set of authoritative keypairs for an AID.

[[def: Rotation]]

~ the operation of revoking and replacing the set of authoritative keypairs for an AID. This operation is made verifiable and Duplicity evident upon acceptance as a Rotation event that is appended to the AID's KEL.

[[def: Interaction event]]

~ a Non-establishment event that anchors external data to the Key state as established by the most recent prior Establishment event.

[[def: Key event log (KEL)]]

~ a Verifiable data structure that is a backward and forward chained, signed, append-only log of key events for an AID. The first entry in a KEL must be the one and only Inception event of that AID.

[[def: Version]]

~ more than one Version of a KEL for an AID exists when for any two instances of a KEL at least one event is unique between the two instances.

[[def: Verifiable]]

~ a KEL is verifiable means all content in a KEL including the digests and the signatures on that content is verifiably compliant with respect to the KERI protocol. In other words, the KEL is internally consistent and has integrity vis-a-vis its backward and forward chaining digests and authenticity vis-a-vis its non-repudiable signatures. As a Verifiable data structure, the KEL satisfies the KERI protocol-defined rules for that verifiability. This includes the cryptographic verification of any digests or signatures on the contents so digested or signed. These characteristics result in a property in KERI called End-verifiability.

[[def: End-verifiability]]

~ todo

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/35
:::

[[def: Duplicity]]

~ the existence of more than one Version of a Verifiable KEL for a given AID. Because every event in a KEL must be signed with non-repudiable signatures any inconsistency between any two instances of the KEL for a given AID is provable evidence of Duplicity on the part of the signers with respect to either or both the Key state of that AID and/or any anchored data at a given Key state.  A shorter KEL that does not differ in any of its events with respect to another but longer KEL is not duplicitous but merely incomplete.  To clarify, Duplicity evident means that Duplicity is provable via the presentation of a set of two or more mutually inconsistent but independently verifiable instances of a KEL.

[[def: Verifier]]

~ any entity or agent that cryptographically verifies the signature(s) and/or digests on an event Message. In order to verify a signature, a Verifier must first determine which set of keys are or were the controlling set for an identifier when an event was issued. In other words, a Verifier must first establish control authority for an identifier. For identifiers that are declared as non-transferable at inception, this control establishment merely requires a copy of the Inception event for the identifier. For identifiers that are declared transferable at Inception, this control establishment requires a complete copy of the sequence of Establishment events (Inception event and all Rotations) for the identifier up to the time at which the statement was issued.

[[def: Validator]]

~ any entity or agent that evaluates whether or not a given signed statement as attributed to an identifier is valid at the time of its issuance.  A valid statement must be Verifiable, that is, has a Verifiable signature from the current controlling keypair(s) at the time of its issuance. Therefore a Validator must first act as a Verifier in order to establish the root authoritative set of keys. Once verified, the Validator may apply other criteria or constraints to the statement in order to determine its validity for a given use case. When that statement is part of a Verifiable data structure then the cryptographic verification includes verifying digests and any other structural commitments or constraints.  To elaborate, with respect to an AID, for example, a Validator first evaluates one or more KELs in order to determine if it can rely on (trust) the Key state (control authority) provided by any given KEL. A necessary but insufficient condition for a valid KEL is it is Verifiable i.e., is internally inconsistent with respect to compliance with the KERI protocol. An invalid KEL from the perspective of a Validator may be either unverifiable or may be Verifiable but duplicitous with respect to some other Verifiable Version of that KEL.  Detected Duplicity by a given Validator means that the Validator has seen more than one Verifiable Version of a KEL for a given AID. Reconciliable Duplicity means that one and only one Version of a KEL as seen by a Validator is accepted as the authoritative Version for that Validator. Irreconcilable Duplicity means that none of the Versions of a KEL as seen by a Validator are accepted as the authoritative one for that Validator. The conditions for reconcilable Duplicity are described later in Annex [.  ].

[[def: Message]]

~ a serialized data structure that comprises its body and a set of serialized data structures that are its attachments. Attachments may include but are not limited to signatures on the body.

[[def: Key event message]]

~ message whose body is a Key event and whose attachments may include signatures on its body.

[[def: Key event receipt]]

~ message whose body references a Key event and whose attachments must include one or more signatures on that Key event.

[[def: Self-addressing identifiers (SAIDs)]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/54
:::

[[def: SAD (Self-Addressed Data)]]


~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/55
:::

[[def: Autonomic namespace (AN)]]

~ a namespace that is self-certifying and hence self-administrating. An AN has a self-certifying prefix that provides cryptographic verification of root control authority over its namespace. All derived autonomic identifiers (AIDs) in the same autonomic namespace (AN) share the same root-of-trust, source-of-truth, and locus-of-control (RSL). The governance of the namespace is therefore unified into one entity, that is, the controller who is/holds the root authority over the namespace. 

[[def: Autonomic identity system (AIS)]]

~ an identity system that includes a primary root-of-trust in self-certifying identifiers that are strongly bound at issuance to a cryptographic signing (public, private) key pair. An AIS enables any entity to establish control over an autonomic namespace (AN) in an independent, interoperable, and portable way.

[[def: Decentralized key management infrastructure (DKMI)]]

~ a key management infrastructure that does not rely on a single entity for the integrity and security of the system as a whole. Trust in a DKMI is decentralized through the use of technologies that make it possible for geographically and politically disparate entities to reach an agreement on the key state of an identifier.

[[def: Key event receipt log (KERL)]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/59
:::

[[def: KERI’s Algorithm for Witness Agreement (KAWA) (formerly known as KA2CE)]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/60
:::

[[def: Controller]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/61
:::

[[def: Witness]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/62
:::

[[def: Watcher]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/63
:::

[[def: Key state notice]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/64
:::

[[def: Backer]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/65
:::

[[def: Configuration traits, Modes]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/66
:::

[[def: Seals]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/67
:::

[[def: Anchors]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/68
:::

[[def: Current threshold]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/69
:::

[[def: Next threshold]]

~ todo

::: issue
https://github.com/trustoverip/tswg-keri-specification/issues/70
:::


[//]: # (KERI foundational overview {#sec:content})

## KERI foundational overview

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/30
:::

### Infrastructure and ecosystem overview

This section provides a high-level overview of the infrastructure components of a live KERI ecosystem and how they interact. It does not provide any low-level details and only describes the components superficially. However, it should help understand how all the parts fit together as one reads through the more detailed sections. 

#### Controller Application

Each KERI AID (autonomic identifier) is controlled by an entity (or entities when multi-sig) that holds the digital signing private keys belonging to the current authoritative key state of the AID. This set of entities is called the AID controller, or controller for short. Each controller has an application or suite or applications called the controller application or application for short. The controller application provides five functions with respect to the digital signing key pairs that control the controller's AID. These five functions manage the associated key state via key events. These functions are: 
- keypair generation, 
- keypair storage, 
- key event generation, 
- key event signing, and
- key event verification.

The execution of these functions, including the associated code and data, must be protected by the controller using best practices. This might, for example, be accomplished by securely installing the controller application on a device in the physical possession of the controller, such as a mobile phone with appropriate secure storage and trusted code execution environments. Alternatively, the functions might be split between devices where a remote software agent that runs on behalf of the controller may host encrypted keypair storage and highly available event verification functions while the more critical keypair generation, key event generation, and key event signing functions are on a device in the user's possession. The latter might be called a key chain or wallet. The extra security and scalability properties of delegated AIDs enable other arrangements for securely hosting the five functions.  For the sake of clarity and without loss of generality, the controller application, including any devices or software agents, will be referred to as the controller application or application for short.

#### Direct exchange

The simplest mode of operation is that a pair of controllers, each with their own AID, use their respective applications (including agents when applicable) to directly exchange key event messages that verifiably establish the current key state of their own AID with the other controller. For each exchange of key events, the destination controller acts as validator of events received from the source controller. Therefore, given any key event, a given entity is either the event's controller or a validator of some other controller's event.

 The set of key event messages forms an append-only cryptographically verifiable data structure called a key event log or KEL. The events in a KEL are signed and are both forward and backward-chained. The backward chaining commitments are cryptographic digests of the previous event. The forward chaining commitments are cryptographic digests of the next set of public keys that will constitute the next key state after a key rotation. The commitments are nonrepudiably signed with the private keys of the current key state. Each KEL is essentially a dedicated "blockchain" that manages the key state for one and only one AID. In addition to key state each KEL also manages commitments to external data. These commitments are signed cryptographic digests of external data called seals. When included in a KEL a seal binds (or anchors) the external data to the key state of the AID at the location in the KEL that the seal appears. This binding enables a controller to make cryptographically verifiable, nonrepudiable issuances of external data that are bound to a specific key state of that AID.

By exchanging KELs each controller can validate the current key state of the other and therefore, securely attribute (authenticate) any signed statements or any sealed issuances of data. This bootstraps the use of authentic data in any interaction or transaction between the pair of controllers. This is the mission of KERI.

Diagram

#### Indirect exchange via witnesses and watchers

For many if not most use cases the direct exchange of key event messages between controller applications (including agents when applicable) may not provide sufficient availability, scalability, or even security. KERI includes two other components for those use cases. These components are witnesses and watchers. 

Each controller of an AID may create or choose to use a set or pool of witnesses for that AID. The controller chooses how the witnesses are hosted. It may use a witness service provided by some other party or may directly host its own witnesses in its own infrastructure or some combination of the two. Nonetheless, the pool is under the ultimate control of the AID's controller, which means the controller may change the witness infrastructure at will. Witnesses for the AID are managed by the key events in the AID's KEL. Each witness creates a signed receipt of each event it witnesses, which is exchanged with the other witnesses (directly or indirectly). Based on those receipts, the witness pool uses an agreement algorithm called KAWA that provides high availability, fault tolerance, and security guarantees.  Thereby, an AID's witness pool would constitute a highly available and secure promulgation network for that AID.

Likewise, each controller acting as a validator of some other controller's events may create or choose a set or pool of watchers. The validator chooses how the watchers are hosted. It may use a witness service provided by some other party or may directly host its own watchers in its own infrastructure or some combination of the two. Nonetheless, the pool is under the ultimate control of the AID's event validator. To clarify, it is not under the control of the AID's controller. This means the validator may change its watcher infrastructure at will. Watchers are not AID specific; instead, they watch the KELs of any or all AIDs that are shared with them. Watchers are not explicitly managed by key events. This is so that the watcher infrastructure used by any validator may be kept confidential and, therefore, unknown to potential attackers. It is up to each validator to manage its watcher infrastructure as it sees fit. Each validator uses its own watcher pool to watch the KELs of other controllers. When an AID has witnesses, the watchers of one validator watch the witnesses of the AID of some other controller.  Each validator may use its own watcher pool to watch its own witness pool of AID that it itself controls in order to detect external attacks on its witnesses.

Watchers may also exchange signed receipts of key events in the KEL's they watch. Based on those receipts, a watcher pool could also employ the KAWA agreement algorithm to provide high availability, fault tolerance, and security guarantees.  Thereby, a given validator's watcher pool would constitute a highly available and secure confirmation network for any AIDs from other controllers it chooses to watch.

Watchers have a strong incentive to share all the KELs they watch. This is because Watchers follow a "first seen" policy (described in more detail below). Simply put, "first seen" means that only the first version of an event that a watcher receives is deemed by the watcher to be the one and only true version of the event. Any other versions received later are deemed invalid by that watcher, i.e., i.e., "first seen, always seen, never unseen." Thus, any later compromise of the authoritative key state for the associated AID can't produce an alternate version of the event that may supplant the first-seen version for a given watcher. Therefore, it is in the best interests of every honest AID controller to have its original version be accepted as first-seen) as widely and as quickly as possible in order to nullify any future potential exploits against its key state. It is also in the best interest of every validator to have their own watchers "first see" the earliest version of all key events from all other controllers because those earliest events are, by design, the least likely to have been compromised. This strongly incentivizes both parties to support a widespread low-latency global network of watchers and watcher pools that share their first-seen KELs.

Watchers may have different features. A watcher could choose to keep around any verifiable key events that differ from their first-seen version. These variants are, by nature, duplicitous; in order to be verifiable, a duplicitous variant must be properly fully signed and witnessed. The only way that two versions of a given event can be fully signed and witnessed is if the keys of the event's controller have been compromised by an attacker or the controller itself acted duplicitously. The two cases could be indistinguishable to a watcher. But both exhibit provable duplicity with regard to the key state. A watcher who records and provides such evidence of duplicity to other watchers is called a Juror. A Juror may be a member of a highly available, fault-tolerant pool of Jurors,  called a Jury. A watcher who evaluates key events based on the evidence of duplicity or lack thereof as provided by one or more Juries is called a Judge.  KERI, therefore by design, enables the duplicity evident exchange of data.

Ultimately, a validator decides whether or not to trust the key state of a given AID based on the evidence or lack thereof of duplicity. A given validator may choose to use Judge and Jury services to aid it in deciding whether or not to trust the key state of a given AID. An honest validator shall trust when there is no evidence of duplicity and shall not trust when there is any evidence of duplicity unless and until the duplicity has been reconciled. KERI provides mechanisms for duplicity reconciliation. These include key compromise recovery mechanisms. 


Diagram

#### Ecosystem

The open standard KERI protocol fosters an open competitive ecosystem of service providers for the various infrastructure components such as controller applications (wallets, key chains, and agents), witnesses, and watchers (Judges and Juries). Because there is no requirement for shared governance over any of the infrastructure components, each controller and each validator is free to choose their own service providers based on price, performance, ease of usability, etc. This enables competition across the full spectrum of infrastructure components. Thus, existing cloud and web infrastructure can be leveraged at comparable performance and price levels.  KERI, by design, fosters the development of a global watcher network that will eventually result in universal duplicity detectability and ambient verifiability with the goal of providing a universal DKMI in support of a trust-spanning layer for the internet.

Diagram


### KERI’s identifier system security overlay

The function of KERI's identifier-system security overlay is to establish the authenticity (or authorship) of the message payload in an IP Packet by verifiably attributing it to a cryptonymous Self-certifying identifier (an AID) via an attached set of one or more asymmetric keypair-based non-repudiable digital signatures. The current valid set of associated asymmetric keypair(s) is proven via a Verifiable data structure called the (KEL). The identifier system provides a mapping between the identifier and the keypair(s) that control the identifier, namely, the public key(s) from those keypairs. The private key(s) is secret and is not shared.

An authenticatable (Verifiable) internet message (packet) or data item includes the identifier and data in its payload. Attached to the payload is a digital signature(s) made with the private key(s) from the controlling keypair(s). Given the identifier in a Message, any Verifier of a Message (data item) can use the identifier system mapping to look up the public key(s) belonging to the controlling keypair(s). The Verifier can then verify the attached signature(s) using that public key(s). Because the payload includes the identifier, the signature makes a non-repudiable cryptographic commitment to both the source identifier and the data in the payload.

### Overcoming existing security overlay flaws

KERI overcomes  two major system security overlay flaws. The first major flaw  is that the mapping between the identifier (domain name) and the controlling keypair(s) is merely asserted by a trusted entity e.g., certificate authority (CA) via a certificate. Because the mapping is merely asserted, a Verifier can not verify cryptographically the mapping between the identifier and the controlling keypair(s) but must trust the operational processes of the trusted entity making that assertion, i.e.,  the CA who issued and signed the certificate. As is well known, a successful attack upon those operational processes may fool a Verifier into trusting an invalid mapping i.e., the certificate is issued to the wrong keypair(s) albeit with a Verifiable signature from a valid CA. Noteworthy is that the signature on the certificate is not made with the controlling keypairs of the identifier but made with keypairs controlled by the issuer i.e.,  the CA. The fact that the certificate is signed by the CA means that the mapping itself is not Verifiable but merely that the CA asserted the mapping between keypair(s) and identifier. The certificate merely provides evidence of the authenticity of the assignment of the mapping but not evidence of the veracity of the mapping.

The second major flaw is that when rotating the valid signing keys there is no cryptographically Verifiable way to link the new (rotated in) controlling/signing key(s) to the prior (rotated out) controlling/signing key(s). Key rotation is  asserted merely and implicitly by a trusted entity (CA) by issuing a new certificate with new controlling/signing keys.  Key rotation is necessary because over time the controlling keypair(s) of an identifier becomes weak due to exposure when used to sign Messages and must be replaced. An explicit Rotation mechanism first revokes the old keys and then replaces them with new keys. Even a certificate revocation list (CRL) as per [[spec: RFC5280]], with an online status protocol (OCSP) registration as per [[spec: RFC6960]], does not provide a cryptographically Verifiable connection between the old and new keys; This merely  is asserted. The lack of a single universal CRL or registry means that multiple potential replacements may be valid. From a cryptographic verifiability perspective, Rotation by assertion with a new certificate that either implicitly or explicitly provides revocation and replacement is essentially the same as starting over by creating a brand new independent mapping between a given identifier and the controlling keypair(s). This start-over style of Key rotation may well be one of the main reasons that other key assignment methods, such as Pretty Good Privacy (PGP's) web-of-trust failed. Without a universally Verifiable revocation mechanism, any Rotation (revocation and replacement) assertion by some certificate authority, either explicit or implicit, is mutually independent of any other. This lack of universal cryptographic verifiability of a Rotation fosters ambiguity as to the actual valid mapping at any point in time between the identifier and its controlling keypair(s). In other words, for a given identifier, any or all assertions made by some set of CAs may be potentially valid.

The KERI protocol fixes both of these flaws using a combination of AIDs, key pre-rotation, and a Verifiable data structure, the KEL, as verifiable proof of Key state and duplicity-evident mechanisms for evaluating and reconciling Key state by Validators. Unlike certificate transparency, KERI enables the detection of Duplicity in the Key state via non-repudiable cryptographic proofs of Duplicity not merely the detection of inconsistency in the Key state that may or may not be duplicitous.

### End-verifiable

A data item or statement is end-to-end-verifiable, or end-verifiable for short, when that data item may be cryptographically securely attributable to its source (party at the source end) by any recipient verifier (party at the destination end) without reliance on any infrastructure not under the verifier's ultimate control. KERI's end-verifiability is pervasive. It means that everything in KERI or that depends on KERI is also end-verifiable; therefore, KERI has no security dependency on any other infrastructure, including conventional PKI. It also does not rely on security guarantees that may or may not be provided by web or internet infrastructure.  KERI's identifier system-based security overlay for the Internet provides each identifier with a primary root-of-trust based on self-certifying, self-administering, self-governing Autonomic identifiers (AIDS) and Autonomic namespaces (ANs) that provide the trust basis for a universal Autonomic Identity System (AIS)[[ref: UIT]] [[ref: SCPK]] [[ref: SFS]] [[ref: SCPN]] [[ref: SCURL]]. This root-of-trust is cryptographic, not administrative because it does not rely on any trusted third-party administrative process but may be established with cryptographically verifiable data structures alone. 

Often, the two ends can not transmit data directly between each other but must relay that data through other components or infrastructure not under the control of either end. For example, Internet infrastructure is public and is not controlled by either end of a transmission. A term for any set of components that relays data between the ends or, equivalently, the party that controls it is the middle. The following diagram shows two ends communicating over the middle.

Diagram of end-to-end verifiability

End verifiability means that the end destination can verify the source of the data without having to trust the middle. This gives rise to the concept called ambient verifiability, where the source of any data can be verified anywhere, at any time, by anybody. Ambient verifiability removes any need to trust any of the components in the middle, i.e., the whole internet.

Another term for a party at one end of a transmission over a network (internet) is a network edge. End-verifiability of data means that if the edges of the network are secure, then the security of the middle doesn't matter. With KERI, the security of the edges is based primarily on the security of the key management at the edges. Therefore, a KERI-based system benefits greatly because protecting one's private keys is much easier than protecting all internet infrastructure.

True end-verifiability means that only non-repudiable digital signatures based on asymmetric, i.e., public key cryptography, can be used to securely attribute data to a cryptographically derived source identifier, i.e., AID. In this sense, data is authentic with respect to its source identifier when it is verifiably nonrepudiably signed with the authoritative keypairs for that identifier at the time of signing. The result is that KERI takes a signed-everything approach to data both in motion and at rest. This enables a no-shared-secret approach to primary authentication, i.e., the primary authenticity of a data item is not reliant on the sharing of secrets between the source and recipient of any data item. Common types of shared secrets used for authentication include passwords, bearer tokens, and shared encryption keys, which are all vulnerable to exploitation. The result of a no-shared-secret sign-everything approach is the strongest possible authenticity, which means secure attribution to an AID. 

End verifiability implies that the infrastructure needed to verify must be under the ultimate control of the verifier. Otherwise, the verifier must trust in infrastructure it does not control and, therefore, can't fully verify. Thus end-verifiability is a prerequisite for true zero-trust computing infrastructure, where zero-trust means never trust always verify. The infrastructure in KERI is therefore split into two parts, the infrastructure controlled by the securely attributable source of any information where that source is identified by its AID. The source is, therefore, the AID controller. The AID controller's infrastructure is its promulgation infrastructure. The output of the promulgation infrastructure is duplicity evident in cryptographically verifiable data structures that the verifier may verify. The verifier may employ its own infrastructure to aid it in both performing cryptographic verification and detecting duplicity. The verifier's infrastructure is its confirmation infrastructure. This bifurcated architecture over verifiable data is more succinctly characterized as shared data but no shared governance. This naturally supports a no-shared-secret approach to authentication. Shared governance also usually comes with security, portability, cost, and performance limitations, which limit its more universal adoptability.








### Self-certifying identifier (SCID)

The KERI identifier system overlay leverages the properties of cryptonymous Self-certifying identifiers (SCIDs) which are based on asymmetric public-key cryptography (PKI) to provide end-verifiable secure attribution of any message or data item without needing to trust in any intermediary. A SCID is uniquely cryptographically derived from the public key of an asymmetric keypair, (public, private). The identifier is self-certifying in the sense that it does not rely on a trusted entity. Any non-repudiable signature made with the private key may be verified by extracting the public key from either the identifier itself or incepting information uniquely associated with the cryptographic derivation process for the identifier. In a basic SCID, the mapping between an identifier and its controlling public key is self-contained in the identifier itself. A basic SCID is ephemeral i.e., it does not support Rotation of its keypairs in the event of key weakness or compromise and therefore must be abandoned once the controlling private key becomes weakened or compromised from exposure. The class of identifiers that generalize SCIDs with enhanced properties such as persistence is called Autonomic identifiers (AIDs).


### Autonomic identifier (AID) 

Use of a KEL gives rise to an enhanced class of SCIDs that are persistent, not ephemeral, because the SCID‘s keys may be refreshed or updated via Rotation, allowing secure control over the identifier in spite of key weakness or even compromise. This family of generalized enhanced SCIDs is called AIDs. Autonomic means self-governing, self-regulating, or self-managing and is evocative of the self-certifying, self-managing properties of this class of identifier. An AID may exhibit other self-managing properties, such as transferable control using key pre-rotation, which enables control over such an AID to persist in spite of key weakness or compromise due to exposure. Authoritative control over the identifier persists in spite of the evolution of the Key state.

### Key rotation/pre-rotation

An important innovation of KERI is that it solves the key Rotation problem of PKI (including that of simple SCIDs) via a novel but elegant mechanism called key pre-rotation. This pre-rotation mechanism enables an entity to persistently maintain or regain control over an identifier in spite of the exposure-related weakening over time or even compromise of the current set of controlling (signing) keypairs. With key pre-rotation, control over the identifier can be re-established by rotating to a one-time use set of unexposed but pre-committed rotation keypairs that then become the current signing keypairs. Each Rotation in turn cryptographically commits to a new set of rotation keys but without exposing them. Because the pre-rotated keypairs need never be exposed prior to their one-time use, their attack surface may be optimally minimized. The current Key state is maintained via a KEL , an append-only Verifiable data structure .  Cryptographic verifiability of the Key state over time is essential to remove this ambiguity over the mapping between the identifier (domain name) and the controlling keypair(s). Without this verifiability, the detection of potential ambiguity requires yet another bolt-on security overlay such as the certificate transparency system.

### Qualified Cryptographic Primitives

A Cryptographic primitive is a serialization of a value associated with a cryptographic operation including but not limited to a digest (hash), a salt, a seed, a private key, a public key, or a signature. Furthermore, a Qualified cryptographic primitive includes a prepended derivation code (as a proem) that indicates the cryptographic algorithm or suite used for that derivation. This simplifies and compactifies the essential information needed to use that Cryptographic primitive.  All Cryptographic primitives in KERI must be expressed using the CESR (Compact Event Streaming Representation) protocol  [[ref: CESR]].  A property of CESR is that all cryptographic primitives so expressed in either its Text or Binary domains are qualified by construction. Indeed, cryptographic primitive qualification is an essential property of CESR which makes a uniquely beneficial encoding for a cryptographic primitive heavy protocol like KERI.



::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/44
:::


### CESR Encoding

As stated previously, KERI represents all cryptographic primitives with CESR (Composable Event Streaming Representation) [[ref: CESR]]. CESR supports round-trip lossless conversion between its Text, Binary, and Raw domain representations and lossless composability between its Text and Binary domain representations. Composability is ensured between any concatenated group of text Primitives and the binary equivalent of that group because all CESR Primitives are aligned on 24-bit boundaries. Both the text and binary domain representations are serializations suitable for transmission over the wire. The Text domain representation is also suitable to be embedded as a string value of a field or array element as part of a field map serialization such as JSON, CBOR, or MsgPack. The Text domain uses the set of characters from the URL-safe variant of Base64 which in turn is a subset of the ASCII character set. For the sake of readability, all examples in this specification are expressed in CESR's Text domain.

The CESR protocol supports several different types of encoding tables for different types of derivation codes used to qualify primitives. These tables include very compact codes. For example, a 256-bit (32-byte) digest using the BLAKE3 digest algorithm, i.e.,  Blake3-256, when expressed in Text domain CESR, consists of 44 Base64 characters that begin with the one character derivation code `E`, such as `EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug`. The equivalent qualified Binary domain representation consists of 33 bytes. Unless otherwise indicated, all Cryptographic primitives used in this specification are qualified Primitives expressed in CESR’s Text domain. This includes serializations that are signed, hashed, or encrypted.


### Basic fractionally weighted threshold 

This partial Rotation feature for either reserve or Custodial rotation authority is best employed with thresholds that are fractionally weighted. The exact syntax for fractionally weighted thresholds is provided in the partial pre-rotation and Custodial rotation sections and a summary is provided here. A fractionally weighted threshold consists of a list of one or more clauses where each clause is itself a list of legal rational-fractions ( i.e., ratios of non-negative integers expressed as fractions, where zero is not allowed in the denominator). Each entry in each clause in the fractional weight list corresponds one-to-one to a public key appearing in a key list in an Establishment event. Key lists order a key set. A weight list of clauses orders a set of rational fraction weights. Satisfaction of a fractionally weighted threshold requires satisfaction of each and every clause in the list. In other words, the clauses are logically ANDed together. Satisfaction of any clause requires that the sum of the weights in that clause that corresponds to verified signatures on that event must sum to at least a weight of one. Using rational fractions and rational fraction summation avoids the problem of floating-point rounding errors and ensures the exactness and universality of threshold satisfaction computations.

For example, consider the following simple single clause fractionally weighted threshold, [1/2, 1/2, 1/2].  Three weights mean there must be exactly three corresponding key pairs. Let the three keypairs in one-to-one order be denoted by the list of indexed public keys, [A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>]. The threshold is satisfied if any two of the public keys sign because 1/2 + 1/2 = 1. This is exactly equivalent to an integer-valued ‘2 of 3’ threshold.

The order of appearance of the public key in a given key list and its associated threshold weight list must be the same.

Fractionally weighted thresholds become more interesting when the weights are not all equal or include multiple clauses. Consider the following five-element single clause fractionally weighted threshold list, [1/2, 1/2, 1/2, 1/4, 1/4] and its corresponding public key list, [A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, A<sup>3</sup>, A<sup>4</sup>].  Satisfaction would be met given signatures from any two or more of A<sup>0</sup>, A<sup>1</sup>, or A<sup>2</sup> because each of these keys has a weight of 1/2 and the combination of any two or more sums to 1 or more. Alternatively, satisfaction would be met with signatures from any one or more of A<sup>0</sup>, A<sup>1</sup>, or A<sup>2</sup> and both of A<sup>3</sup>, and A<sup>4</sup> because any of those combinations would sum to 1 or more. Because participation of A<sup>3</sup> and A<sup>4</sup> is not required as long as at least two of A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> are available then A<sup>3</sup> and A<sup>4</sup> may be treated as reserve members of the controlling set of keys. These reserve members only need to participate in the event that only one of the other three is available. The flexibility of a fractionally weighted threshold enables redundancy in the combinations of keys needed to satisfice for both day-to-day and reserve contingency use cases.

### KERI’s secure bindings

In simple form , an identifier-system security-overlay binds together a triad consisting of the identifier, keypairs, and Controllers, the set of entities whose members control a private key from the given set of keypairs. The set of Controllers is bound to the set of keypairs, the set of keypairs is bound to the identifier, and the identifier is bound to the set of Controllers. This binding triad can be diagrammed as a triangle where the sides are the bindings and the vertices are the identifier, the set of Controllers, and the set of keypairs. This triad provides verifiable control authority for the identifier.

When these bindings are strong, then the overlay is highly unvunerable to attack.  In contrast, when these bindings are weak, then the overlay is highly vunerable to attack. With KERI all the bindings of the triad are strong because they are cryptographically Verifiable with a minimum cryptographic strength or level of approximately 128 bits. See the Annex A on cryptographic strength for more detail.

The bound triad is created as follows:

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/33
:::

Each Controller in the set of Controllers creates an asymmetric `(public, private)` keypair. The public key is derived from the private key or seed using a one-way derivation that must have a minimum cryptographic strength of approximately 128 bits. Depending on the crypto-suite used to derive a keypair, the private key or seed may itself have a length larger than 128 bits. A Controller may use a cryptographic strength pseudo-random number generator (CSPRNG) to create the private key or seed material.

Because the private key material must be kept secret, typically in a secure data store, the management of those secrets may be an important consideration. One approach to minimize the size of secrets is to create private keys or seeds from a secret salt. The salt must have an entropy of approximately 128 bits. Then the  salt may be stretched to meet the length requirements for the crypto suite's private key size. In addition, a hierarchical deterministic derivation function may be used to further minimize storage requirements by leveraging a single salt for a set or sequence of private keys. 
Because each Controller is the only entity in control (custody) of the private key, and the public key is universally uniquely derived from the private key using a cryptographic strength one-way function, then the binding between each Controller and their keypair is as strong as the ability of the Controller to keep that key private. The degree of protection is up to each Controller to determine. For example, a Controller could choose to store their private key in a safe, at the bottom of a coal mine, air-gapped from any network, with an ex-special forces team of guards. Or the Controller could choose to store it in an encrypted data store (key chain) on a secure boot mobile device with a biometric lock, or simply write it on a piece of paper and store it in a safe place. The important point is that the strength of the binding between Controller and keypair does not need to be dependent on any trusted entity.

The identifier is derived universally and uniquely from the set of public keys using a one-way derivation function. It is therefore an AID (qualified SCID). Associated with each identifier (AID) is incepting information that must include a list of the set of qualified public keys from the controlling keypairs. In the usual case, the identifier is a qualified cryptographic digest of the serialization of all the incepting information for the identifier. Any change to even one bit of the incepting information changes the digest and hence changes the derived identifier. This includes any change to any one of the qualified public keys including its qualifying derivation code. To clarify, a qualified digest as identifier includes a derivation code as proem that indicates the cryptographic algorithm used for the digest. Thus, a different digest algorithm results in a different identifier. In this usual case, the identifier is bound strongly and cryptographically to not only the public keys but also any other incepting information from which the digest was generated.

A special case may arise when the set of public keys has only one member, i.e., there is only one controlling keypair. In this case, the Controller of the identifier may choose to use only the qualified public key as the identifier instead of a qualified digest of the incepting information. In this case, the identifier still is bound strongly to the public key but is not so strongly bound to any other incepting information.  A variant of this single keypair special case is an identifier that can not be rotated. Another way of describing an identifier that cannot be rotated is that it is a non-transferable identifier because control over the identifier cannot be transferred to a different set of controlling keypairs. In contrast, a rotatable keypair is transferable because control may be transferred via rotation to a new set of keypairs. Essentially, when non-transferable, the identifier's lifespan is ephemeral, not persistent, because any weakening or compromise of the controlling keypair means that the identifier must be abandoned. Nonetheless, there are important use cases for an ephemeral SCID.  In all cases, the derivation code in the identifier indicates the type of identifier, whether it be a digest of the incepting information (multiple or single keypair) or a single member special case derived from only the public key (both ephemeral or persistent).

Each Controller in a set of Controllers may prove its contribution to the control authority over the identifier in either an interactive or non-interactive fashion. One form of interactive proof is to satisfy a challenge of that control. The challenger creates a unique challenge Message. The Controller responds by non-repudiably signing that challenge with the private key from the keypair under its control. The challenger can then cryptographically verify the signature using the public key from the Controller's keypair. One form of non-interactive proof is to periodically contribute to a monotonically increasing sequence of non-repudiably signed updates of some data item. Each update includes a monotonically increasing sequence number or date-time stamp. Any Verifier then can  verify cryptographically the signature using the public key from the Controller's keypair and verify that the update was made by the Controller. In general, only members of the set of Controllers can create verifiable non-repudiable signatures using their keypairs. Consequently, the identifier is strongly bound to the set of Controllers via provable control over the keypairs.

#### Tetrad bindings

At Inception, the triad of identifier, keypairs, and Controllers are strongly bound together. But in order for those bindings to persist after a key Rotation, another mechanism is required. That mechanism is the KEL, a Verifiable data structure [[ref: KERI-WP]] [[ref: VDS]].  The KEL is not necessary for identifiers that are non-transferable and do not need to persist control via key Rotation in spite of key weakness or compromise. To reiterate, transferable (persistent) identifiers each need a KEL, non-transferable (ephemeral) identifiers do not.

For persistent (transferable) identifiers, this additional mechanism may be bound to the triad to form a tetrad consisting of the KEL, the identifier, the set of keypairs, and the set of Controllers. The first entry in the KEL is called the Inception event  which is a serialization of the incepting information associated with the identifier mentioned previously.

The Inception event must include the list of controlling public keys and also must include a signature threshold and must be signed by a set of private keys from the controlling keypairs that satisfy that threshold. Additionally, for transferability (persistence across Rotation) the Inception event also must include a list of digests of the set of pre-rotated public keys and a pre-rotated signature threshold that will become the controlling (signing) set of keypairs and threshold after a Rotation.  A non-transferable identifier may have a trivial KEL that only includes an Inception event but with a null set (empty list) of pre-rotated public keys.

A Rotation is performed by appending a Rotation event to the KEL. A Rotation event must include a list of the set of pre-rotated public keys (not their digests) thereby exposing them and must be signed by a set of private keys from these newly exposed newly controlling but pre-rotated keypairs that satisfy the pre-rotated threshold. The Rotation event also must include a list of the digests of a new set of pre-rotated keys as well as the signature threshold for the set of pre-rotated keypairs. At any point in time, the transferability of an identifier can be removed via a Rotation event that rotates to a null set (empty list) of pre-rotated public keys.

Each event in a KEL must include an integer sequence number that is one greater than the previous event. Each event after the Inception event also must include a cryptographic digest of the previous event. This digest means that a given event is bound cryptographically to the previous event in the sequence. The list of digests or pre-rotated keys in the Inception event cryptographically binds the Inception event to a subsequent Rotation event, essentially making a forward commitment that forward chains together the events. The only valid Rotation event that may follow the Inception event must include the pre-rotated keys. But only the Controller who created those keys and created the digests may verifiably expose them. Each Rotation event in turn makes a forward commitment (chain) to the following Rotation event via its list of pre-rotated key digests.   This makes the KEL a doubly (backward and forward) hash (digest) chained non-repudiably signed append-only Verifiable data structure.

Because the signatures on each event are non-repudiable, the existence of an alternate but Verifiable KEL for an identifier is provable evidence of Duplicity. In KERI, there may be at most one valid KEL for any identifier or none at all. Any Validator of a KEL may enforce this one valid KEL rule before relying on the KEL as proof of the current key state for the identifier which protects the Validator. Any unreconcilable evidence of Duplicity means the Validator does not trust (rely on) any KEL to provide the key state for the identifier. Rules for handling reconciliable Duplicity will be discussed In section [.  ] From a Validator's perspective, either there is one-and-only-one valid KEL or none at all which also protects the Validator by removing any potential ambiguity about Key state.  The combination of a Verifiable KEL made from non-repudiably signed backward and forward hash chained events together with the only-one-valid KEL rule strongly binds the identifier to its current Key state as given by that one valid KEL or not at all. This in turn binds the identifier to the Controllers of the current keypairs given by the KEL thus completing the tetrad.

At Inception, the KEL may be bound even more strongly to its tetrad by deriving the identifier from a digest of the Inception event so that even one change in not only the original controlling keys pairs but also the pre-rotated keypairs or any other incepting information included in the Inception event will result in a different identifier.

The essence of the KERI protocol is a strongly bound tetrad of identifier, keypairs, Controllers, and the KEL that forms the basis of its identifier system security overlay. The KERI protocol introduces the concept of Duplicity evident programming via Duplicity evident Verifiable data structures. 

### Autonomic Namespaces

A namespace groups symbols or identifiers for a set of related objects [[ref: Namespace]]. In an identity system, an identifier can be generalized as belonging to a namespace that provides a systematic way of organizing related identifiers with their resources and attributes. 
To elaborate, a namespace employs some scheme for assigning identifiers to the elements of the namespace. A simple name-spacing scheme uses a prefix or prefixes in a hierarchical fashion to compose identifiers. The following is an example of a namespace scheme for addresses within the USA that uses a hierarchy of prefixes:
	state.county.city.zip.street.number.	
An example element in this namespace may be identified with the following:
	utah.wasatch.heber.84032.main.150S.	
where each prefix location has been replaced with the actual value of the element of the address. Namespaces provide a systematic way of organizing related elements and are widely used in computing. 

An autonomic namespace (AN) is defined as a namespace with a fully qualified CESR encoded autonomic identifier (AID) cryptographic primitive as a prefix. As defined above, autonomic identifiers (AIDs) are uniquely (strongly) cryptographically bound to their incepting controlling keypair(s) at issuance. They are, hence, self-certifying. In addition, AIDs are also bound to other key management information, such as the hashes of the next prerotated rotation keys and their witnesses. This makes them self-managing. 

To clarify, each identifier from an autonomic namespace (AN) includes as a prefix an identifier encoded in CESR that either is the public key or is uniquely cryptographically derived from the public key(s) of the incepting (public, private) key pair. The associated private key(s) may then be used by the controller to authoritatively (nonrepudiably) sign statements that authenticate and authorize the use of the identifier. These statements include responses to challenges to prove control over the identifier. Thus, self-certification enables both self-authentication and self-authorization capabilities as well as self-management of cryptographic signing keypairs. Together, these properties make the namespace self-administering. 

An autonomic namespace is self-certifying and self-administrating.

These self-administering properties of an autonomic namespace (AN) mean that the resources identified by that namespace may also be governed by the controller of the key pair(s) that are authoritative for its autonomic identifier (AID) prefix. Essentially, a namespace of identifiers may be imbued with the secure attributability properties of an AID as its prefix. When secure attribution arises solely from the AID as the prefix, then the other elements in the namespace syntax do not matter. From a security perspective, this makes the prefix agnostic about the syntax of any autonomic namespaces it appears in. The same AID can be used to control multiple disparate namespaces. This provides opportunities for AIDs to interoperate with many existing namespaces. One need merely extract the AID prefix from any autonomically namespaced identifier to use the prefix with a KERI protocol library. 

In general, a fully qualified autonomic identifier primitive and an identifier from an autonomic namespace with that primitive as a prefix may both be referred to as autonomic identifiers with the understanding that any cryptographic operations only apply to the prefix portion of the namespaced identifier.

The primary purpose of an autonomic identity (identifier) system (AIS) is to enable any entity to establish control over its associated identifier namespace in an independent, interoperable, and portable way. This approach builds on the idea of an identity (identifier) meta-system {{[37; 38; 153]}} that enables interoperability between systems of identity (identifiers) that not only exposes a unified interface but adds decentralized control over their identifiers. This best enables portability, not just interoperability. Given portability in an identity (identifier) meta-system system, transitive trust can occur, that is, the transfer of trust between contexts or domains. Because transitive trust facilitates the transfer of other types of value, a portable decentralized identity meta-system, e.g., an autonomic identifier system, enables an identity meta-platform for commerce {{[134]}}. 

## KERI data structures and labels

### KERI data structure format

A KERI data structure such as a Key event Message body may be abstractly modelled as a nested key: value mapping. To avoid confusion with the cryptographic use of the term key, the term field is used instead to refer to a mapping pair and the terms field label and field value for each member of a pair. These pairs can be represented by two tuples e.g.,(label, value). When necessary, this terminology is qualifed by using the term field map to reference such a mapping. Field maps may be nested where a given field value is itself a reference to another field map and are referred to as a nested field map or simply a nested map for short. 

A field may be represented by a framing code or block delimited serialization.  In a block delimited serialization, such as JSON, each field map is represented by an object block with block delimiters such as `{}`. Given this equivalence, the term block or nested block can be used as synonymous with field map or nested field map. In many programming languages, a field map is implemented as a dictionary or hash table in order to enable performant asynchronous lookup of a field value from its field label. Reproducible serialization of field maps requires a canonical ordering of those fields. One such canonical ordering is called insertion or field creation order. A list of (field, value) pairs provides an ordered representation of any field map. 

Most programming languages now support ordered dictionaries or hash tables that provide reproducible iteration over a list of ordered field (label, value) pairs where the ordering is the insertion or field creation order. This enables reproducible round trip serialization/deserialization of field maps. Serialized KERI data structures depend on insertion-ordered field maps for their canonical serialization/deserialization. KERI data structures support multiple serialization types, namely JSON, CBOR, MGPK, and CESR but for the sake of simplicity, JSON only will be used for examples. The basic set of normative field labels in KERI field maps is defined in the table in the following section.

#### KERI field labels for data structures

[//]: # (: KERI field labels for data structures {#tbl:field-lables})

|Label|Title|Description|Notes|
|---|---|---|---|
|v| Version String | | |
|i| Identifier Prefix  (AID) |  | |
|s| Sequence Number |  | |
|t| Message Type | | |
|te| Last received Event Message Type in a Key State Notice | | |
|d| Event SAID ||
|p| Prior Event SAID | | |
|kt| Keys Signing Threshold || |
|k| List of Signing Keys (ordered key set)| | |
|nt| Next Keys Signing Threshold || |
|n| List of Next Key Digests (ordered key digest set) |   | |
|bt| Backer Threshold || |
|b| List of Backers  (ordered backer set of AIDs) | | |
|br| List of Backers to Remove (ordered backer set of AIDS) | | |
|ba| List of Backers to Add (ordered backer set of AIDs) | | |
|c| List of Configuration Traits/Modes |  | |
|a| List of Anchors (seals) || |
|di| Delegator Identifier Prefix  (AID) | | |
|rd| Merkle Tree Root Digest (SAID) || |
|ee| Last Establishment Event Map | | |
|vn| Version Number ("major.minor")  |  | |

A field label may have different values in different contexts but must not have a different field value type. This requirement makes it easier to implement in strongly typed languages with rigid data structures. Notwithstanding the former, some field value types may be a union of elemental value types.

Because the order of appearance of fields is enforced in all KERI data structures, whenever a field appears (in a given Message or block in a Message) the message in which a label appears must provide the necessary context to fully determine the meaning of that field and hence the field value type and associated semantics.

#### Compact KERI field labels

The primary field labels are compact in that they use only one or two characters. KERI is meant to support resource-constrained applications such as supply chain or IoT (Internet of Things) applications. Compact labels better support resource-constrained applications in general. With compact labels, the over-the-wire verifiable signed serialization consumes a minimum amount of bandwidth. Nevertheless, without loss of generality, a one-to-one normative semantic overlay using more verbose expressive field labels may be applied to the normative compact labels after verification of the over-the-wire serialization. This approach better supports bandwidth and storage constraints on transmission while not precluding any later semantic post-processing. This is a well-known design pattern for resource-constrained applications.

#### Special label ordering requirements


::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/20
:::

##### Version string field

The version string, `v`, field MUST be the first field in any top-level KERI field map. It provides a regular expression target for determining a serialized field map's serialization format and size (character count) that constitutes a KERI message body. A stream parser may use the version string to extract and deserialize (deterministically) any serialized stream of KERI message bodies in a set of KERI field maps. Each KERI message body in a stream may use a different serialization type.

The format of the version string is `KERIVVVKKKKBBBB_`. It is 16 characters in length and is divided into five parts: protocol, version, serialization kind, serialization length, and terminator. The first four characters, `KERI,` indicate the protocol. The CESR encoding standard supports multiple protocols, `KERI` being one of them.  The next three characters, `VVV` provide in Base64 notation the major and minor version numbers of the version of the KERI protocol specification. The first `V` character provides the major version number and the final two `VV` characters provide the minor version number. For example, `CAA` indicates major version 2 and minor version 00 or in dotted-decimal notation, i.e., `2.00`. Likewise, `CAQ` indicates major version 2 and minor version decimal 16 or in dotted-decimal notation `1.16`. The version part supports up to 64 major versions with  4096 minor versions per major version. The next four characters `KKKK` indicate the serialization kind in uppercase. The four supported serialization kinds are `JSON`, `CBOR`, `MGPK`, and `CESR` for the JSON, CBOR, MessagePack, and CESR serialization standards, respectively [[spec: RFC4627]] [[spec: RFC4627]] [[ref: CBOR]] [[ref: RFC8949]] [[ref: MGPK]] [[ref: CESR]]. The next six characters provide in Base64  notation the total length of the serialization, inclusive of the version string and any prefixed characters or bytes. This length is the total number of characters in the serialization of the KERI message body. The maximum length of a given KERI message body is thereby constrained to be *2<sup>24</sup> = 16,777,216* characters in length. The final character `_` is the version string terminator. This enables later versions of KERI to change the total version string size and thereby enable versioned changes to the composition of the fields in the version string while preserving deterministic regular expression extractability of the version string. 

Although a given KERI message body serialization kind may have characters or bytes such as field map delimiters or framing codes that appear before, i.e., prefix the version string field in a serialization, the set of possible prefixes for each of the supported serialization kinds is sufficiently constrained by the allowed serialization protocols to guarantee that a regular expression can determine unambiguously the start of any ordered field map serialization that includes the version string as the first field value. Given the length from the version string, a parser may then determine the end of the serialization so that it can extract the full KERI message body from the stream without first deserializing it. This enables performant stream parsing and off-loading of KERI streams that include any or all of the supported serialization types.

##### Legacy version string field format

Compliant KERI version 2.XX implementations shall support the old KERI version 1.XX version string format to properly verify KELs created with 1.XX format events.

The format of the version string for KERI 1.XX is `KERIvvKKKKllllll_`. It is 16 characters in length and is divided into five parts: protocol, version, serialization kind, serialization length, and terminator. The first four characters, `KERI,` indicate the protocol. The CESR encoding standard supports multiple protocols, `KERI` being one of them.  The next two characters, `vv` provide the major and minor version numbers of the version of the KERI protocol specification in lowercase hexadecimal notation. The first `v` provides the major version number, and the second `v` provides the minor version number. For example, `01` indicates major version 0 and minor version 1 or in dotted-decimal notation `0.1`. Likewise, `1c` indicates major version 1 and minor version decimal 12 or in dotted-decimal notation `1.12`. The next four characters `KKKK` indicate the serialization kind in uppercase. The four supported serialization kinds are `JSON`, `CBOR`, `MGPK`, and `CESR` for the JSON, CBOR, MessagePack, and CESR serialization standards, respectively [[spec: RFC4627]] [[spec: RFC4627]] [[ref: CBOR]] [[ref: RFC8949]] [[ref: MGPK]] [[ref: CESR]]. The next six characters provide in lowercase hexadecimal notation the total length of the serialization, inclusive of the version string and any prefixed characters or bytes. This length is the total number of characters in the serialization of the KERI message body. The maximum length of a given KERI message body is thereby constrained to be *2<sup>24</sup> = 16,777,216* characters in length. For example, when the length of serialization is 384 decimal characters/bytes, the length part of the version string has the value `000180`. The final character `_` is the version string terminator. This enables later versions of KERI to change the total version string size and thereby enable versioned changes to the composition of the fields in the version string while preserving deterministic regular expression extractability of the version string. 

##### SAID (Self-Addressing identifier) fields

Some fields in KERI data structures may have a SAID (self-referential content addressable), as a field value. In this context, `d` is short for digest, which is short for SAID. A SAID follows the SAID protocol. A SAID is a special type of cryptographic digest of its encapsulating field map (block). The encapsulating block of a SAID is called a SAD (Self-Addressed Data). Using a SAID as a field value enables a more compact but secure representation of the associated block (SAD) from which the SAID is derived. Any nested field map that includes a SAID field (i.e., is, therefore, a SAD) may be compacted into its SAID. The uncompacted blocks for each associated SAID may be attached or cached to optimize bandwidth and availability without decreasing security.

Each SAID provides a stable universal cryptographically verifiable and agile reference to its encapsulating block (serialized field map).

A cryptographic commitment (such as a digital signature or cryptographic digest) on a given digest with sufficient cryptographic strength including collision resistance is equivalent to a commitment to the block from which the given digest was derived. Specifically, a digital signature on a SAID makes a Verifiable cryptographic non-repudiable commitment that is equivalent to a commitment on the full serialization of the associated block from which the SAID was derived. This enables reasoning about KERI data structures in whole or in part via their SAIDS in a fully interoperable, Verifiable, compact, and secure manner. This also supports the well-known bow-tie model of Ricardian Contracts [[ref: RC]]. This includes reasoning about the whole KERI data structure given by its top-level SAID, `d`, field as well as reasoning about any nested or attached data structures using their SAIDS.

##### AID fields

Some fields, such as the `i` and `di` fields, must each have an AID as its value. An AID is a fully qualified SCID as described above [[ref: KERI]] [[ref: KERI-WP]]. An AID must be self-certifying.
In this context, `i` is short for `ai`, which is short for the Autonomic identifier (AID). The AID given by the `i` field may also be thought of as a securely attributable identifier, authoritative identifier, authenticatable identifier, authorizing identifier, or authoring identifier. Another way of thinking about an `i` field is that it is the identifier of the authoritative entity to which a statement may be securely attributed, thereby making the statement verifiably authentic via a non-repudiable signature made by that authoritative entity as the Controller of the private key(s).

###### Namespaced AIDs 
As explained above, because KERI is agnostic about the namespace for any particular AID, different namespace standards may be used to express KERI AIDs within AID fields in an ACDC. Only the fully qualified CESR encoded AID prefix is used by KERI to process messages. Interoperability is assured by extracting the prefix from any namespaced identifier. Some of the examples below may use the W3C DID namespace specification with the `did:keri` method [[ref: DIDK-ID]]. However, the examples would have the same validity from a KERI perspective if some other supported namespace was used or no namespace was used at all. The latter case consists of a bare KERI AID (identifier prefix).

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/19
:::

Because AIDs may be namespaced, the essential component of an AID is the cryptographically derived Controller identifier prefix.  An AID must be the Controller identifier prefix.  part of a W3C Decentralized Identifier (DID) [[spec: did-core]] or other namespace convention.


##### Next Threshold field

The `nt` field is next threshold for the Next establishment event.

Common normalized ACDC and KERI labels

`v` is the Version string
`d` is the SAID of the enclosing block or map
`i` is a KERI identifier AID
`a` is the data attributes or data anchors depending on the message type

##### Configuration traits field

The configuration traits, `c` field is a list of specially defined strings. Each string represents a configuration trait for the KEL. The following table defines the configuration traits. Some configuration traits may only appear in the Inception (delegated or not) for the KEL. Others may appear in either the inception event and rotation events (delegated or not). This is indicated in the third column. A Validator of an event shall invalidate  i.e., drop any events that do not satisfy the constraints imposed by their configuration traits. If two conflicting configuration traits appear in the same list, then the latter trait supersedes the earlier one.

|Trait|Title|Inception Only|Description|
|:---:|:---|:---:|:---|
|`EO`| Establishment Only | True |Only establishment events shall appear in this KEL | 
|`DND`| Do Not Delegate | True | This KEL shall not act as a delegator of delegated AIDs| 
|`NRB`| No Registrar Backers | True | This KEL shall not allow any registrar backers | 
|`RB`| Registrar Backers | False | The backer list provides registrar backer AIDs | 

The "Establishment Only", `EO` config trait enables the Controller to increase its KELs security by not allowing interaction (non-establishment) events. This means all events must be signed by first-time, one-time pre-rotated keys. There is no possibility of
key compromise due to repeated exposure of signing keys on interaction events. A Validator shall invalidate, i.e., drop any non-establishment events.

The "Do Not Delegate", `DND` config trait enables the Controller to limit delegations entirely or limit the depth to which a given AID can delegate. This prevents spurious delegations. A delegation seal may appear in an Interaction event.  Interaction events are less secure than rotation events so this configuration trait prevents delegations.  In addition, a Delegatee holds its own private keys. Therefore, a given delegate could delegate other AIDS via interaction events that do not require the approval of its delegate. A Validator shall invalidate, i.e., drop any delegated events whose Delegator has this configuration trait.

The "No Registrar Backer," `NRB` config trait enables the Controller to protect itself from an attempt to change from a witnessed secondary root of trust to a ledger secondary root of trust via a ledger registrar backer.  A Validator shall invalidate, i.e., drop any rotation events that attempt to use the Registrar Backer, `RB` configuration trait.

The "Registrar Backer," `RB` config trait indicates that the backer (witness) list in the establishment event in which this trait appears provides the AIDs of ledger registrar backers. The event must also include Registar Backer Seal for each registrar backer in the list.  A Validator shall invalidate, i.e., drop any rotation events that attempt to use this Registrar Backer, `RB` configuration trait if the inception event includes an active "No Registrar Backer", `NRB` config trait. In the event that the inception event includes both an `NRB` and `RB` configuration trait in its list, then the latter is enforced, i.e., activated, and the former is ignored.





###  Seals

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/21
:::

The dictionary definition of the seal is "evidence of authenticity". Seals make a verifiable, nonrepudiable commitment to an external serialized data item without disclosing the item and also enable that commitment to the external data to be bound to the key state of a KEL at the location of the seal. This provides evidence of authenticity while maintaining confidentiality. This also enables the validity of the commitment to persist in spite of later changes to the key state. This is an essential feature for unbounded term but verifiable issuances. This also enables an endorsed issuance using one key state with later revocation of that issuance using a different key state. The order of appearance of seals in a KEL provides a verifiable ordering of the associated endorsements of that data, which can be used as a foundation for ordered verifiable transactions. Seals enable authenticatable transactions that happen externally to the KEL.

The collision resistance of a cryptographic strength digest makes it computationally infeasible for any other serialized data to have the same digest. Thus, a non-repudiable signature on a digest of serialized data is equivalent to such a signature on the serialized data itself. Because all key events in a KEL are signed by the controller of that KEL, the inclusion of a seal in a key event is equivalent to signing the external data but without revealing that data. When given the external data, a Validator can verify that the seal is a digest of that data and hence verify the equivalent nonredudiable commitment. A seal, at a minimum, includes a cryptographic digest of the serialized external data, usually its SAID. The external data may itself be composed of digests of other data. 

Seals may also be used as attachments to events to provide a reference for looking up the key state to be used for signatures on that event. The semantics of a given seal are also modified by the context in which the seal appears, such as appearing in the seal list of a key event in a KEL as opposed to appearing as an attachment to an event or receipt of an event.

#### Digest seal

The value of this seal's `d` field is an undifferentiated digest of some external data item.  If the data is a SAD, then the value is its SAID. This is the JSON version. There is also a native CESR version.

```json
{
  "d": "Eabcde..."
}
```

#### Merkle Tree root digest seal

The value of this seal's `d` field is root of a Merkle tree of digests of external data.  This enables a compact commitment to a large number of data items. A Merkle tree is constructed so that an inclusion proof of a given digest in the tree does not require disclosure of the whole tree.  The JSON version is shown. There is also a native CESR version of the seal.

```json
{
  "rd": "Eabcde8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}
```

#### Event seal

Event seals bind an event from some other (external) KEL or other type of event log to an event in the KEL that the seal appears. This provides an implicit approval or endorsement of that external event. The `i` field value is the AID of the external event log. The `s` field value is the sequence number of the event in the external event log. It is in lower case hexidecimal text with no leading zeros. The `d` field value is the SAID of the external event. Event seals are used for endorsing delegated events and for endorsing external issuances of other types of data. The JSON version is shown. There is also a CESR native version of the seal.

```json
{

  "i": "Ebietyi8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM.",
  "s": "3",
  "d": "Eabcde8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}
```


#### Lastest establishment event seal

The latest establishment event seal's function is similar to the event seal above except that it does not designate a specific event but merely designates that latest establishment event in the external KEL for the AID given as its `i` field value. 
This seal endorses or approves or commits to the key state of the latest establishment event of the external KEL. This is useful for endorsing a message
The JSON version is shown. There is also a native CESR version of the seal.

```json
{
  "i": "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
}
```

#### Registrar backer seal

When a ledger backer or backers are used as a secondary root-of-trust instead of a Witness pool, then a backer seal is required. The backer registrar is responsible for anchoring key events as transactions on the ledger. In addition to the backer seal, the establishment event that designates the backer must also include a configuration trait (see below) of `RB` for registrar backers. This indicates that the KEL is ledger registrar-backed instead of witness pool-backed. 

The  `bi` field value in the seal is the non-transferable identifier of the registrar backer (backer identifier). The first seal appearing in the seal list containing the event whose `bi` field matches that registrar backer identifier is the authoritative one for that registrar (in the event that there are multiple registrar seals for the same `bi` value).
The `d` field value in the seal shall be the SAID of the associated metadata SAD that provides the backer registrar metadat. The SAD may appear as the value of the seal data, `sd` field is an associated bare, `bar` message (defined later). The nested `d` said of this `sd` block in the bare message shall be the `d` field in the associated seal. This metadata could include the address used to source events onto the ledger, a service endpoint for the ledger registrar, and a corresponding ledger oracle.

To reiterate, the seal must appear in the same establishment event that designates the registrar backer identifier as a backer identifier in the event's backer's list along with the config trait `RB`. 

The JSON version is shown. There is also a native CESR version of the seal.


```json
{
  "bi": "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "d" : "EFGKDDA8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}
```

Attached bare, `bar` message.


```json
{ 
  "v": "KERI10JSON00011c_",
  "t": "bar",
  "d": "EFGKDDA8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "r": "process/registrar/bitcoin",
  "a":
  {
    "d" : "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i" : "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "s" : "5",
    "bi", "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
    "sd":  
    {
       "d": "EaAoTNZH3ULvYAfSVPzhzS6b5CMaU6JR2nmwyZ-i0d8J",
       "stuff": "meta data field"
     }  
  }
}
```


### Key event messages (Non-delegated)

The convention for field ordering is to put the fields that are common to all Message types first followed by fields that are not common. The common fields are `v`, `t`, `d` in that order.

#### Inception Event Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/42
:::

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/39
:::

```json
{
  "v": "KERI10JSON0001ac_",
  "t": "icp",
  "d": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "i": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "s": "0",
  "kt": "2", // 2 of 3
  "k" :
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3",  // 3 of 5
  "n" :
    [
      "ETNZH3ULvYawyZ-i0d8JZU6JR2nmAoAfSVPzhzS6b5CM",
      "EYAfSVPzhzaU6JR2nmoTNZH3ULvwyZb6b5CMi0d8JZAS",
      "EnmwyZdi0d8JZAoTNZYAfSVPzhzaU6JR2H3ULvS6b5CM",
      "ETNZH3ULvS6bYAfSVPzhzaU6JR2nmwyZfi0d8JZ5s8bk",
      "EJR2nmwyZ2i0dzaU6ULvS6b5CM8JZAoTNZH3YAfSVPzh",
    ],
  "bt": "2",
  "b":
    [
      "BGKVzj4ve0VSd8z_AmvhLg4lqcC_9WYX90k03q-R_Ydo",
      "BuyRFMideczFZoapylLIyCjSdhtqVb31wZkRKvPfNqkw",
      "Bgoq68HCmYNUDgOz4Skvlu306o_NY-NrYuKAVhk3Zh9c"
    ],
  "c": [],
  "a": []
}
```

#### Rotation Event Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rot",
  "d" : "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
  "i" : "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
  "s" : "1",
  "p" : "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
  "kt": "2", // 2 of 3
  "k" :
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3",  // 3 of 5
  "n" :
    [
      "ETNZH3ULvYawyZ-i0d8JZU6JR2nmAoAfSVPzhzS6b5CM",
      "EYAfSVPzhzaU6JR2nmoTNZH3ULvwyZb6b5CMi0d8JZAS",
      "EnmwyZdi0d8JZAoTNZYAfSVPzhzaU6JR2H3ULvS6b5CM",
      "ETNZH3ULvS6bYAfSVPzhzaU6JR2nmwyZfi0d8JZ5s8bk",
      "EJR2nmwyZ2i0dzaU6ULvS6b5CM8JZAoTNZH3YAfSVPzh",
    ],
  "bt": "1",
  "ba": ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
  "br": ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],
  "a" : []
}
```

#### Interaction Event Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON00011c_",
  "t": "isn",
  "d": "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
  "i": "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
  "s": "2",
  "p": "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
  "a":
  [
    {
      "d": "ELvaU6Z-i0d8JJR2nmwyYAZAoTNZH3UfSVPzhzS6b5CM",
      "i": "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
      "s": "1"
    }
  ]
}
```


### Delegated Key Event Messages

ToDo in delegation section below. Delegated custodial example with partial rotation and using 0 fraction signing weights on exposed pre-rotated keys

#### Delegated Inception Event Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON0001ac_",
  "t": "icp",
  "d": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "i": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "s": "0",
  "kt": "2", // 2 of 3
  "k" :
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3",  // 3 of 5
  "n" :
    [
      "ETNZH3ULvYawyZ-i0d8JZU6JR2nmAoAfSVPzhzS6b5CM",
      "EYAfSVPzhzaU6JR2nmoTNZH3ULvwyZb6b5CMi0d8JZAS",
      "EnmwyZdi0d8JZAoTNZYAfSVPzhzaU6JR2H3ULvS6b5CM",
      "ETNZH3ULvS6bYAfSVPzhzaU6JR2nmwyZfi0d8JZ5s8bk",
      "EJR2nmwyZ2i0dzaU6ULvS6b5CM8JZAoTNZH3YAfSVPzh",
    ],
  "bt": "2",
  "b":
    [
      "BGKVzj4ve0VSd8z_AmvhLg4lqcC_9WYX90k03q-R_Ydo",
      "BuyRFMideczFZoapylLIyCjSdhtqVb31wZkRKvPfNqkw",
      "Bgoq68HCmYNUDgOz4Skvlu306o_NY-NrYuKAVhk3Zh9c"
    ],
  "c": [],
  "a": [],
  "di": "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM"
}
```


#### Delegated Rotation Event Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v" : "KERI10JSON00011c_",
  "t" : "drt",
  "d" : "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
  "i" : "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
  "s" : "1",
  "p" : "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
  "kt": "2", // 2 of 3
  "k" :
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3",  // 3 of 5
  "n" :
    [
      "ETNZH3ULvYawyZ-i0d8JZU6JR2nmAoAfSVPzhzS6b5CM",
      "EYAfSVPzhzaU6JR2nmoTNZH3ULvwyZb6b5CMi0d8JZAS",
      "EnmwyZdi0d8JZAoTNZYAfSVPzhzaU6JR2H3ULvS6b5CM",
      "ETNZH3ULvS6bYAfSVPzhzaU6JR2nmwyZfi0d8JZ5s8bk",
      "EJR2nmwyZ2i0dzaU6ULvS6b5CM8JZAoTNZH3YAfSVPzh",
    ],
  "bt": "1",
  "ba":  ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
  "br":  ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],
  "a" :[]
  "di" : "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM"
}
```


### Receipt Messages

#### Non-Transferable Prefix Signer Receipt Message Body

For receipts, the `d` field is the SAID of the associated event, not the receipt message itself.

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON00011c_",
  "t": "rct",
  "d": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "i": "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
  "s": "1"
}
```

#### Transferable Prefix Signer Receipt Message Body


For receipts, the `d` field is the SAID of the associated event, not the receipt message itself.

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON00011c_",
  "t": "vrc",
  "d": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "i": "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
  "s": "1",
  "a":
    {
      "d": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
      "i": "AYAfSVPzhzS6b5CMaU6JR2nmwyZ-i0d8JZAoTNZH3ULv",
      "s": "4"
    }
}
```

### Other Messages

#### Query Message Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v" : "KERI10JSON00011c_",
  "t" : "qry",
  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "logs",
  "rr": "log/processor",
  "q" :
  {
    "i" : "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "s" : "5",
    "dt": "2020-08-01T12:20:05.123456+00:00",
  }
}
```

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v" : "KERI10JSON00011c_",
  "t" : "qry",
  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "logs",
  "rr": "log/processor",
  "q" :
  {
    "d" : "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i" : "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "s" : "5",
    "dt": "2020-08-01T12:20:05.123456+00:00",
  }
}
```

#### Reply Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rpy",
  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "logs/processor",
  "a" :
  {
    "i": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "name": "John Jones",
    "role": "Founder",
  }
}
```

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rpy",
  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "logs/processor",
  "a" :
  {
    "d":  "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "name": "John Jones",
    "role": "Founder",
  }
}
```

#### Prod Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON00011c_",
  "t": "prd",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "r": "sealed/data",
  "rr": "process/sealed/data",
  "q":
  {
    "d" : "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i" : "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "s" : "5",
    "ri": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "dd": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"
  }
}
```

#### Bare Message Body

Reference to the anchoring seal is provided as an attachment to the bare, `bre` message.
A bare, 'bre', message is a SAD item with an associated derived SAID in its 'd' field.

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON00011c_",
  "t": "bre",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "r": "process/sealed/data",
  "a":
  {
    "d": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "dt": "2020-08-22T17:50:12.988921+00:00",
    "name": "John Jones",
    "role": "Founder",
  }
}
```


#### Exchange Message Body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON00006a_",
  "t": "exn",
  "d": "EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM",
  "dt": "2021-11-12T19:11:19.342132+00:00",
  "r": "/echo",
  "rr": "/echo/response",
  "a": {
    "msg": "test"
  }
}
```

### Notices Embedded in Reply Messages

#### Key State Notice (KSN)

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON0001d9_",
  "d": "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM",
  "i": "E4BsxCYUtUx3d6UkDVIQ9Ke3CLQfqWBfICSmjIzkS1u4",
  "s": "0",
  "p": "",
  "f": "0",
  "dt": "2021-01-01T00:00:00.000000+00:00",
  "et": "icp",
  "kt": "1",
  "k": [
    "DqI2cOZ06RwGNwCovYUWExmdKU983IasmUKMmZflvWdQ"
  ],
  "n": "E7FuL3Z_KBgt_QAwuZi1lUFNC69wvyHSxnMFUsKjZHss",
  "bt": "1",
  "b": [
    "BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"
  ],
  "c": [],
  "ee": {
    "s": "0",
    "d": "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM",
    "br": [],
    "ba": []
  },
  "di": ""
}
```

##### Embedded in Reply

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rpy",
  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "/ksn/BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY",
  "a" :
    {
      "v": "KERI10JSON0001d9_",
      "d": "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM",
      "i": "E4BsxCYUtUx3d6UkDVIQ9Ke3CLQfqWBfICSmjIzkS1u4",
      "s": "0",
      "p": "",
      "f": "0",
      "dt": "2021-01-01T00:00:00.000000+00:00",
      "et": "icp",
      "kt": "1",
      "k": [
        "DqI2cOZ06RwGNwCovYUWExmdKU983IasmUKMmZflvWdQ"
      ],
      "n": "E7FuL3Z_KBgt_QAwuZi1lUFNC69wvyHSxnMFUsKjZHss",
      "bt": "1",
      "b": [
        "BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"
      ],
      "c": [],
      "ee": {
        "s": "0",
        "d": "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM",
        "br": [],
        "ba": []
      },
      "di": ""
    }
}
```

### Signing and sealing KERI data structures

#### Indexed Signatures

Cryptographic signatures are computed on the serialization of a KERI data structure. The serializations use CESR. The signatures are also encoded in CESR and may be attached to the KERI data structure as part of a CESR stream. CESR provides special indexed signature codes for signatures that index the signature to the public key inside a key list inside a KERI establishment event message data structure. This way, only the indexed signature must be attached, not the public key needed to verify the signature. The public key is looked up from the index into the key list in the appropriate establishment event in the KEL. CESR also supports group codes that differentiate the type of indexed signatures in the group and enable pipelined extraction of the whole group for processing when attached {{(see CESR spec)}}. Indexed signatures may be attached to both key event messages and non key event messages. In the case, information about the associated key state for the signature may also need to be attached. This is typically a reference to the AID, sequence number, and SAID (digest), of the establishment event that determines the key state. In other cases, that latest key state is assumed and only the AID of the signer is required. In the former case, where the signature is attached to a key event, the AID may be inferred.

There are two types of attached indexed signatures: controller-indexed and witnessed-indexed. Other information may be required with the attachment the type the the type of event to which the signature is attached to which AID the indexed signature belongs.

Controller-indexed signatures index into either or both the signing key list from the latest Establishment event (inception, delegated inception, rotation, delegated rotation) and the rotating key digest list from the Establishment event immediately prior to the latest Establishment event (prior next key digest list) if any. Both of these lists are strictly ordered so that only the index is needed to determine the public key. Depending on the event and the key lists, a controller-indexed signature may require one or two indices.  Controller-indexed signatures attached to Interaction events and non-key-event messages need only one index into the current signing key list from the most recent prior establishment event. Controller-indexed signatures attached to Inception events (delegated or not) need only one index into the current signing key list in the Inception event. Controller-indexed signatures attached to Rotation events (delegated or not) may need two indices, one into the signing key list of the rotation event itself and the other into the rotation key digest list from the immediately priorEstablishment Event (Inception or Rotation), i.e., the prior next key digest list.

Witness-indexed signatures index into the effective witness list as established by the latest Establishment event (interaction or rotation). To clarify, witness-indexed signatures attached to any type of key event (inception, rotation, interaction, delegated inception, delegated rotation) need only one index into the current list of witnesses that is in effect as of the latest establishment event, which may or may not be the event to which the witness signature is attached. Witnesses shall use only nontransferable identifiers, which include the controlling public key. Consequently, the public key needed for witness signature verification can be extracted from the witness identifier given by the effective witness list.

CESR codes for indexed signatures support up to two indices so that, at most, one copy of an indexed signature needs to be attached. The first index is into the signing list when it's controller-indexed or into the witness list when it's witness-indexed. The second index is into the prior next key digest list when it's controller-indexed.  The CESR group code used to attach the indexed signature may vary depending on the type of event, key-event or not, and type of key event, 

Recall that a prior next key digest shall be exposed as a public key in the succeeding rotation event signing key list when used to sign. Therefore, when the second index is present, it is used to look up the public key digest from the prior next key digest list, then the first index is used to look up the exposed public key from the signing key list, then the digest is verified against the exposed public key, and finally, the doubly indexed signature is verified using the exposed public key.  Verification of the digest means digesting the exposed public key using the same digest type as the prior next key digest and comparing the digests. 

A set of controller-indexed signatures on an interaction or inception event (delegated or not) shall at least satisfy the current signing threshold in order for that event to be accepted as valid. 

A set of controller-indexed signatures on a non-key event message (see below) shall at least satisfy the signing threshold for the establishment event indicated by the event reference in the attachment group (which may or may not be the current signing threshold) to be accepted as valid. 

A set of controller-indexed signatures on a rotation event (delegated or not) shall at least satisfy both the current signing threshold and the prior next rotation threshold in order for that event to be accepted as valid. 

A set of witness-indexed signatures on an interaction, inception, or rotation (delegated or not) for which the effective witness list is not empty may need to satisfy the current witness threshold ( of accountable duplicity) for that event to be accepted as valid.  

Events that have a non-empty set of attached signatures which set does not satisfy the required thresholds may escrow the event while waiting for other signatures to arrive either as attachments to the same version of the event or to a receipt of that event (see next section). A Validator that receives a key event or non-key-event message that does not have attached at least one verifiable Controller signature shall drop that message (i.e., not escrow or otherwise accept it). This protects the Validator from a DDoS attack with spurious unsigned messages.

Indexed signatures minimize the space requirements for signatures. The indexed signatures codes are provided in the CESR code table for indexed signatures {{ see CESR Spec}}. Given an indexed signature, a Validator looks up the associate public key from the index 
into the appropriate table.

#### Non-indexed signatures

CESR also supports codes for signatures that are not indexed. In this case, additional information must be attached, such as the associated public key, in order for a validator to verify the signature. This additional information may be in the form of a CESR group defined by a CESR group code. {{see CESR Spec}}

#### Endorsements

Other entities, as identified by their AID, may wish to attach signatures on key events for a KEL where the signer's AID is neither the controlling AID of that KEL nor a witness AID of that event in that KEL. These non-controller, non-witness signatures may be called Endorsements. For example, a Watcher, when replaying events from a KEL its watches may choose to attach its own signature to the event in order to endorse or otherwise commit to that version of the event as the one the Watcher has seen. In this case, the attachment shall include at least the AID of the endorser as well as any other information needed by the Validator to securely attribute the signature to its source and key state. CESR provides group codes for attaching signature Endorsements for both transferable and non-transferable AIDs with indexed and non-indexed signatures as applicable (see CESR table).

#### Sealing

Any serialized data may be sealed in a KEL and thereby bound to the associated key state by including the associated seal in a key event. Seals shall include a cryptographic digest or digest proof of the serialized data. This may be the SAID of the data when that data follows the SAID protocol, i.e., is a SAD (Self-Addressed Data) {{see CESR spec}}. This enables later verification of the sealing when given the data. Because all events in a KEL are signed by the KEL's controller, a seal, once bound or anchored via inclusion in an event, represents an indirect signature on the sealed data. One property of cryptographic strength digests is cryptographic strength collision resistance. Such resistance makes it computationally infeasible for any two distinct (non-identical) data items to have the same digest. Therefore, a commitment via a nonrepudiable signature on a cryptographic strength digest of a data item is equivalent to a signature on the data item itself. Sealing, therefore, provides a type of indirect endorsement. The notable advantage of a seal as an indirect endorsement over a direct endorsement signature is that the seal is also bound to the key state of the endorser at the location in the KEL where the seal appears. This enables the validity of the endorsement to persist in spite of later changes to the key state. This is an essential feature for unbounded term but verifiable issuances. This also enables an endorsed issuance using one key state with later revocation of that issuance using a different key state. The order of appearance of seals in a KEL provides a verifiable ordering of the associated endorsements of that data, which can be used as a foundation for ordered verifiable transactions. 

One primary use case for sealing in KERI is delegated AIDs. The Delegator (AID) approves (endorses) the associated delegation of a delegated event in the Delegatee's KEL by sealing the SAID of that delegated event in the Delegator's KEL. Because the Delegator signs the sealing event, the presence of the delegated event's SAID (cryptographic digest) in the Delegator's KEL is equivalent cryptographically to a signed endorsement by the Delegator of the delegated event itself but with the added advantage that the validity of that delegation persists in spite of changes to the key state of the Delegator.  A validator need only receive an attached reference to the delegating event that includes the seal in order to look up the seal and verify its presence. CESR provides codes for attached event seal references as well as codes for event seals.

#### Receipt Signatures

Receipt message data structures are not key events but merely reference key events (see below). A signature attached to a Receipt is not a signature on the serialized receipt data structure but is a signature on a serialization of the referenced key event. This enables the asynchronous receipt and processing of any type of signature, including controller-indexed and witness-indexed signatures. The Validator first looks up an already received copy of the referenced serialized key event and then verifies the signatures as if they had been attached to the event. Because Receipts may be more compact than the full event, they allow more efficient asynchronous distribution of signatures for events. A Validator that receives a Receipt for an event that the Validator has not yet received may escrow the Receipt and its attached signatures. This escrow, however, may be vulnerable to a DDoS attack due to spurious event references.

#### Receipt Seals

Similarly to attached signatures a Receipt message can convey an attached seal reference that allows a validator to associate the sealing event in the sealer's KEL with the reference to the sealed event given by the Receipt body. CESR provides codes for attached seal source references to receipts. {{see CESR spec}}



## KERI key management

### KERI keypair labeling convention

In order to make key event expressions both clearer and more concise, a keypair labeling convention is used. When an AID's Key state is dynamic, i.e., the set of controlling keypairs is transferable, then the keypair labels are indexed in order to represent the successive sets of keypairs that constitute the Key state at any position in the KEL. Specifically, indexes on the labels for AIDs that are transferable to indicate which set of keypairs is associated with the AID at any given point in its Key state or KEL. In contrast, when the Key state is static, i.e., the set of controlling keypairs is non-transferable, then no indexes are needed because the Key state never changes.

Recall that a keypair is a two tuple (public, private) of the respective public and private keys in the keypair. For a given AID, the labeling convention uses an uppercase letter label to represent that AID. When the Key state is dynamic, a superscripted index on that letter is used to indicate which keypair is used at a given Key state. Alternatively, the index may be omitted when the context defines which keypair and which Key state, such as, for example, the latest or current Key state. To reiterate, when the Key state is static, no index is needed.

In general, without loss of specificity, an uppercase letter label is used to represent both an AID and, when indexed, to represent its keypair or keypairs that are authoritative at a given Key state for that AID. In addition, when a keypair is expressed in tuple form `(A, a)`, the uppercase letter represents the public key, and the lowercase letter represents the private key. For example, let `A` denote the AID as a shorthand, let `A` also denote the current keypair, and finally, let the tuple `(A, a)` also denote the current keypair. Therefore, when referring to the keypair itself as a pair and not the individual members of the pair, either the uppercase label, `A`, or the tuple, `(A, a)`, may be used to refer to the keypair itself. When referring to the individual members of the keypair then the uppercase letter `A`, refers to the public key, and the lowercase letter `a`, refers to the private key.

The sequence of keypairs that are authoritative (i.e., establish control authority) for an AID should be indexed by the zero-based integer-valued, strictly increasing by one, variable 'i'. The associated indexed keypair is denoted (A<sup>i</sup>, a<sup>i</sup>). Furthermore, as described above, an Establishment event may change the Key state. The sequence of Establishment events should be indexed by the zero-based integer-valued, strictly increasing by one, variable `j`. the associated key pair is denoted (A<sup>i,j</sup>, a<sup>i,j</sup>) When the set of controlling keypairs that are authoritative for a given Key state includes only one member, then `i = j` for every keypair, and only one index is needed. But when the set of keypairs used at any time for a given Key state includes more than one member, then `i != j` for every keypair, and both indices are needed.

#### Case in which only one index is needed

Because `i = j`, the indexed keypair for AID, A, is denoted by A<sup>i</sup> or in tuple form by (A<sup>i</sup>, a<sup>i</sup>) where the keypair that is indexed uses the i<sup>th</sup> keypair from the sequence of all keypairs.  

Example of the keypair sequence - one index where each keypair is represented only by its public key:

Expressed as the list, [A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, ...]

Where: 
A<sup>0</sup> is the zero element in this sequence; (A<sup>0</sup>, a<sup>0</sup>) is the tuple form.

#### Case in which both indexes are needed

Because `i != j`, the indexed keypair for AID, `A`, is denoted by A<sup>i,j</sup> or in tuple form by (A<sup>i,j</sup>, a<sup>i,j</sup>) where the keypair that is indexed is authoritative or potentially authoritative as the i<sup>th</sup> keypair from the sequence of all keypairs that is authoritative in the j<sup>th</sup> Key state. 

Example of the keypair sequence – two indices using three keypairs at each key state where each keypair is represented only by its public key:
Expressed as the list, [A<sup>0,0</sup>, A<sup>1,0</sup>, A<sup>2,0</sup>, A<sup>3,1</sup>, A<sup>4,1</sup>,  A<sup>5,1</sup>].

Where: the first two Key states will consume the first six keypairs of the list.

#### Labelling the digest of the public key  

With pre-rotation, each public key from the set of pre-rotated keypairs may be hidden as a qualified cryptographic digest of that public key. The digest of the public key labeled `A` is represented using the functional notation `H(A)` for hash (digest). 

Example of a singly indexed digest -  A<sup>i</sup> is denoted by H(A<sup>i</sup>)

Example of a doubly indexed digest - A<sup>i,j</sup> is denoted by H(A<sup>i,j</sup>}

Where: 

The digest of the public key labeled `A` is represented using the functional notation `H(A)` for hash (digest).

A pre-rotated keypair is potentially authoritative for the next or subsequent Establishment event after the Establishment event when the digest of the pre-rotated keypair first appears. Therefore, its j<sup>th</sup> index value is one greater than the j<sup>th</sup> index value of the Establishment event in which its digest first appears. Let `j` represent the index of the j<sup>th</sup> Establishment event, then the prerotated digests appearing in that Establishment event have index `j+1`. As explained in more detail for partial Rotation of a prerotated set, a prerotated keypair from a set of two or more prerotated keypairs is only potentially authoritative so that its actual authoritative j<sup>th</sup>  index may change when it is actually rotated in, if ever.

Example of public key and the prerotated digest of the next  public key - [A<sup>0,0</sup>], [H(A<sup>1,1</sup>)]

#### Labelling key events in a KEL

Finally, each Key event in a KEL must have a zero-based integer-valued, strictly increasing by one, sequence number represented by the variable `k`. Abstractly, the variable `k` can be used as an index on any keypair label to denote the sequence number of an event for which that keypair is authoritative. Usually, this appears as a subscript.  Thus any given keypair label could have three indices, namely, `i,j,k`. A public key would appear as A <sup>i,j</sup><sub>k</sub>.

Example of labeling key events in a KEL - A<sup>i,j</sup><sub>k</sub> 

Where:

`i` denotes the i<sup>th</sup> keypair from the sequence of all keypairs;
`j` denotes the j<sup>th</sup> Establishment event in which the keypair is authoritative;
 and `k` denotes the sequence number of k<sup>th</sup> Key event in which the keypair is authoritative. 
 
Expressed as a sequence of lists of two public keys per event:
 
[A<sup>0,0</sup><sub>0</sub>, A<sup>1,0</sup><sub>0</sub>], [A<sup>0,0</sup><sub>1</sub>, A<sup>1,0</sup><sub>1</sub>], [A<sup>0,0</sup><sub>2</sub>, A<sup>1,0</sup><sub>2</sub>], [A<sup>2,1</sup><sub>3</sub>, A<sup>3,1</sup><sub>3</sub>], [A<sup>2,1</sup><sub>4</sub>, A<sup>3,1</sup><sub>4</sub>]

When a KEL has only Establishment events, then `j = k`. In that case, either `j` or `k` is redundant. 

Example of public keys from KEL with only establishment events - Expressed as a sequence of lists of two public keys per event where `j` is omitted because `j = k`:

[A<sup>0</sup><sub>0</sub>, A<sup>1</sup><sub>0</sub>], [A<sup>2</sup><sub>1</sub>, A<sup>3</sup><sub>1</sub>]


### Pre-rotation 

Each Establishment event involves two sets of keys that each play a role that together establishes complete control authority over the AID associated at the location of that event in the KEL. To clarify, control authority is split between keypairs that hold signing authority and keypairs that hold rotation authority. A Rotation revokes and replaces the keypairs that hold signing authority as well as replacing the keypairs that hold rotation authority. The two set sets of keys are labeled current and next. Each Establishment event designates both sets of keypairs. The first (current) set consists of the authoritative signing keypairs bound to the AID at the location in the KEL where the Establishment event occurs. The second (next) set consists of the pre-rotated authoritative rotation keypairs that will be actualized in the next (ensuing) Establishment event. Each public key in the set of next (ensuing) pre-rotated public keys is hidden in or blinded by a digest of that key. When the Establishment event is the Inception event then the current set is the initial set. The pre-rotated next set of Rotation keypairs are one-time use only rotation keypairs, but may be repurposed as signing keypairs after their one time use to rotate.

In addition, each Establishment event designates two threshold expressions, one for each set of keypairs (current and next). The current threshold determines the needed satisficing subset of signatures from the associated current set of keypairs for signing authority to be considered valid. The next threshold determines the needed satisficing subset of signatures from the associated next set of hidden keypairs for rotation authority to be considered valid. The simplest type of threshold expression for either threshold is an integer that is no greater than nor no less than the number of members in the set. An integer threshold acts as an `M of N` threshold where `M` is the threshold and `N` is the total number of keypairs represented by the public keys in the key list. If any set of `M` of the `N` private keys belonging to the public keys in the key list verifiably signs the event, then the threshold is satisfied by the Controller exercising its control authority role (signing or rotating) associated with the given key list and threshold.

To clarify, each Establishment event must include a list (ordered) of the qualified public keys from each of the current (initial) set of keypairs), a threshold for the current set, a list (ordered) of the qualified cryptographic digests of the qualified public keys from the next set of keypairs, and a threshold for the next set. Each event must also include the AID itself as either a qualified public key or a qualified digest of the Inception event.

Each Non-establishment event must be signed by a threshold-satisficing subset of private keys from the current set of keypairs from the most recent Establishment event. The following sections detail the requirements for a valid set of signatures for each type of Establishment event.

### Inception event pre-rotation

The creator of the Inception event must create two sets of keypairs, the current (initial) set and the next set. The private keys from the current set are kept as secrets. The public keys from the current set are exposed via inclusion in the Inception event. Both the public and private keys from the next set are kept as secrets, and only the cryptographic digests of the public keys from the next set are exposed via inclusion in the event. The public keys from the next set are only exposed in a subsequent Establishment event, if any.  Both thresholds are exposed via inclusion in the event.

Upon emittance of the Inception event, the current (initial) set of keypairs becomes the current set of Verifiable authoritative signing keypairs for the AID. Emittance of the Inception event also issues the identifier. Moreover, to be verifiably authoritative, the Inception event must be signed by a threshold satisficing subset of the current (initial) set of private keys. The Inception event may be verified against the attached signatures using the included current (initial) list of public keys. When self-addressing, a digest of the serialization of the Inception event provides the AID itself as derived by the SAID protocol [[ref: SAID]].

There must be only one Establishment event that is an Inception event. All subsequent Establishment events must be Rotation events.

Inception event message example:

When the AID in the `i` field is SAID, the new Inception event has two
qualified digest fields. In this case, both the `d` and `i` fields must have the same value. This means the digest suite's derivation code, used for the `i` field must be the same for the `d` field.
The derivation of the `d` and `i` fields is special. Both the `d` and `i` fields are replaced with dummy `#` characters of the length of the digest to be used. The digest of the Inception event is then computed and both the `d` and `i` fields are replaced with the qualified digest value. Validation of an Inception event requires examining the `i` field's derivation code and if it is a digest-type then the `d` field must be identical otherwise the Inception event is invalid.

When the AID is not self-addressing, i.e.., the `i` field derivation code is not a digest, then the `i` is given its value and the `d` field is replaced with dummy characters `#` of the correct length and then the digest is computed., which  is the standard SAID algorithm.

Inception event message body

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/43
:::

```json
{
  "v": "KERI10JSON0001ac_",
  "t": "icp",
  "d": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "i": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "s": "0",
  "kt": "2", // 2 of 3
  "k" :
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3",  // 3 of 5
  "n" :
    [
      "ETNZH3ULvYawyZ-i0d8JZU6JR2nmAoAfSVPzhzS6b5CM",
      "EYAfSVPzhzaU6JR2nmoTNZH3ULvwyZb6b5CMi0d8JZAS",
      "EnmwyZdi0d8JZAoTNZYAfSVPzhzaU6JR2H3ULvS6b5CM",
      "ETNZH3ULvS6bYAfSVPzhzaU6JR2nmwyZfi0d8JZ5s8bk",
      "EJR2nmwyZ2i0dzaU6ULvS6b5CM8JZAoTNZH3YAfSVPzh",
    ],
  "bt": "2",
  "b":
    [
      "BGKVzj4ve0VSd8z_AmvhLg4lqcC_9WYX90k03q-R_Ydo",
      "BuyRFMideczFZoapylLIyCjSdhtqVb31wZkRKvPfNqkw",
      "Bgoq68HCmYNUDgOz4Skvlu306o_NY-NrYuKAVhk3Zh9c"
    ],
  "c": [],
  "a": []
}
```

### Rotation using pre-rotation

Unlike Inception, the creator of a Rotation event must create only one set of keypairs, the newly next set. Both the public and private keys from the newly created next set are kept as secrets and only the cryptographic digests of the public keys from the newly next set are exposed via inclusion in the event. The list of newly current public keys must  include the  an old  next threshold satisficing subset of old next public keys from the most recent prior Establishment event.  For short, the next threshold from the most recent prior Establishment event is denoted as the prior next threshold, and the list of unblinded public keys taken from the blinded key digest list from the most recent prior Establishment event as the prior next key list. The subset of old prior next keys that are included in the newly current set of public keys must  be unhidden or unblinded because they appear as the public keys themselves and no longer appear as digests of the public keys. Both thresholds are exposed via inclusion in the event.

Upon emittance of the Rotation event, the newly current keypairs become the current set of Verifiable authoritative signing keypairs for the identifier. The old current set of keypairs from the previous Establishment event has been revoked and replaced by the newly current set. Moreover, to be verifiably authoritative, the rotation event must be signed by a dual threshold satisficing subset of the newly current set of private keys., meaning that  the set of signatures on a Rotation event must satisfy two thresholds. These are the newly current threshold and the old  prior next threshold from the most recent prior Establishment event. Therefore the newly current set of public keys must include a satisfiable subset with respect to the old prior next threshold of public keys from the old prior next key list. The included newly current list of public keys enables verification of the Rotation event against the attached signatures.

Including  the digests of the new next set of public keys in each Establishment event performs a pre-rotation operation on that set by making a Verifiable forward blinded commitment to that set. Consequently, no other key set may be used to satisfy the threshold for the next Rotation operation. Because the next set of pre-rotated keys is blinded (i.e.,  has not been exposed i.e. used to sign or even published) an attacker cannot forge and sign a Verifiable Rotation operation without first unblinding the pre-rotated keys. Therefore, given sufficient cryptographic strength of the digests, the only attack surface available to the adversary is a side-channel attack on the private key store itself and not on signing infrastructure. But the Controller, as the  creator of the pre-rotated private keys is free to make that key store as arbitrarily secure as needed because the pre-rotated keys are not used for signing until the next Rotation.  In other words, as long as the creator keeps secret the pre-rotated public keys themselves, an attacker must attack the key storage infrastructure because side-channel attacks on signing infrastructure are obviated.

As explained in the First seen policy section, for a Validator, the first seen rule applies, that is, the first seen Version of an event is the authoritative one for that Validator. The first seen wins. In other words the first published Version becomes the first seen. Upon Rotation, the old prior next keys are exposed but only after a new next set has been created and stored. Thus the creator is always able to stay one step ahead of an attacker. By the time a new Rotation event is published, it is too late for an attacker to create a Verifiable Rotation event to supplant it because the original Version has already been published and may be first seen by the Validator. The window for an attacker is the network latency for the first published event to be first seen by the network of Validators. Any later, key compromise is too late.

In essence, each key set follows a Rotation lifecycle where it changes its role with each Rotation event. A pre-rotated keypair set starts as the member of the next key set holding one-time rotation control authority. On the ensuing Rotation,  that keypair becomes part of the the current key set holding signing control authority. Finally on the following Rotation, that keypair is discarded. The lifecycle for the initial key set in an Inception event is slightly different. The initial key set starts as the current set holding signing authority and is discarded on the ensuing Rotation event, if any.

Pre-Rotation example:

Recall that the keypairs for a given AID may be represented by the indexed letter label such as A<sup>i,j</sup><sub>k</sub> where 'i' denotes the i<sup>th</sup> keypair from the sequence of all keypairs, 'j’ denotes the j<sup>th</sup> Establishment event in which the keypair is authoritative, and 'k’ represents the k<sup>th</sup> Key event in which the keypair is authoritative. When a KEL has only Establishment events, then j = k. When only one keypair is authoritative at any given Key state then i = j.

Also, recall that a pre-rotated keypair is designated by the digest of its public key appearing in an Establishment event. The digest is denoted as H(A) or H(A<sup>i,j</sup><sub>k</sub>) in indexed form. The appearance of the digest makes a forward Verifiable cryptographic commitment that may be realized in the future when and if that public key is exposed and listed as a current authoritative signing key in a subsequent Establishment event.

The following example illustrates the lifecycle roles of the key sets drawn from a sequence of keys used for three Establishment events; one Inception followed by two Rotations. The initial number of authoritative keypairs is three and then changes to two and then changes back to three.

|Event| Current Keypairs | CT | Next Keypairs| NT |
|:-:|--:|--:|--:|--:|
|0| *[A<sup>0,0</sup>, A<sup>1,0</sup>, A<sup>2,0</sup>]* | 2 | *[H(A<sup>3,1</sup>), H(A<sup>4,1</sup>)]* | 1 |
|1| *[A<sup>3,1</sup>, A<sup>4,1</sup>]* | 1 | *[H(A<sup>5,2</sup>), H(A<sup>6,2</sup>), H(A<sup>7,2</sup>)]* | 2 |
|2| *[A<sup>5,2</sup>, A<sup>6,2</sup>, A<sup>7,2</sup>]* | 2 | *[H(A<sup>8,3</sup>), H(A<sup>9,3</sup>), H(A<sup>10,3</sup>]* | 2 |

Where:

* CTH means Current threshold.
* NTH means Next threshold.

### Reserve rotation

The pre-rotation mechanism supports partial pre-rotation or more exactly partial Rotation of pre-rotated keypairs. One important use case for partial Rotation is to enable pre-rotated keypairs designated in one Establishment event to be held in reserve and not exposed at the next (immediately subsequent) Establishment event. This reserve feature enables keypairs held by Controllers as members of a set of pre-rotated keypairs to be used for the purpose of fault tolerance in the case of non-availability by other Controllers while at the same time minimizing the burden of participation by the reserve members. In other words, a reserved pre-rotated keypair contributes to the potential availability and fault tolerance of control authority over the AID without necessarily requiring the participation of the reserve key-pair in a Rotation until and unless it is needed to provide continuity of control authority in the event of a fault (non-availability of a non-reserved member). This reserve feature enables different classes of key Controllers to contribute to the control authority over an AID. This enables provisional key control authority. For example, a key custodial service or key escrow service could hold a keypair in reserve to be used only upon satisfaction of the terms of the escrow agreement. This could be used to provide continuity of service in the case of some failure event. Provisional control authority may be used to prevent types of common-mode failures without burdening the provisional participants in the normal non-failure use cases.

Reserve rotation example:

Provided here is an illustrative example to help to clarify the pre-rotation protocol, especially with regard to  and threshold satisfaction for Reserve rotation.

| SN | Role | Keys | Threshold |
|:-:|:-:|--:|--:|
| 0 | Crnt | *[A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, A<sup>3</sup>, A<sup>4</sup>]* | *[1/2, 1/2, 1/2, 1/4, 1/4]* |
| 0 | Next | *[H(A<sup>5</sup>), H(A<sup>6</sup>), H(A<sup>7</sup>), H(A<sup>8</sup>), H(A<sup>9</sup>)]* | *[1/2, 1/2, 1/2, 1/4, 1/4]* |
| 1 | Crnt | *[A<sup>5</sup>, A<sup>6</sup>, A<sup>7</sup>]* | *[1/2, 1/2, 1/2]* |
| 1 | Next | *[H(A<sup>10</sup>), H(A<sup>11</sup>), H(A<sup>12</sup>), H(A<sup>8</sup>),H(A<sup>9</sup>)]* | *[1/2, 1/2, 1/2, 1/4, 1/4]*  |
| 2 | Crnt | *[A<sup>10</sup>, A<sup>8</sup>, A<sup>9</sup>]* | *[1/2, 1/2, 1/2]* |
| 2 | Next | *[H(A<sup>13</sup>), H(A<sup>14</sup>), H(A<sup>15</sup>), H(A<sup>16</sup>),H(A<sup>17</sup>)]* | *[1/2, 1/2, 1/2, 1/4, 1/4]*  |
| 3 | Crnt | *[A<sup>13</sup>, A<sup>14</sup>, A<sup>15</sup>]* | *[1/2, 1/2, 1/2]* |
| 3 | Next | *[H(A<sup>18</sup>), H(A<sup>19</sup>), H(A<sup>20</sup>), H(A<sup>16</sup>),H(A<sup>17</sup>)]* | *[1/2, 1/2, 1/2, 1/4, 1/4]*  |
| 4 | Crnt | *[A<sup>18</sup>, A<sup>20</sup>, A<sup>21</sup>]* | *[1/2, 1/2, 1/2]* |
| 4 | Next | *[H(A<sup>22</sup>), H(A<sup>23</sup>), H(A<sup>24</sup>), H(A<sup>16</sup>),H(A<sup>17</sup>)]* | *[1/2, 1/2, 1/2, 1/4, 1/4]*  |
| 5 | Crnt | *[A<sup>22</sup>, A<sup>25</sup>, A<sup>26</sup>, A<sup>16</sup>, A<sup>17</sup>]* | *[1/2, 1/2, 1/2, 0, 0]* |
| 5 | Next | *[H(A<sup>27</sup>), H(A<sup>28</sup>), H(A<sup>29</sup>), H(A<sup>30</sup>),H(A<sup>31</sup>)]* | *[1/2, 1/2, 1/2, 1/4, 1/4]*  |

Where, in  the column labels:

* SN is the sequence number of the event. Each event uses two rows in the table.
* Role is either Current (Crnt) or Next and indicates the role of the key list and threshold on that row.
* Keys is the list of public keys denoted with indexed label of the keypair sequence.
* Threshold is the threshold of signatures that must be satisfied for validity.

Commentary of each event:

(0) Inception: Five keypairs have signing authority and five other keypairs have rotation authority. Any two of the first three or any one of the first three and both the last two are sufficient. This anticipates holding the last two in reserve.

(1) Rotation: The first three keypairs from the prior next, A<sup>5</sup>, A<sup>6</sup>, and A<sup>7</sup>, are rotated at the new current signing keypairs. This exposes the keypairs. The last two from the prior next, A<sup>8</sup> and A<sup>9</sup>, are held in reserve. They have not been exposed are included in the next key list.

(2) Rotation: The prior next keypairs, A<sup>11</sup> and A<sup>12</sup> are unavailable to sign the Rotation and participate as the part of the newly current signing keys. Therefore, A<sup>8</sup> and A<sup>9</sup> must be activated (pulled out of reserve) and included and exposed as both one-time rotation keys and newly current signing keys. The signing authority (weight) of each of A<sup>8</sup> and A<sup>9</sup> has been increased to 1/2 from 1/4. This means that any two of the three of A<sup>10</sup>, A<sup>8</sup>, and A<sup>9</sup> may satisfy the signing threshold. Nonetheless, the Rotation event \#2 MUST be signed by all three of A<sup>10</sup>, A<sup>8</sup>, and A<sup>9</sup> in order to satisfy the prior next threshold because in that threshold A<sup>8</sup>, and A<sup>9</sup>  only have a weight of 1/4.

(3) Rotation: The keypairs H(A<sup>16</sup>),H(A<sup>17</sup> have been held in reserve from event \#2

(4) Rotation: The keypairs H(A<sup>16</sup>), H(A<sup>17</sup> continue to be held in reserve.

(5) Rotation: The keypairs A<sup>16</sup>, and A<sup>17</sup> are pulled out of reserved and exposed in order to perform the Rotation because A<sup>23</sup>, and A<sup>24</sup> are unavailable. Two new keypairs, A<sup>25</sup>, A<sup>26</sup>, are added to the current signing key list. The current signing authority of A<sup>16</sup>, and A<sup>17</sup> is none because they are assigned a weight of 0 in the new current signing threshold. For the Rotation event to be valid, it must be signed by A<sup>22</sup>, A<sup>16</sup>, and A<sup>17</sup> in order to satisfy the prior next threshold for rotation authority and also must be signed by any two of A<sup>22</sup>, A<sup>25</sup>, and A<sup>26</sup> in order to satisfy the new current signing authority for the event itself. This illustrates how reserved keypairs may be used exclusively for rotation authority and not for signing authority.

#### Custodial rotation

Partial pre-rotation supports another important use case that of Custodial key rotation. Because control authority is split between two key sets, the first for signing authority and the second (pre-roateted) for rotation authority the associated thresholds and key list can be structured in such a way that a designated custodial agent can hold signing authority while the  original Controller can hold exclusive rotation authority. The holder of the rotation authority can then at any time without the cooperation of the custodial agent if need be revoke the agent's signing authority and assign it so some other agent or return that authority to itself.

Custodial rotation example:

Provided here is an illustrative example to help to clarify the pre-rotation protocol, especially with regard to threshold satisfaction for Custodial rotation.

| SN | Role | Keys | Threshold |
|:-:|:-:|--:|--:|
| 0 | Crnt | *[A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>]* | *[1/2, 1/2, 1/2]* |
| 0 | Next | *[H(A<sup>3</sup>), H(A<sup>4</sup>), H(A<sup>5</sup>)]* | *[1/2, 1/2, 1/2]* |
| 1 | Crnt | *[A<sup>3</sup>, A<sup>4</sup>, A<sup>5</sup>, A<sup>6</sup>, A<sup>7</sup>, A<sup>8</sup>]* | *[0, 0, 0, 1/2, 1/2, 1/2]* |
| 1 | Next | *[H(A<sup>9</sup>), H(A<sup>10</sup>), H(A<sup>11</sup>)]* | *[1/2, 1/2, 1/2]* |
| 2 | Crnt | *[A<sup>9</sup>, A<sup>10</sup>, A<sup>11</sup>, A<sup>12</sup>, A<sup>13</sup>, A<sup>14</sup>]* | *[0, 0, 0, 1/2, 1/2, 1/2]* |
| 2 | Next | *[H(A<sup>15</sup>), H(A<sup>16</sup>), H(A<sup>17</sup>)]* | *[1/2, 1/2, 1/2]*  |

Where for the column labels:

* SN is the sequence number of the event. Each event uses two rows in the table.
* Role is either Current (Crnt) or Next and indicates the role of the key list and threshold on that row.
* Keys is the list of public keys denoted with indexed label of the keypair sequence.
* Threshold is the threshold of signatures that must be satisfied for validity.


Commentary of each event:

* (0) Inception: The private keys from current signing keypairs  A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> are held by the custodian of the identifier. The owner of the identifier provides the digests of the next rotation keypairs, H(A<sup>3</sup>), H(A<sup>4</sup>), and H(A<sup>5</sup>) to the custodian in order that the custodian may include them in the event and then sign the event. The owner holds the private keys from the next rotation keypairs A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup>. A self-addressing AID would then be created by the formulation of the Inception event. Once formed, the custodian controls the signing authority over the identifier by virtue of holding the associated private keys for the current key list. But the Controller exercises the rotation authority by virtue of holding the associated private keys for the next key list. Because the Controller of the rotation authority may at their sole discretion revoke and replace the keys that hold signing authority, the owner, holder of the next private keys, is ultimately in control of the identifier so constituted by this Inception event.

* (1) Rotation: The owner changes custodians with this event. The new custodian creates new current signing keypairs, A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> and holds the associated private keys. The new custodian provides the public keys A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> to the owner so that the owner can formulate and sign the Rotation event that transfers signing authority to the new custodian. The owner exposes its rotation public keys,  A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup> by including them in the new current key list. But the weights of those rotation keys in the new current signing threshold are all 0 so they have no signing authority.  The owner creates a new set of next keypairs and includes their public key digests, H(A<sup>9</sup>), H(A<sup>10</sup>), H(A<sup>11</sup>) in the new next key list. The owner holds the associated private keys and thereby retains rotation authority. This event must be signed by any two of A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup> in order to satisfy the prior next threshold and also must be signed by any two A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> in order to satisfy the new current signing threshold. The new current threshold and new next threshold clearly delineate that the new custodian now holds exclusive signing authority and owner continues to retain exclusive rotation authority.

* (2) Rotation: Change to yet another custodian following the same pattern as event \#1

#### Partial pre-rotation 

The KERI protocol includes support for Partial pre-rotation i.e., a Rotation operation on a set of pre-rotated keys that may keep some keys in reserve (i.e., unexposed) while exposing others as needed.

As described above, a valid Rotation operation requires the satisfaction of two different thresholds -  the current threshold of the given Rotation event with respect to its associated current public key list and the next threshold from the given Rotation event's most recent prior Establishment event with respect to its associated blinded next key digest list. For short, the next threshold from the most recent prior Establishment event is denoted as the prior next threshold, and the list of unblinded public keys taken from the blinded key digest list from the most recent prior Establishment event as the prior next key list. Explication of the elements of the prior next key list requires exposing or unblinding the underlying public keys committed to by their corresponding digests that appear in the next key digest list of the most recent prior Establishment event. The unexposed (blinded) public keys may be held in reserve.

More precisely, any Rotation event's current public key list must include a satisfiable subset of the prior next key list with respect to the prior next threshold. In addition, any Rotation event's current public key list must include a satisfiable set of public keys with respect to its current threshold. In other words, the current public key list must be satisfiable with respect to both the current and prior next thresholds.

To reiterate, in order to make Verifiable the maintenance of the integrity of the forward commitment to the pre-rotated list of keys made by the prior next event, i.e., provide Verifiable rotation control authority, the current key list must include a satisfiable subset of exposed (unblinded) pre-rotated next keys from the most recent prior Establishment event where satisfiable is with respect to the  prior next threshold. Moreover, in order to establish Verifiable signing control authority, the current key list also must include a satisfiable subset of public keys where satisfiable is with respect to the current threshold.

These two conditions are satisfied trivially whenever the current and prior next key lists and thresholds are equivalent. When both the current and the prior next key lists and thresholds are identical, then the validation can be simplified by comparing the two lists and thresholds to confirm that they are identical and then confirming that the signatures satisfy the one threshold with respect to the one key list. When not identical, the Validator must perform the appropriate set math to confirm compliance.

Recall that the order of appearance of the public key in a given key list and its associated threshold weight list must be the same. The order of appearance, however, of any public keys that appear in both the current and prior next key lists may be different between the two key lists and hence the two associated threshold weight lists.  A Validator therefore must confirm that the set of keys in the current key list truly includes a satisfiable subset of the prior next key list and that the current key list is satisfiable with respect to both the current and prior next thresholds. Actual satisfaction means that the set of attached signatures must  satisfy both the current and prior next thresholds as applied to their respective key lists.

Suppose that the current public key list does not include a proper subset of the prior next key list. This means that no keys were held in reserve. This also means that the current key list is either identical to the prior next key list or is a superset of the prior next key list.  Nonetheless, such a Rotation may change the current key list and or threshold with respect to the prior next key list and/or threshold as long as it meets the satisfiability constraints defined above.

If the current key list includes the full set of keys from the prior next key list,  then a full Rotation has occurred, not a Partial rotation, because no keys were held in reserve or omitted. A full Rotation may add new keys to the current key list and/or change the current threshold with respect to the prior next key list and threshold.

### Cooperative Delegation

A delegation or identifier delegation operation is provided by a pair of events. One event is the delegating event in the KEL of the Delegator and the other event is the delegated event in the KEL of the delegatee. This pairing of events is a somewhat novel approach to delegation in that the resultant delegation requires cooperation between the Delegator and dDelegatee. We call this cooperative delegation.  In a cooperative delegation, a delegating identifier approves the establishment operation (inception or rotation) of a delegated identifier. A delegating event is a type of event that includes in its data payload an event seal of the delegated event that is the target the delegation operation. This delegated event seal includes a digest of the delegated event. This verifiably seals or anchors or binds the delegated event to the KEL of the Delegator. 

Delegating Event Diagram

Delegated Event Seal Diagram

Likewise, the inception event of the delegatee’s KEL includes the delegator’s AID. This binds the inception and any later establishment events in the delegatee’s KEL to a unique delegator. A validator must be given or find the delegating seal in the delegator’s KEL before the event may be accepted as valid. The pair of bindings (delegation seal in delegator's KEL and delegator's AID in delegatee's inception event) make the delegation cooperative. Both must participate. As will be seen later, this cooperation adds an additional layer of security to the delegatee's KEL and provides a way to recover from prerotated key compromise.

Delegated Event with Delegator AID Diagram

Because the delegating event payload is a list, a single delegating event may perform multiple delegation operations, one per each delegation seal. 

A delegation operation directly delegates an establishment event. Either an inception or rotation. Thus a delegation operation may either delegate an inception or delegate a rotation that respectively may create and rotate the authoritative keys for delegated AID. The AID for a delegatee (delegated identifier prefix) must be a fully qualified digest of its inception event. This cryptographically binds the delegatee's AID to the delegator's AID.

The Delegator (controller) retains establishment control authority over the delegated identifier in that the new delegated identifier may only authorize non-establishment events with respect to itself. Delegation, therefore, authorizes revokable signing authority to some other AID. The delegated identifier has a delegated key event sequence where the inception event is a delegated inception, and any rotation events are delegated rotation events. Control authority for the delegated identifier, therefore, requires verification of a given delegated establishment event, which in turn requires verification of the delegating identifier’s establishment event.

To reiterate, because the delegating event seal includes a digest of the full delegated event, it thereby provides a cryptographic commitment to the delegated event and all of its configuration data. 

A common use case of delegation would be to delegate signing authority to a new identifier prefix. The signing authority may be exercised by a sequence of revokable signing keys distinct from the keys used for the delegating identifier. This enables horizontal scalability of signing operations. The other major benefit of a cooperative delegation is that any exploiter that merely compromises only the delegate’s authoritative keys may not thereby capture the control authority of the delegate. A successful exploiter must also compromise the delegator’s authoritative keys. Any exploit of the delegatee is recoverable by the delegator. Conversely, merely compromising the delegator’s signing keys may not enable a delegated rotation without also compromising the delegatee's pre-rotated keys. Both sets of keys must be compromised simultaneously. This joint compromise requirement is a distinctive security feature of cooperative delegation. Likewise, as explained later, this cooperative feature also enables recovery of a joint compromise of a delegation at any set of delegation levels by a recovery at the next higher delegation level.



### Security Properties of Prerotation

For many exploits, the likelihood of success is a function of exposure to continued monitoring or probing. Narrowly restricting the exposure opportunities for exploitation in terms of time, place, and method, especially if the time and place happen only once, makes exploitation extremely difficult. The exploiter has to either predict the one-time and place of that exposure or has to have continuous universal monitoring of all exposures. By declaring the very first pre-rotation in the inception event, the window for its exploit is as narrow as possible. Likewise, each subsequent rotation event is a one-time and place signing exposure of the former next (prerotated) rotation key. 

Because each prerotation makes a cryptographic future commitment to a set of one-time first-time rotation keys, later exploit of the current authoritative signing key(s) may not capture key rotation authority as it has already been transferred via the pre-commitment to a new unexposed set of keys. To elaborate, The next (ensuing) prerotated keypairs in an inception event serve as first-time, one-time, and only-time rotation keys in the next rotation operation. Thereafter, those keypairs may be activated as the new current (root) authoritative signing key(s) but no longer have rotation authority. Likewise, the next (ensuing) prerotated keypairs in each rotation event serve as first-time, one-time, and only-time rotation keys in the next rotation operation. Thereafter, those keypairs may be activated as the new current (root) authoritative signing key(s) but likewise no longer have rotation authority. 
In administrative identity (identifier) systems, the binding between keys, controller, and identifier may be established by administrative fiat. As a result, administrative fiat may be used as a recovery mechanism for compromised administrative keys. This may make those administrative keys relatively more exposed through multiple use of each key. In contrast, when the binding between keys, controller, and identifier is purely cryptographic (decentralized), such as is the case with this (KERI) protocol, there is no recovery mechanism once the keys for the root control authority have been fully captured. Therefore, security over those keys is more critical. As a result, in this protocol, administrative (establishment operation) keys are first-time, one-time, and only-time use as administrative keys. 

#### Dead-Attacks

By definition, a Dead-attack on a given establishment event occurs after the Key-state for that event has become stale because a later establishment event has rotated the sets of signing and prerotated keys to new sets. There are two types of Dead-attacks. The first is a compromise of the stale signing keys from a stale establishment event needed to sign non-establishment events, such as an interaction event. This is denoted as a non-establishment Dead-Attack. The second is a compromise of the stale prerotated keys from a stale establishment event needed to sign a subsequent establishment event, such as a rotation event. This is denoted as an establishment Dead-attack.

##### Non-establishment Dead-attack

A successful non-establishment Dead-Attack must first compromise the set of signing keys for some past but stale interaction (non-establishment) event, second, create an alternate verifiable version of that stale interaction event, and third, propagate this alternate event to a given validator before the original event has had time to propagate to that validator or any other component the validator may access as First-Seen. This looks like what is commonly known as an eclipse attack on a validator {{eclispe attack}}. To protect against such an attack, a controller must propagate the event sufficiently widely enough that the attacker can't eclipse all components, such as Watchers, that the validator may consult. The more distant the stale event is in the past the more difficult it becomes to mount a successful eclipse attack because the event would have more time to be universally propagated to the full network of watchers. Otherwise, the Validator would have already First-seen the original event and the compromised event would be dropped i.e. can't be accepted as First-seen by the Validator. Network propagation times are, at most, seconds and may be as little as milliseconds, which only opens a very short time window of how stale a stale event may be before it is sufficiently protected from any such eclipse attack. Should the event also be protected with a witness pool, then the attacker must compromise not only the stale signing keys but also a threshold satisficing number of witnesses protecting that event. This could make a non-establishment attack practically infeasible.  

The one exception would be the case where the event's key state has only a single signing key and a single prior prerotated key that has been repurposed as the single signing key, which the signing key has been compromised. In this case, the attacker could then attempt an establishment Dead-attack by creating a compromised state rotation event using the stale compromised signing key as a compromised rotation key in order to compromise the immediately prior establishment event. The attacker can then rotate in a set of witnesses under its control so that witness compromise is not needed. Notwithstanding this exploit, as the next paragraphs explain, the controller is still protected against an establishment Dead-attack as long as the original event has had time to propagate as First-seen to any component, such as a watcher the Validator chooses to consult. 

##### Establishment Dead-attack

A successful establishment Dead-attack must first compromise the set of current signing keys for some past stale rotation event, second, create an alternate verifiable version of that stale rotation event, and third, propagate this alternate event to a given validator before the original event has had time to propagate to that validator or any other component the validator may access as First-Seen. The prerotation's pre-commitment to the next set of keys means that no other successful establishment Dead-Attack-based exploit is possible. A subsequent rotation event that was not signed with the pre-committed next keys from the prior rotation would not be verifiable.  Unlike a non-establishment dead attack, the attacker could rotate in a set of witnesses under its control so that witness compromise is not needed, i.e., the witness pool provides no additional protection. One way to better protect against this exploit is to use partial rotation so that prerotated keys are not repurposed as singing keys for interaction events but are first-time, one-time, only-time exposed for signing a rotation. This minimizes the exposure of prerotated keys as signing keys and, therefore, minimizes the ability of an attacker to mount an establishment Dead-attack, which requires compromising rotation keys.  

To elaborate, compromising a set of keys after the first use, given best practices for key storage and key signing, may be very difficult, but it is still possible. One way to minimize the potential of exploit is to only use rotation keys once using partial rotation. Nonetheless, sometime later, should an attack succeed in compromising a set of stale set of prerotated keys and thereby creating an alternate but verifiable event. This may be an eventuality for all non-quantum safe, stale signing and rotation keys.

In any case, a validator or other component may still be protected as long as the original version of the event has had time to propagate as First-Seen to that validator or other component (such as witness, watcher, juror, judge) that the validator may access. Therefore, in order to successfully detect duplicity and thereby be protected, any validator needs merely to compare any later copy of the event with any copy of the original event as propagated to any component it may consult. The attacker, therefore, must get ahead of the propagation of a past rotation event. A later surprise quantum attack provides no advantage in this case since the event has already propagated and is already First-seen. The compromised event would be detectable as duplicitous and dropped.

To restate, as already described above, this type of attack looks like what is commonly known as an eclipse attack on a validator {{eclispe attack}}. To protect against such an attack, a controller must propagate the event sufficiently widely enough that the attacker can't eclipse all components, such as Watchers, that the validator may consult. The more distant the stale event is in the past the more difficult it becomes to mount a successful eclipse attack because the event would have more time to be universally propagated to the full network of watchers. Otherwise, the Validator would have already First-seen the original event and the compromised event would be dropped i.e. can't be accepted as First-seen by the Validator. Network propagation times are, at most, seconds and may be as little as milliseconds, which only opens a very short time window of how stale a stale event may be before it is sufficiently protected from any such eclipse attack. 

To further elaborate, recall that the original version of the event is the one that first exposes the keys to potential compromise. This may only allow a very narrow window of time for an attacker to get ahead of that event's propagation. In other words, in order for a Dead-Attack to be successful, it must completely avoid detection as duplicitous. To do this, it must either prevent the validator from gaining access to any original copy of the key event history, i.e. an eclipse attack or, equivalently, must first destroy all extant copies of the original key event history accessible to the validator, i.e. some type of deletion attack. This may be very difficult given a sufficiently widespread watcher network. 

Moreover, a controller merely needs to receive confirmation via a signed receipt by a validator of its last rotation event to ensure that that validator is protected from future exploitation via deletion Dead Attack. In this case, the controller can replay back to the Validator the Validator's non-reputable signed receipt to recover the Validator from a deletion attack. Likewise if the controller itself keeps redundant copies of its events, then a deletion attack must completely delete every single copy, otherwise the deletion attack is detectable. A partial deletion attack will always be detectable.

To summarize, an alternate but verifiable version of a rotation event would be detectably inconsistent, i.e., duplicitous with the original version of the event stored in any copy of the original key event history (KEL/KERL). Consequently, any validator (or other component or entity) that has access to the original key event history is protected from harm due to a later successful compromise of the keys of any event already in that history i.e. any form of Dead-attack. 

As a special case, to even better protect the initial keypairs in an inception event from a Dead-attack, a controller may coincidently create both the inception event and an immediately following rotation event and then emit them together as one. The initial (original incepting) keypairs may be discarded (including removing all traces from signing infrastructure) after creation but before emission of the coincident events, thereby minimizing the exposure to Dead Attack of these initial keypairs.


Diagram Dead-Attack Exploit

#### Live-Attacks

There are two types of Live-Attacks. The first is a compromise of the current signing keys used to sign non-establishment events, such as an interaction event. This is denoted as a non-establishment Live-Attack. The second is a compromise of the current prerotated keys needed to sign a subsequent establishment event, such as a rotation event. This is denoted as a non-establishment Live-Attack.

##### Non-establishment Live-attack

A successful non-establishment Live-Attack means that the attacker is able to verifiably sign and propagate a new interaction event. When the interaction event is also protected by a witness pool with a threshold, then the attacker must also compromise a threshold satisficing number of witnesses, or else the event is not verifiable by any validator. If the witness pool is setup to accept events when merely signed by the controller then the witness pool provides no additional protection from Live-attack. The witness pool merely provide reliable fault tolerant high-availability. However, when the members of the witness pool are set up to only accept local (i.e. protected) sourced events from their controller using some unique (per-witness) secondary authentication mechanism, them merely compromising the signing keys is not enough the attacker must also compromise a threshold satisficing number of unique secondary authentication factors of the witnesses. A combined primary set of multi-sig controller authentication factors  and secondary mult-factor witness authentication factors can make a successful non-establishment Live-attack exploit practically infeasible. Notwithstanding this difficulty, even in the case where a successful non-establishment Live-attack succeeds, control over the identifier can be recovered using a recovery rotation (for more detail see the Annex or Recovery and Reconciliation). 

#### Establishment Live-attack

A successful establishment Live-Attack means that the attacker somehow compromises the unexposed next (pre-rotated) set of keys from the latest rotation event before that event has been propagated. This means compromise must occur at or before the time of the first use of the keys to sign the establishment event itself. Such a compromise is extremely difficult and the primary reason for prerotation is to mitigate the possibility of an establishment Live-attack in the first place.  In an establishment live attack, the witness pool provides no additional security because the compromised rotation event can rotate in new witnesses under the control of the attacker. One way to mitigate establishment Live-attack is to use a thresholded multi-sig set of prerotated keys.

Notwithstanding any mitigations, assuming a successful compromise of the prerotated keys, duplicity detection with or without witness protection may not protect against a resulting establishment live attack. This is because such a Live-attack would be able to create a new verifiable rotation event with next keys and new witnesses under the attacker's control and propagate that event in advance of a new rotation event created by the original controller. Such a successful Live-attack exploit may effectively and irreversibly capture control of the identifier. Moreover, in the case of a successful Live-attack exploit, new rotation events from the original controller would appear as duplicitous to any validator or other component that already received the exploited rotation event and accepted it as the First-seen version of that event. Consequently, protection from establishment Live-attack exploits comes exclusively from the difficulty of compromising a set of prerotated keys before or at the time of their first use (exposure).

To elaborate, a successful live exploit must compromise the unexposed next set of private keys from the public-keys declared in the latest rotation. Assuming the private keys remain secret, a compromise must come either by brute force inversion of the one-way digest function protecting the public keys and then by brute force inversion of the one-way scalar multiplication function that generates the public key from the private keys or by a side-channel attack at the first-use of the private keys to sign the rotation event. By construction, no earlier signing side-channel attack is possible. This makes successful Live-attack exploits from such side-channel attacks extremely difficult. 

Given the cryptographic strength of the key generation algorithm, a successful brute force live attack may be computationally infeasible.  Hiding the unexposed next (pre-rotated) public keys behind cryptographic strength digests provides an additional layer of protection not merely from pre-quantum brute force attacks but also from surprise post-quantum brute force attacks. In this case, a brute force attack would first have to invert the post-quantum resistant one-way hashing function used to create the digest before it may attempt to invert the one-way public key generation algorithm. Moreover, as computation capability increases, the controller can merely rotate to correspondingly strong quantum-safe cryptographic one-way functions for key generation. This makes brute force live attack computationally infeasible indefinitely. For more detail see the {{Annex on Cryptographic Strength}}.

#### Delegated Event Live-attacks

Notwithstanding the foregoing section, delegated events are provided with an additional layer of protection against and an additional means of recovery from establishment Live-attack exploits.  As described previously, a delegated event is only valid if the validator finds an anchored delegation seal of the delegated establishment event in the delegator's KEL. This means that notwithstanding a successful compromise of the delegatee's current set of prerotated keys, the attacker is not able to issue a valid compromised rotation event. The attacker must also issue a delegation seal of the compromised rotation event in the delegator's KEL. This means the attacker must either induce the delegator to issue a seal or must also compromise the delegator's signing keys. This provides an additional layer of protection from establishment Live-attack for delegated events. 

Moreover, anytime the sealing (anchoring) event in the delegator's kel may be superseded by another event, then the delegator and delegatee may execute a superseding recovery of an establishment event in the delegatee's KEL and thereby recover from the establishment Live-attack. This is not possible with an establishment Live-attack on a non-delegated event.


[//]: # (\backmatter)

[//]: # (# Cryptographic strength and security {#sec:annexA .informative})

## Annex

### Cryptographic strength and security

#### Cryptographic strength

For crypto-systems with perfect-security, the critical design parameter is the number of bits of entropy needed to resist any practical brute force attack. In other words, when a large random or pseudo-random number from a cryptographic strength pseudo-random number generator (CSPRNG) [[ref: CSPRNG]] expressed as a string of characters is used as a seed or private key to a cryptosystem with perfect-security, the critical design parameter is determined by the amount of random entropy in that string needed to withstand a brute force attack. Any subsequent cryptographic operations must preserve that minimum level of cryptographic strength. In information theory, [[ref: IThry]] [[ref: ITPS]] the entropy of a message or string of characters is measured in bits. Another way of saying this is that the degree of randomness of a string of characters can be measured by the number of bits of entropy in that string.  Assuming conventional non-quantum computers, the convention wisdom is that, for systems with information-theoretic or perfect-security, the seed/key needs to have on the order of 128 bits (16 bytes, 32 hex characters) of entropy to practically withstand any brute force attack [[ref: TMCrypto]] [[ref: QCHC]]. A cryptographic quality random or pseudo-random number expressed as a string of characters will have essentially as many bits of entropy as the number of bits in the number. For other crypto-systems such as digital signatures that do not have perfect-security, the size of the seed/key may need to be much larger than 128 bits in order to maintain 128 bits of cryptographic strength.

An N-bit long base-2 random number has 2<sup>N</sup> different possible values. Given that no other information is available to an attacker with perfect-security, the attacker may need to try every possible value before finding the correct one. Thus the number of attempts that the attacker would have to try maybe as much as 2<sup>N-1</sup>.  Given available computing power, one can easily show that 128 bits is a large enough N to make brute force attack computationally infeasible.

The  adversary may have access to supercomputers. Current supercomputers can perform on the order of one quadrillion operations per second. Individual CPU cores can only perform about 4 billion operations per second, but a supercomputer will parallelly employ many cores. A quadrillion is approximately 2<sup>50</sup> = 1,125,899,906,842,624. Suppose somehow an adversary had control over one million (2<sup>20</sup> = 1,048,576) supercomputers which could be employed in parallel when mounting a brute force attack. The adversary then could try 2<sup>50</sup> x  2<sup>20</sup> = 2<sup>70</sup> values per second (assuming very conservatively that each try took only one operation).

There are about 3600 * 24 * 365 = 313,536,000 = 2<sup>log<sub>2</sub>313536000</sup>=2<sup>24.91</sup> ~= 2<sup>25</sup> seconds in a year. Thus this set of a million super computers could try 2<sup>50+20+25</sup> = 2<sup>95</sup> values per year. For a 128-bit random number this means that the adversary would need on the order of 2<sup>128-95</sup> = 2<sup>33</sup> = 8,589,934,592 years to find the right value. This assumes that the value of breaking the cryptosystem is worth the expense of that much computing power. Consequently, a cryptosystem with perfect-security and 128 bits of cryptographic strength is computationally infeasible to break via brute force attack.

[//]: # (Information theoretic security and perfect-security {#sec:annexB .informative})

#### Information theoretic security and perfect-security

The highest level of cryptographic security with respect to a cryptographic secret (seed, salt, or private key) is called  information-theoretic security. A cryptosystem that has this level of security cannot be broken algorithmically even if the adversary has nearly unlimited computing power including quantum computing. It must be broken by brute force if at all. Brute force means that in order to guarantee success the adversary must search for every combination of key or seed. A special case of information-theoretic security is called perfect-security.  Perfect-security means that the ciphertext provides no information about the key. There are two well-known cryptosystems that exhibit perfect-security. The first is a one-time-pad (OTP) or Vernum Cipher;  the other is secret splitting, a type of secret sharing that uses the same technique as a one-time-pad.

#### Post-Quantum Security
Post-quantum or quantum-safe cryptography deals with techniques that maintain their cryptographic strength despite attacks from quantum computers {{[109; 150]}}. Because it is currently assumed that practical quantum computers do not yet exist, post-quantum techniques are forward-looking to some future time when they do exist. A one-way function that is post-quantum secure will not be any less secure (resistant to inversion) in the event that practical quantum computers suddenly or unexpectedly become available. One class of post-quantum secure one-way functions are some cryptographic strength hashes. The analysis of D.J. Bernstein with regards the collision resistance of cryptographic one-way hashing functions concludes that quantum computation provides no advantage over non-quantum techniques {{[25]}}. Consequently, one way to provide some degree of post-quantum security is to hide cryptographic material behind digests of that material created by such hashing functions {{[141]}}. This directly applies to the public keys declared in the pre-rotations. Instead of a pre-rotation making a cryptographic pre-commitment to a public key, it makes a pre-commitment to a digest of that public key. The digest may be verified once the public key is disclosed (unhidden) in a later rotation operation. Because the digest is the output of a one-way hash function, the digest is uniquely strongly bound to the public key. When the unexposed public keys of a pre-rotation are hidden in a digest, the associated private keys are protected from a post-quantum brute force inversion attack on those public keys. 

To elaborate, a post-quantum attack that may practically invert the one-way public key generation (ECC scalar multiplication) function using quantum computation must first invert the digest of the public key using non-quantum computation. Pre-quantum cryptographic strength is, therefore, not weakened post-quantum. A surprise quantum capability may no longer be a vulnerability. Strong one-way hash functions, such as 256-bit (32-byte) Blake2, Blake3, and SHA3, with 128-bits of pre-quantum strength, maintain that strength post-quantum. Furthermore, hiding the pre-rotation public keys does not impose any additional storage burden on the controller because the controller must always be able to reproduce or recover the associated private keys to sign the associated rotation operation. Hidden public keys may be compactly expressed as Base64 encoded qualified public keys digests (hidden) where the digest function is indicated in the derivation code.

#### KERI Security Properties

Every operation in this protocol is expressed via cryptographically verifiable events. Successful exploitation, therefore, must attack and compromise the availability and/or consistency of events. Security analysis, therefore, is focused on characterizing the nature and timing of these attacks and how well the protocol preserves the availability and consistency of events when subject to attack. We, therefore, describe potential exploits in terms of these properties.

The first property concerns live versus dead event exploits. A live exploit involves attacks on current or recent events. Protection from live exploits is essential to maintaining operational security in the present. Protection from live exploits focuses on providing sufficient availability of current events as well as ensuring their consistency (non-duplicity). A dead exploit, in contrast, involves attacks on past events. Protection from dead exploits is primarily provided by duplicity detection (consistency). One verifiable copy of a KEL (KERL) is enough to detect duplicity in any other verifiable but inconsistent copy. Attacks on the availability of past events are relatively easily mitigated by archiving redundant copies. The eventuality of dead exploits of compromised signing keys must be mitigated because digital signatures may become less secure as computing and cryptographic technology advance over time (quantum or otherwise). Eventually, their keys may become compromised via a direct attack on their cryptographic scheme. 

The second property is a direct versus indirect operational mode exploit. The protocol may operate in two basic modes, called direct and indirect. The availability and consistency of attack surfaces are different for the two modes, and hence, the mitigation properties of the protocol are likewise mode-specific.

The third property is a malicious third party versus a malicious controller exploit. In the former, the attack comes from an external malicious attacker, but the controller is honest. In the latter, the controller may also be malicious and, in some ways, may be indistinguishable from a successful malicious third party. The incentive structure for the two exploit types is somewhat different, and this affects the mitigation properties of the protocol. We find it helpful in both the design and analysis of protection to consider these two kinds of attacks separately.

The main participants in the protocol are controllers and validators. The other participants, such as witnesses, watchers, jurors, judges, and resolvers, provide support to and may be under the the control of either or both of the two main participants. 
The analysis of protection against an attack can be further decomposed into three properties of each protection mechanism with respect to an attack: susceptibility to being attacked, vulnerability to harmfulness given an attack, and recoverability given a harmful attack. Security design involves making trade-offs between these three properties of protection mechanisms. Harm from a successful exploit may arise in either or both of the following two cases: 
- A controller may suffer harm due to the loss or encumberment of some or all of its control authority such that the malicious entity may produce consistent, verifiable events contrary to the desires of the controller and/or impede the ability of the controller to promulgate new key events.
- A validator may suffer harm due to its acceptance of inconsistent verifiable events produced by a malicious entity (controller and/or third party). 

Protection consists of either prevention or mitigation of both of the harm cases. The primary protection mechanisms for the controller include best practice key management techniques for maintaining root control authority, redundant confirmation of events by supporting components, and duplicity detection on the behavior of designated supporting components. The primary protection mechanism for the validator is duplicity detection on the behavior of supporting components. 




### Validation


#### Verifier
A verifier is an entity or component that cryptographically verifies an event message's structure and its signature(s). Structure verification includes verifying the event's said, the appearance of fields, and prior event digests. In order to verify signatures, a verifier must first determine which set of keys are or were the controlling set for the AID of that event when the event was issued. In other words, a verifier must also establish the control authority for the event at issuance. This control establishment requires a copy of the inception event for identifiers that are declared as non-transferable at inception. For identifiers that are declared transferable at inception, this control establishment requires a complete copy of the sequence of key operation events (inception and all rotations) for the identifier up to and including the issued event. Signature verification includes verifying signatures from both current signing and exposed prior rotation (if any) public keys for the event. This includes verifying threshold satisfaction for both current and prior rotation thresholds. Without loss of generality, any reference to the verification of an event or verification of an event's signatures refers to the complete process described above.

#### Validator
In contrast, a validator is an entity or component that determines that a given signed event associated with an AID was valid at the time of its issuance. Validation first requires that the event itself is verifiable; that is, it has verifiable structure and signatures from the current controlling key pairs at the time of its issuance. Therefore, a validator must first act as a verifier in order to establish the root authoritative set of keys and verify the associated signatures. Once verified, the validator may apply other criteria or constraints to the event in order to determine its validity. This may include witnessing and delegation validation. The final result of validation may be acceptance of the event into the associated KEL. The location of an event in its key event sequence is determined by its sequence number, `sn`. The version of an event at a given location in the key event sequence is different or inconsistent with some other event at the same location if any of its content differs or is inconsistent with that other event. 

#### Duplicity

A duplicitous event is defined as a verified but different version of an event at the same location. The possession of a KEL for any AID enables duplicity detection by a validator for any set of events with respect to that KEL. Indeed, this property of KERI enables duplicity evident processing of events. This forms a basis for evaluating trust in the controller of an AID. A validator can decide to trust or not based on the evidence or lack thereof of duplicity. A validator may choose to trust when there is no evidence of duplicity. A validator should choose not to trust when there is evidence of duplicity. In some cases, as will be described forthwith, the controller may perform a recovery operation that enables a validator to reconcile that duplicity and allow the validator to once again trust the controller.

#### Event Types and Classes

In validation, in addition to the version, the type and/or class of event may matter. The are five types of events, inception, `icp`, rotation, `rot`, interaction, `ixn`, delegated inception `dip`, and delegated rotation, `drt`. 

There are two main classes of events these are: 
- establishment consisting of the types inception, rotation, delegated inception, and delegated rotation. 
- non-establishment consisting of the type, interaction.

There is one sub-class, delegated establishment, which consists of the types of delegated inception and delegated rotation.

#### Validator Roles and Event Locality

Each controller must accept events into its own copy of its KEL. In that sense, every controller is also a validator for its own AID. Controllers, as validators, play different roles for different types and classes of events. The validation logic for acceptance of an event into a given controller's KEL depends on the role that the controller plays for that type or class of event. 

The possible roles that a given validator may play for any given event are as follows: controller, witness, delegator, delegatee, or none of the above. For the sake of clarity, let us call validators that act in different roles with respect to a given event
the parties to the event. When the context makes it clear, a party that is not one of a controller, witness, delegator, or delegatee is called simply a validator. Otherwise, the role of the validator is qualified. We can then more simply express the roles as controller, witness, validator, delegator, and delegatee. It may be referred to as a validator when it does not matter what role a party plays. To clarify, all the parties perform validation, but the validation rules are different for each role.
A given controller may also act as a delegator or delegatee for a given event. A given event for an AID may both delegate other AIDs and be delegated by yet other AIDs. An event is processed differently by each party depending on its respective role or roles.

Moreover, events are also processed as either local (protected, tustable) or nonlocal, i.e, remote (unprotected, untrustable). The validator of a local event may assume that the event came from a protected, trustable source, such as the device upon which the validation code is running or from a protected transmission path from some trustable source. The validator of a remote (nonlocal) event must assume that the event may have come from a malicious, untrustable source.  To elaborate, an event is deemed local when the event is sourced locally on a device under the supervision of the validator or was received via some protected channel using some form of MFA (multi-factor authentication) that the validator trusts. Am event is deemed remote (nonlocal) when it is received in an unprotected (untrustable) manner. The purpose of local versus remote is to enable increased security when processing local events where a threshold structure may be imposed, such as a threshold of accountable duplicity for a witness pool.

To elaborate, a witness pool may act as a threshold structure for enhanced security when each witness only accepts local events that are protected by a unique authentication factor in addition to the controller's signatures on the event, thereby making the set of controller signature(s) the primary factor and the set of unique witness authentication factors a secondary thresholded multifactor. In this case, an attacker would have to compromise not merely the controller's set of private key(s) but also the unique second factor on each of a threshold number of witnesses.

Likewise, a delegator may act as a threshold structure for enhanced security when the delegator only accepts local events for delegation that are protected by a unique authentication factor, thereby making the set of controller signature(s) the primary factor, the set of unique witness authentication factors a secondary thresholded multifactor and the delegator's unique authentication factor as a tertiary factor. An attacker, therefore, has to compromise not merely the controller's
private key(s) as the primary factor but also the unique secondary factor on each of a threshold number of witnesses and the unique tertiary factor for the delegator. This layered set of multifactor authentication mechanisms can make exploit practically infeasible.

#### Validation Rules

The validation rules are as follows:

- Given a local event, the event's controller (non-delegatee) can sign and accept that event into its copy of that event's KEL. The controller should then propagate that event with attached controller signatures to the event's witnesses for receipting. Given a remote event, the event's controller (non-delegatee) should not sign or otherwise accept that event into its copy of that event's KEL. The controller should not propagate that event to the event's witnesses for receipting.

- Given a local event, the event's witness must first verify the event's controller signatures before it can sign (witness) and accept that event into its copy of that event's KEL. The witness should then create a receipt of the event with the attached controller and witness signatures and can then propagate that event to other validators. Given a remote event, the event's witness should not sign or otherwise accept that event into its copy of that event's KEL. The witness should not propagate that event to other validators including witnesses.

- Given a local delegated event, the event's delegatee can sign and accept that event into its copy of that event's KEL. The delegatee should then propagate that event with attached signatures to the event's witnesses for receipting. The delegatee should also propagate that event with attached controller signatures and attached witness signatures (if witnessed) to the event's delegator for approval via an anchored seal. Given a remote event, the event's delegatee should not sign or otherwise accept that event into its copy of that event's KEL. The delegatee should not propagate that event to the event's witnesses for receipting or to the event's delegator for approval.

- Given a local delegated event, the event's delegator must first verify the event's delegatee signatures and witness signatures (if witnessed) before it can accept that event into its copy of that event's KEL. The delegator can then decide to approve that event by sealing (anchoring the event's seal) the event in the delegator's own KEL. Given it sealed the event, the delegator can then propagate a receipt of the sealing (anchoring) event to the event's delegatee and to the event's witnesses (if any).  Given a remote delegated event, the event's delegator should not approve (seal) or otherwise accept that event into its copy of that event's KEL. A malicious attacker that compromises the pre-rotated keys of the delegatee may issue a malicious but verifiable rotation that changes its witness pool in order to bypass the local security logic of the witness pool. The approval logic of the delegator should choose not to automatically approve a delegable rotation event unless that event's change to the witness pool is below the witness pool's prior threshold.

- Given a local or remote event, a non-controller, non-witness, non-delegator validator must first verify the event's controller signatures, witness signatures (if witnessed), and delegator anchoring seal (if delegated) before it can accept that event into its copy of that event's KEL.

- Given either a local or remote receipt any validator must first verify the witness signatures or delegator seals attached to that receipt and then can attach those signatures or seals to its copy of the event.

### Superseding Recovery and Reconciliation

#### First Seen Policy

Once a given version of an event at a location has been accepted, it is considered "first seen" for that KEL. Once an event has been first seen, it is always seen and can't be unseen. This rule is succinctly expressed as "first seen, always seen, never unseen." This first-seen property enables duplicity detection of different versions of an event. Although an event can never be unseen, in some special cases, it may be superseded by a different version of an event at the same location. Although never explicitly represented in an event message itself, each event belonging to a KEL is also assigned a strictly monotonically increasing integer ordinal called the first-seen number, `fn`, which is stored alongside the event in the KEL database. This allows any copy of a KEL to keep track of the ordering of when each event was first-seen independent of the event's location given by its sequence number, `sn`. Different copies of a KEL may have different first-seen numbers, `fn` for given versions of events at a location, `sn`, but consistent copies of the KEL will have the same version of the event at every location. Events that are superseded are essentially forked. A KEL is essentially a directed acyclic graph (DAG) of events. When an event is superseded, a branch in the DAG is created. There may be only one undisputed path through the DAG called the trunk. All the superseded branches are considered disputed. 

#### Reconciliation

Reconciliation is the process of determining the undisputed path, i.e., the trunk. If every validator of a KEL cannot universally find the same undisputed path (trunk) through a KEL, then the KEL is irreconcilable. Reconciliation happens by applying the superseding validation acceptance (reconciliation) rules to different versions of events that are received for the same location in a KEL. Superseding events provide a universal reconciliation process to enable recovery from key compromises where such key compromises resulted in the first acceptance of compromised events into a KEL. Recovery happens with superseding rotation events that both rotate out the compromised keys and dispute the events signed by those compromised keys. Because events are signed nonrepudiably, any key compromise is still the responsibility of the controller. That controller may still be held accountable for any harm that resulted from the compromise. However, recovery enables the KEL to be repaired so that future validators of the KEL will not see the compromised events after recovery. The events will only be seen by the validators who first saw the events before recovery.

The superseding validation acceptance rules for events at a given location may involve some combination of the location, version, type, and class of the event as well as the role of the validator, such as controller, witness, delegator, delegatee, or none of the above.


#### Superseding Recovery

To supersede an event means that after an event has already been accepted as first seen into a KEL, a different event at the same location (same sequence number) is accepted that supersedes that pre-existing event. The new event becomes part of the trunk (undisputed path), and the old event is the first event in a fork (branch) that includes all the subsequent events to the superseded event. This enables the recovery over the control of a KEl in spite of events signed by compromised keys. The result of superseded recovery is that the KEL is forked at the `sn` (location) of the superseding event. The compromised events are shunted to the disputed branch, and new events to the KEL are attached to the new end of the trunk formed by the superseding event. To clarify, all events in the superseded branch of the fork still exist but, by virtue of being superseded, are disputed. The set of superseding events in the superseding fork forms the authoritative branch of the KEL, i.e., its trunk or undisputed path. All the already-seen but superseded events in the superseded fork still remain in the KEL. They may be viewed or replayed in order of their original acceptance because the database stores all accepted events in order of acceptance and denotes this order using the first seen ordinal number, `fn`. The `fn` is not the same as the `sn` (sequence number). Each event accepted into a KEL has a unique `fn` but multiple events due to recovery forks may share the same `sn`.  Events with the same `sn` in different copies of the same KEL may have different `fns` because the events may have been first seen or accepted into that KEL in a different order. Notably, an event that may not supersede, according to the rules below, another event at the same location cannot be first seen at all by that KEL. This effectively protects the KEL from later compromise for any downstream recipients of that KEL.


#### Superseding Rules for Recovery at a given location, SN (sequence number).

A.

  A0. Any rotation event may supersede an interaction event at the same `sn` where that interaction event is not before any other rotation event.
  
  A1. A non-delegated rotation may not supersede another rotation.
  
  A2. An interaction event may not supersede any event.
  

B.  A delegated rotation may supersede the latest-seen delegated rotation at the same `sn` under either of the following conditions:

  B1.  The superseding rotation's delegating event is later than the superseded rotation's delegating event in the delegator's KEL, i.e., the `sn` of the superseding event's delegation is higher than the `sn` of the superseded event's delegation.
  
  B2. The superseding rotation's delegating event is the exact same delegating event as the superseded rotation's delegating event in the delegator's KEL, and the anchoring seal of the superseding rotation's delegated event appears later in the seal list than the anchoring seal of the superseded rotation's delegated event. i.e., both superseded and superseding event delegations appear in the same delegating event, and the anchoring seal of the superseding rotation's event appears later in the seal list than the anchoring event seal of the superseded rotation's event.

  B3. The `sn` of the superseding rotation's delegating event is the same as the `sn` of the superseded rotation's delegating event in the delegator's KEL, and the superseding rotation's delegating event is a rotation, and the superseded rotation's delegating event is an interaction, i.e., the superseding rotation's delegating event is itself a superseding rotation of the superseded rotation's delegating interaction event in its delegator's KEL.

C. IF Neither A nor B is satisfied, then recursively apply rules A. and B. to the delegating events of those delegating events and so on until either  A. or B. is satisfied, or the root KEL of the delegation which must be undelegated has been reached.

  C1. If neither A. nor B. is satisfied by the recursive application of C. to each delegator's KEL in turn, i.e., the root KEL of the delegation has been reached without satisfaction, then the superseding rotation is discarded. The terminal case of the recursive application of C. will occur at the root KEL, which by definition must be non-delegated therefore either A. or B. must be satisfied, or else the superseding rotation must be discarded.

The latest-seen delegated rotation constraint in B means that any earlier delegated rotations can NOT be superseded. This greatly simplifies the validation logic and avoids a potentially infinite regress of forks in the delegated identifier's KEL. However, this means recovery can happen for any compromise of pre-rotated keys, only the latest-seen. In order to unrecoverably capture control of a delegated identifier, the attacker must issue a delegated rotation that rotates to keys under the control of the attacker that the delegator must approve and then issue and get approved by the delegator another rotation that follows but does not supersede the compromising rotation. At that point, recovery is no longer possible because the delegate would no longer control the private pre-rotated keys needed to sign a recovery rotation as the latest-seen rotation verifiably. Recovery is possible after the first compromised rotation by superseding it but not after the subsequent compromised rotation.

For example, in the diagram below, a rotation event at the same location may supersede an interaction. This enables recovery of live exploit of the exposed current set of authoritative keys used to sign non-establishment events via a rotation establishment event to the unexposed next set of authoritative keys. The recovery process forks off a disputed branch from the recovered trunk. This disputed branch has the compromised events, and the main trunk has the recovered events. 

Diagram Here




### KERI's Algorithm for Witness Agreement (KAWA)

#### Introduction

A controller may provide a highly available promulgation service for its events via a set or pool of N designated witnesses. This witness pool may also provide enhanced security for the controller over its events. Even though the witnesses are explicitly designated by the controller, they may or may not be under the control of the controller. The designation is a cryptographic commitment to the witnesses via a verifiable statement included in an establishment event. The purpose of the witness set is to better protect the service from faults including Byzantine faults {{36}}. Thus, the service employs a type of Byzantine Fault Tolerant (BFT) algorithm. We call this KERI’s Algorithm for Witness Agreement (KAWA) (formerly known as KA2CE). The primary purpose of KAWA is to protect the controller’s ability to promulgate the authoritative copy of its key event history despite external attacks. This includes maintaining a sufficient degree of availability such that any validator may obtain an authoritative copy on demand. 

The critical insight is that because the controller is the sole source of truth for the creation of any and all key events, it alone, is sufficient to order its own key events. Indeed, a key event history does not need to provide double spend proofing of an account balance, merely consistency. Key events, by and large, are idempotent authorization operations as opposed to non-idempotent account balance decrement or increment operations. Total or global ordering may be critical for non-idempotency, whereas local ordering may be sufficient for idempotency, especially to merely prove the consistency of those operations. The implication of these insights is that fault tolerance may be provided with a single-phase agreement by the set of witnesses instead of a much more complex multi-phase commit among a pool of replicants or other total ordering agreement process as is used by popular BFT algorithms {{[16; 39; 43; 48; 61; 115; 123; 144]}}. Indeed, the security guarantees from KAWA may approach that of other BFT algorithms but without their scalability, cost, throughput, or latency limitations. If those other algorithms may be deemed sufficiently secure then so may be KAWA. Moreover, because the controller is the sole source of truth for key events, a validator may hold that controller (whether trusted or not) accountable for those key events. As a result, the algorithm is designed to enable a controller to provide itself with any degree of protection it deems necessary given this accountability. 

#### Advantages

The reliance on a designated set of witnesses provides several advantages. The first is that the identifier’s trust basis is not locked to any given witness or set of witnesses but may be transferred at the controller’s choosing. This provides portability. The second is that the number and composition of witnesses is also at the controller’s choosing. The controller may change this in order to make trade-offs between performance, scalability, and security. This provides flexibility and adaptability. Thirdly the witnesses need not provide much more than verification and logging. This means that even highly cost or performance constrained applications may take advantage of this approach. 
Likewise, given any guarantees of accountability the controller may declare, a validator may provide itself with any degree of protection it deems necessary by designating a set of observers (watchers, jurors, and judges) . Specifically, a validator may be protected by maintaining a copy of the key event history as first seen (received) by the validator or any other component trusted by the validator (watcher, juror, judge). This copy may be used to detect any alternate inconsistent (duplicitous) copies of the key event history. The validator may then choose how to best respond in the event of a detected duplicitous copy to protect itself from harm. A special case is a malicious controller that intentionally produces alternate key event histories. Importantly, observer components that maintain copies of the key event history such as watchers, jurors, and judges, may be under the control of validators not controllers. As a result a malicious alternate (duplicitous) event history may be eminently detectable by any validator. We call this ambient duplicity detection (which stems from ambient verifiability). In this case, a validator may still be protected because it may still hold such a malicious controller accountable given a duplicitous copy (trust or not trust). It is at the validator’s discretion whether or not to treat its original copy as the authoritative one with respect to any other copy and thereby continue trusting or not that original copy. A malicious controller may not therefore later substitute with impunity any alternate copy it may produce. Furthermore, as discussed above, a malicious controller that creates an alternative event history imperils any value it may wish to preserve in the associated identifier. It is potentially completely self-destructive with respect to the identifier. A malicious controller producing a detectably duplicitous event history is tantamount to a detectable total exploit of its authoritative keys and the keys of its witness set. This is analogous to a total but detectable exploit of any BFT ledger such as a detectable 51% attack on a proof-of-work ledger. A detectable total exploit destroys any value in that ledger after the point of exploit. 
To restate a controller may designate its witness set in such a way as to provide any arbitrary degree of protection from external exploit. Nonetheless in the event of such an exploit a validator may choose either to hold that controller accountable as duplicitous and therefore stop trusting the identifier or to treat the validator’s copy of the key event history as authoritative (ignoring the exploited copy) and therefore continue trusting the identifier. This dependence on the validator’s choice in the event of detected duplicity both imperils any potential malicious controller and protects the validator. 

KERI’s Algorithm for Witness Agreement (KAWA) or the algorithm is run by the controller of an identifier in concert with a set of N witnesses designated by the controller to provide as a service the key event history of that identifier via a KERL (Key Event Receipt Log) in a highly available and fault-tolerant manner. One motivation for using key event logs is that the operation of redundant immutable (deletion proof) event logs may be parallelizable and hence highly scalable. A KERL is an immutable event log that is made deletion proof by virtue of it being provided by the set of witnesses of which only a subset of F witnesses may at any time be faulty. In addition to designating the witness set, the controller also designates a threshold number, M, of witnesses for accountability. To clarify, the controller accepts accountability for an event when any subset M of the N witnesses confirms that event. The threshold M indicates the minimum number of confirming witnesses the controller deems sufficient given some number F of potentially faulty witnesses. The objective of the service is to provide a verifiable KERL to any validator on demand. Unlike direct mode where a validator may be viewed as an implicit witness, with indirect mode, a validator may not be one of the N explicitly designated witnesses that provide the service. 

#### Witness Designation
The controller designates both the witness tally number and the initial set of witnesses in the inception event configuration. The purpose of the tally is to provide a threshold of accountability for the number of witnesses confirming an event. Subsequent rotation operations may amend the set of witnesses and change the tally number. This enables the controller to replace faulty witnesses and/or change the threshold of accountability of the witness set. When a rotation amends the witnesses it includes the new tally, the set of pruned (removed) witnesses and the set of newly grafted (added) witnesses. 

#### Witnessing Policy

In this approach, the controller of a given identifier creates and disseminates associated key event messages to the set of N witnesses. Each witness verifies the signatures, content, and consistency of each key event it receives. When a verified key event is also the first seen version of that event the witness has received, then it witnesses that event by signing the event message to create a receipt, storing the receipt in its log (KERL), and returning the receipt as an acknowledgment to the controller. Depending on its dissemination policy, a witness may also send its receipt to other witnesses. This might be with a broadcast or gossip protocol or not at all. 

In general, the witnessing policy is that the first seen version of an event always wins; that is, the first verified version is witnessed (signed, stored, acknowledged, and maybe disseminated), and all other versions are discarded. The exception to this general rule is that a rotation event may provide a superseding recovery. The recovery process may fork off a branch from the recovered trunk. This disputed branch has the disputed exploited events, and the main trunk has the recovered events. The operational mode and the threshold of accountable duplicity determine which events in the disputed branch are accountable to the controller.

Later messages or receipts from other witnesses may not change any existing entry in the log (the log is append-only, i.e., immutable) unless they are correctly reconcilable superseding events. Each witness also adds to its log any verified signatures from consistent receipts it receives from other witnesses. A consistent receipt is a receipt for the same version of the event already in its log at a location. Excepting superseding recovery, inconsistent receipts, i.e., for different event versions at the same location, are discarded (not kept in the log). However, as an option, a controller may choose to run a juror (in concert with a witness) that keeps a duplicitous event log (DEL) of the inconsistent or duplicitous receipts that a witness receives. To clarify, a witness’ key event receipt log (KERL) is by construction, an immutable log. This log includes the events with attached verified signatures, which are the receipts from the controller, the witness, and other witnesses.

Initial dissemination of receipts to the N witnesses by the controller may be implemented extremely efficiently with respect to network bandwidth using a round-robin protocol of exchanges between the controller and each of the witnesses in turn. Each time the controller connects to a witness to send new events and collect the new event receipts, it also sends the receipts it has received so far from other witnesses. This round-robin protocol may require the controller to perform at most two passes through the entire set of witnesses in order to fully disseminate a receipt from each witness to every other witness for a given event. This means that at most 2·N acknowledged exchanges are needed for each event to create a fully witnessed key event receipt log (KERL) at every witness and controller. Network load, therefore, scales linearly with the number of witnesses. 

When network bandwidth is less constrained, a gossip protocol might provide full dissemination with lower latency than a round-robin protocol but with higher bandwidth usage. Gossip protocols scale with N · log(N) (where N is the number of witnesses) instead of 2·N. A directed acyclic graph or other data structure can be used to determine what needs to be gossiped. 

#### Immunity and Availability

It can be shown that for any set of N witnesses, (see [[ref: KERI-WP  ]]) there is a threshold M < N that guarantees that at most one sufficient agreement occurs or none at all despite a dishonest controller but where at most F* = N-M of the witnesses are potentially unavailable and at most F < M is duplicitous. This guarantee means that the agreement is deemed immune (from failure due to faulty F or F*). To elaborate, given at most F* potentially unavailable or F potentially duplicitous witnesses, an immune agreement requires that M be a sufficient majority of N and guarantees as a result that the service may either only produce a sufficient agreement for one version of each event or none at all despite a dishonest or exploited controller. The following table provides values of  N, M, F, and F* that satisfy this immunity constraint.

| F |  N | 3F+1 | (N+F+1)/2 | N-F |   M | F*=N-M |
|--:|---:|-----:|----------:|----:|----:|-------:|
| 1 |  4 |    4 |         3 |   3 |   3 |      1 |
| 1 |  6 |    4 |         4 |   5 | 4,5 |    2,1 |
| 2 |  7 |    7 |         5 |   5 |   5 |      2 |
| 2 |  9 |    7 |         6 |   7 | 6,7 |    3,2 |
| 3 | 10 |   10 |         7 |   7 |   7 |      7 |
| 3 | 12 |   10 |         8 |   9 | 8,9 |    4,3 |


Given the immune constraint is satisfied, the service may not produce multiple divergent but proper key event receipt logs (KERLs). 
In order to be deemed proper, an agreement must have been verified as consistent with all prior events by every non-faulty witness who is a party to that agreement. Thus, any user of the service, be it a validator, watcher, juror, or judge, will be able to obtain either a proper event agreement on demand from some witness or none at all. Any non-faulty witness with a proper agreement will keep that agreement in its KERL and provide it on demand. Consequently, the availability of a proper event at a witness is tantamount to the availability of a proper log (KERL) of all prior events consistent with that event at that witness, and thereby, high availability of the service is assured.

#### Security Properties

The continuing promulgation of key events assumes a sufficiently responsive controller. Lack of responsiveness is primarily a threat to the controller, not a validator. Consequently, providing sufficient controller responsiveness is the controller's responsibility, not of KAWA. In contrast, a responsive but dishonest (or compromised) controller may pose a live threat to a validator with respect to new events never before seen by the validator. The validation process must provide means for the validator to protect itself from such threats. When the controller is responsive but dishonest, it may create inconsistent versions of an event that are first seen by different subsets of its witnesses. In the case where only F of the witnesses is faulty despite a dishonest controller, the validator may protect itself by requiring a large enough sufficient agreement or threshold of accountable duplicity, M, that guarantees that either only one satisfying agreement or none at all, e.g., makes the service immune. To restate, the validator may select its M to ensure the the service is immune such that the service will either provide one and only one proper key event receipt log (KERL) or none at all. This protects the validator.

A greater threat to a validator may be that of a dishonest controller that may collude with its witnesses to promulgate alternative (divergent) event version agreements, each with sufficient agreement. But this would violate the assumption of at most F faulty witnesses. In this case, the witness consensus process, i.e., the KAWA algorithm, may not protect the validator. Protection must come from some other process under the validator’s control. In this case, a validator may protect itself with duplicity detection via a set of observers (validators, watchers, jurors, judges). In such a case, in order to undetectably promulgate alternate but sufficiently accountable event version agreements, a dishonest controller with dishonest witnesses must prevent any validator from communicating with any other observer who may have seen any alternate event version agreement. This attack may be made practically unfeasible given a large and diverse enough set of observers. Indeed, once duplicity is detected, that identifier loses all its value to any detecting validator. This imperils any dishonest controller who attempts such an attack.

The final threat is the threat of dead exploit where, sometime in the future, the exposed key pairs used to sign past events in a KERL may be compromised. The compromised keys may then be used to create an alternate or divergent verifiable event history. Recall, however, that a proper KERL enables validation of the controlling keys of the associated identifier over the time frame of the events in the log. Once produced, a proper KERL may be provided by any observer (validator, watcher, juror, or judge) that has retained a copy of it not merely the witnesses. Subsequent compromise of a controller’s keys and a compromise of witnesses may not invalidate any of the events in a pre-existent proper KERL. 

Therefore, in order to fool a validator into accepting an erroneous or compromised divergent key event history, a successful exploiter must forge a proper KERL but with a different sequence of key events. To do this the exploiter must not only exploit the controller’s signing keys that were authoritative at some event but also exploit M of the N designated witnesses at that event as well. The exploiter must also prevent that validator from accessing any other but alternate proper KERL from any other observer (validator, watcher, juror, judger) that may have a copy as a check against such an attack. The combination of these tasks makes such an exploit extremely difficult to achieve.

Consequently, even in the extreme case that sometime in the future, a complete and total dead exploit of the controller keys and at least M of the witnesses occurs such that they forge a seemingly proper but divergent KERL, any prior copy of a proper KERL will enable detection and proof of accountable duplicity of that dead exploit. In this case, the validator may choose to use the prior copy from some set of jurors it trusts to determine which of the divergent KERLs is authoritative. This is similar to how certificate transparency works. In order for such a dead attack to succeed, the attacker must prevent a targeted validator from accessing any other copies of an alternate KERL. 

The idea of ambient verifiability mentioned above comes from the fact that the original KERL may be distributed among any number of watchers from whom a validator may obtain a copy. At some point, the degree of accessibility to an original copy becomes essentially ubiquitous, at which point verifiability may be considered ambient. Given ambient verifiability, then, duplicity detection becomes likewise ambient. 

To elaborate, a successful dead attack requires the isolation of a validator from ambient sources of the KERL. In general, isolation from ambient sources may be prohibitively expensive. Consequently, ambient verifiability provides asymmetry between the attacker and the defender in favor of the defender. Indeed, the end goal of KERI is to achieve ambient security in the sense that nearly anyone, anywhere, at any time, can become a verifiable controller of a verifiable identity that is protected by ambient verifiability and hence duplicity detection of the associated KERL. 

Furthermore, any mutual interaction events between a validator and controller may provide proof of priority. In a mutual interaction, the validator includes a copy or digest of an interaction event sourced by the controller in an event sourced by the validator. A total compromise of the controller and all witnesses would not be able to forge the validator’s signature on the mutual interaction event. Thus, the existence of any mutual interaction events may then be used to prove priority even in the extremely unlikely case of a complete and total dead exploit of a controller and all of its witnesses. 

Alternatively, in the case of a complete and total dead exploit, the validator and controller may jointly agree to use some other, more formal mechanism to resolve the priority of divergent KERLs. This may be the median of the astronomical time of the original reception of a receipt by a mutually trusted set of observers. This may be through the use of anchor transactions on a distributed consensus ledger. This later approach would only require minimal use of a distributed consensus ledger in order to resolve the most extreme and unlikely case of total dead exploit.

Finally, however unlikely, subsequent improvements in cryptographic attack mechanisms such as quantum computing may enable, at some future time, complete compromise of all exposed key pairs. One solution would be for the market to operate a trusted set of jurors that archive KERLs just in case of some such future total compromise. These trusted jurors may secure their archives with post-quantum cryptography. Thus, any post-quantum attack may be detectable merely by appeal to one or more of these archives.

::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/40
:::

### Native CESR Encodings of KERI Messages

By native CESR encoding we mean that the field maps of fields and values in a KERI message body may be represented in pure CESR instead of JSON, CBOR, or MGPK. Because the top level fields in every KERI message body are fixed and each value in CESR is self-describing and self-framing there is no need to provide labels at the top level, only the field values in a fixed order. In the following tables, for the sake of comparison and clarity, the first column provides the equivalent field label as would be used in JSON, CBOR, or MGPK. The second column provides the field value format, and the third column a short description. For field values that are primitives, an example primitive may be provided as the value. To restate, no labels appear in an actual serialized native CESR message body, just the concatenated field values either as primitives or groups of primitives with the appropriate prepended CESR group codes. The order of appearance of fields as values is strict. 

####  Key Event Messages
These have the packet types `icp`, `rot`, `ixn`, `dip`, `drt`

##### Inception `icp`

Field order by label:  `v`,  `t`, `d`, `i` , `s`, `kt`, `k`, `nt`, `n`, `bt`, `b`, `c`, `a`.

| Field Label | Value  | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native  top-level fixed field signable message |
| `v` | `Y&&&&###` e.g. `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `X&&&` e.g. `Xicp` | Packet Type (inception)  |
| `d` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `M&&&` e.g. `MAAA` | Sequence Number of Event  |
| `kt` | `M&&&` e.g. `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1)  |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List  |
|  0th element | `DN6WBhWqp6wC08no2iWhgFYTaUgrasnqz6llSvWQTWZN` | Public Key of signer 0  |
| `nt` | `M&&&` e.g. `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string  (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List  |
|  0th element | `EDDOarj1lzr8pqG5a-SSnM2cc_3JgstRRjmzrrA_Bibg` | Digest of Public Key of rotator 0 |
| `bt` | `M&&&` e.g. `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2)  |
| `b` | `-I##` or `-I#####` | Count code for Backer AID List  |
|  0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer  0 |
|  1th  element | `BH8KSsFvoaOSgEbx-XCuDiSPCTq-qBBFDHkhf1_kmysr` | AID of backer 1  |
|  2th element | `BBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCuDiSPCTq-q` | AID of backer  2 |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List  |
|  0th element | `XDND` | Config trait 0  `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List  |
|  0th element | `-H##` or `-H#####`  | Count code for field map of Seal 0 |
|  0.0th label  | `0J_&` e.g. `0J_i` |  Label of field 0 of Seal 0 `i`   |
|  0.0th value  | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
|  0.1th label  | `0J_s` |  Label of field 1 of Seal 0 `s`   |
|  0.1th value  | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
|  0.2th label  | `0J_d` |  Label of field 2 of Seal 0 `d`   |
| 0.2th value  | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
|  1th element | `-R## or `-R#####`  | Count code for value  of Seal 1 (event seal triple) |
|  1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of of Seal 1 (event seal triple) pre+snu+dig |

##### Rotation `rot`

Field order by label:  `v`,  `t`, `d`, `i` , `s`, `p`, `kt`, `k`, `nt`, `n`, `bt`, `br`, `ba`, `c`, `a`.

| Field Label | Value  | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native  top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `Xrot` | Packet Type (inception)  |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAB` | Sequence Number of Event  |
| `p` |  `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | Prior event SAID |
| `kt` | `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1)  |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List  |
|  0th element | `DC08no2iWhgFYTaUgrasnqz6llSvWQTWZNN6WBhWqp6w` | Public Key of signer 0  |
| `nt` | `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string  (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List  |
|  0th element | `EM2cc_3JgstRRjmzrrA_BibgDDOarj1lzr8pqG5a-SSn` | Digest of Public Key of rotator 0 |
| `bt` | `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2)  |
| `br` | `-I##` or `-I#####` | Count code for Backer Remove (cuts) AID List  |
|  0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer  cut 0 |
| `ba` | `-I##` or `-I#####` | Count code for Backer Add (adds) AID List  |
|  0th  element | `BDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCu` | AID of backer add 0  |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List  |
|  0th element | `XDND` | Config trait 0  `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List  |
|  0th element | `-H##` or `-H#####`  | Count code for field map of Seal 0 |
|  0.0th label  | `0J_i` |  Label of field 0 of Seal 0 `i`   |
|  0.0th value  | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
|  0.1th label  | `0J_s` |  Label of field 1 of Seal 0 `s`   |
|  0.1th value  | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
|  0.2th label  | `0J_d` |  Label of field 2 of Seal 0 `d`   |
| 0.2th value  | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
|  1th element | `-R## or `-R#####`  | Count code for value  of Seal 1 (event seal triple) |
|  1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of of Seal 1 (event seal triple) pre+snu+dig |

##### Interaction `ixn`

Field order by label:  `v`,  `t`, `d`, `i` , `s`, `p`,  `a`.

| Field Label | Value  | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native  top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `Xixn` | Packet Type (inception)  |
| `d` | `EGgbiglDXNE0GC4NQq-hiB5xhHKXBxkiojgBabiu_JCk` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAC` | Sequence Number of Event  |
| `p` |  `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | Prior event SAID |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List  |
|  0th element | `-H##` or `-H#####`  | Count code for field map of Seal 0 |
|  0.0th label  | `0J_i` |  Label of field 0 of Seal 0 `i`   |
|  0.0th value  | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
|  0.1th label  | `0J_s` |  Label of field 1 of Seal 0 `s`   |
|  0.1th value  | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
|  0.2th label  | `0J_d` |  Label of field 2 of Seal 0 `d`   |
| 0.2th value  | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
|  1th element | `-R## or `-R#####`  | Count code for value  of Seal 1 (event seal triple) |
|  1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of of Seal 1 (event seal triple) pre+snu+dig |


##### Delegated Inception `dip`

Field order by label:  `v`,  `t`, `d`, `i` , `s`, `kt`, `k`, `nt`, `n`, `bt`, `b`, `c`, `a`, `di`.

| Field Label | Value  | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native  top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `Xdip` | Packet Type (inception)  |
| `d` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAA` | Sequence Number of Event  |
| `kt` | `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1)  |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List  |
|  0th element | `DN6WBhWqp6wC08no2iWhgFYTaUgrasnqz6llSvWQTWZN` | Public Key of signer 0  |
| `nt` | `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string  (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List  |
|  0th element | `EDDOarj1lzr8pqG5a-SSnM2cc_3JgstRRjmzrrA_Bibg` | Digest of Public Key of rotator 0 |
| `bt` | `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2)  |
| `b` | `-I##` or `-I#####` | Count code for Backer AID List  |
|  0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer  0 |
|  1th  element | `BH8KSsFvoaOSgEbx-XCuDiSPCTq-qBBFDHkhf1_kmysr` | AID of backer 1  |
|  2th element | `BBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCuDiSPCTq-q` | AID of backer  2 |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List  |
|  0th element | `XDND` | Config trait 0  `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List  |
|  0th element | `-H##` or `-H#####`  | Count code for field map of Seal 0 |
|  0.0th label  | `0J_i` |  Label of field 0 of Seal 0 `i`   |
|  0.0th value  | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
|  0.1th label  | `0J_s` |  Label of field 1 of Seal 0 `s`   |
|  0.1th value  | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
|  0.2th label  | `0J_d` |  Label of field 2 of Seal 0 `d`   |
| 0.2th value  | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
|  1th element | `-R## or `-R#####`  | Count code for value  of Seal 1 (event seal triple) |
|  1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of of Seal 1 (event seal triple) pre+snu+dig |
| `di` | `EFXNB5C4NQq-hiGgxhHKXBxkiojgabiu_JCkE0GbiglD` | AID of delegating controller  |


##### Delegated Rotation `drt`

Field order by label:  `v`,  `t`, `d`, `i` , `s`, `p`, `kt`, `k`, `nt`, `n`, `bt`, `br`, `ba`, `c`, `a`, `di`.

| Field Label | Value  | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native  top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `Xdrt` | Packet Type (inception)  |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAB` | Sequence Number of Event  |
| `p` |  `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | Prior event SAID |
| `kt` | `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1)  |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List  |
|  0th element | `DC08no2iWhgFYTaUgrasnqz6llSvWQTWZNN6WBhWqp6w` | Public Key of signer 0  |
| `nt` | `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string  (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List  |
|  0th element | `EM2cc_3JgstRRjmzrrA_BibgDDOarj1lzr8pqG5a-SSn` | Digest of Public Key of rotator 0 |
| `bt` | `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2)  |
| `br` | `-I##` or `-I#####` | Count code for Backer Remove (cuts) AID List  |
|  0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer  cut 0 |
| `ba` | `-I##` or `-I#####` | Count code for Backer Add (adds) AID List  |
|  0th  element | `BDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCu` | AID of backer add 0  |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List  |
|  0th element | `XDND` | Config trait 0  `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List  |
|  0th element | `-H##` or `-H#####`  | Count code for field map of Seal 0 |
|  0.0th label  | `0J_i` |  Label of field 0 of Seal 0 `i`   |
|  0.0th value  | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
|  0.1th label  | `0J_s` |  Label of field 1 of Seal 0 `s`   |
|  0.1th value  | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
|  0.2th label  | `0J_d` |  Label of field 2 of Seal 0 `d`   |
| 0.2th value  | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
|  1th element | `-R## or `-R#####`  | Count code for value  of Seal 1 (event seal triple) |
|  1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of of Seal 1 (event seal triple) pre+snu+dig |
| `di` | `EFXNB5C4NQq-hiGgxhHKXBxkiojgabiu_JCkE0GbiglD` | AID of delegating controller  |

##### Receipt Message
This message has packet type `rct`

#### KERI support Messages
These have the packet types `qry`, `rpy`, `pro`, `bar`, `exn`

#### Query Message

#### Reply Message

#### Prod Message

#### Bare Message

#### Exchange Message

### Out-Of-Band-Introduction (OOBI) 

#### Introduction

An Out-Of-Band Introduction (OOBI) provides a discovery mechanism that associates a given URI or URL with a given AID (Autonomic IDentifier) or SAID (Self-Addressing IDentifier) {{KERI_ID}}{{KERI}}{{SAID_ID}}{{OOBI_ID}}. The URI provided by an OOBI acts as a service endpoint for discovering verifiable information about the AID or SAID. As such, an OOBI itself is not trusted but must be verified. To clarify, any information obtained from the service endpoint provided in the OOBI must be verified by some other mechanism. An OOBI, however, enables any internet and web search infrastructure to act as an out-of-band infrastructure to discover verifiable information over an in-band mechanism or protocol. The primary in-band verification protocol is KERI {{KERI_ID}}{{KERI}}. The OOBI protocol provides a web-based bootstrap and/or discovery mechanism for the KERI and the ACDC (Authentic Chained Data Container) protocols {{KERI_ID}}{{ACDC_ID}}{{OOBI_ID}}. Thus, the security (or, more correctly, the lack of security) of an OOBI is out-of-band with respect to a KERI AID or an ACDC that uses KERI. To clarify, everything in KERI or that depends on KERI is end-verifiable; therefore, it has no security dependency, nor does it rely on security guarantees that may or may not be provided by web or internet infrastructure.  OOBIs provide a bootstrap that enables what we call Percolated Information Discovery (PID) based on the academic concept called Invasion Percolation Theory {{IPT}}{{DOMIP}{{PT}}{{FPP}}. This bootstrap may then be parlayed into a secure mechanism for accepting and updating data. The principal data acceptance and update policy is denoted BADA (Best-Available-Data-Acceptance).

Vacuous discovery of IP resources such as service endpoints associated with a KERI AID (Autonomic IDentifier) or SAID (Self-Addressing IDentifier) requires an Out-Of-Band Introduction (OOBI) to associate a given URL with a given AID (Autonomic IDentifier) or SAID (Self-Addressing IDentifier) {{KERI_ID}}{{KERI}}{{SAID_ID}}{{OOBI_ID}}{{URL}}. The principal reason for this requirement is that KERI AIDs are derived in a completely decentralized manner. The root-of-trust of a KERI AID is completely independent of the Internet and DNS addressing infrastructure. Thus, an IP address or URL could be considered a type of Out-Of-Band Infrastructure (OOBI) for KERI.  In this context, an introduction is an association between a KERI AID and a URL that may include either an explicit IP address or a DNS name for its host {{RFC3986}}{{URL}}. We call this a KERI OOBI (Out-Of-Band-Introduction) and is a special case of Out-Of-Band-Infrastructure (OOBI) with a shared acronym. For the sake of clarity, unless otherwise qualified, OOBI is used to mean this special case of an 'introduction' and not the general case of 'infrastructure'.

Moreover, because IP infrastructure is not trusted by KERI, a KERI OOBI by itself is considered insecure with respect to KERI, and any OOBI must, therefore, be later verified using a KERI BADA (Best-Available-Data-Acceptance) mechanism. The principal use case for an OOBI is to jump-start or bootstrap the discovery of a service endpoint for a given AID. To reiterate, the OOBI by itself is not sufficient for discovery because the OOBI itself is insecure. The OOBI merely jump-starts or bootstraps the authenticated discovery.  

OOBIs enable a KERI implementation to leverage existing IP and DNS infrastructure to introduce KERI AIDs and discover service endpoints, which may then be securely attributed. KERI does not, therefore, need its own dedicated discovery network; OOBIs with URLs will do.

A secondary use case for OOBIs is to provide service endpoints or URIs for SAD (Self-Addressed Data) items identifier by their SAID (Self-Addressing IDentifier). A SAID is a content address derived from a cryptographic digest of the serialization of a data item. The SAID protocol {{ see CESR SAID Annex }} provides a derivation process where the SAID is actually included in the SAD. This makes a SAID self-referential. Verification of a SAD resource obtained by querying a URI that includes the SAD's SAID is accomplished by simply re-deriving the SAID of the SAD in the reply and comparing it to the SAID in the URI. The `sad` URI scheme may be simply expressed as `sad:said` where `said` is replaced with the actual SAID of the referenced SAD item. The media type of the returned SAD is determined by its CESR-compatible serialization type, such as JSON, CBOR, MGPK, or native CESR, for example.

#### Basic OOBI

The simplest form of a KERI  OOBI may be expressed by any of a namespaced string, a tuple, a mapping, a structured message, or a structured attachment where every form tcontains both a KERI AID and a URL (or URI). The OOBI associates the URL with the AID. By convention, the URL typically includes the word `oobi` in its path to indicate that it is to be used as an OOBI, but this is not required. In abstract tuple form, an OOBI is as follows:

~~~python
(url, aid)
~~~

In concrete tuple form, an OOBI is as follows:

~~~python
("http://8.8.5.6:8080/oobi", "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM")
~~~

An OOBI itself is not signed or otherwise authenticatable by KERI but may employ some other Out-Of-Band-Authentication (OOBA) mechanism, i.e., non-KERI.

The OOBI is intentionally simplistic to enable very low byte count introductions such as a may be conveyed by a QR code or Data matrix {{QR}}{{DM}}. 


#### OOBI URL (IURL)

URLs provide a namespace, which means that the mapping between URL and AID can be combined into one namespaced URL where the AID is in the path component and any other hints, such as roles or names, are in the query component of the URL. This would be a type of self-describing OOBI URL.  

For example, suppose the  AID  is 

~~~python
EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM
~~~

This may be included as a path component of the URL, such as,

~~~python
http://8.8.5.6:8080/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM
~~~

This is called an OOBI URL, or IURL for short. All that is needed to bootstrap the discovery of a KERI AID is an IURL. KERI can leverage the full IP/DNS infrastructure as a discovery bootstrap of an AID by providing an associated IURL. 

The AID may act in any of the KERI roles such as `watcher`, `witness`, `juror`, `judge` or `registrar` but is usually a  `controller`. In the later case, the IURL may be a service endpoint provided by one of the supporting components for a given controller. Thus the AID in an OOBI may be either a controller ID, CID or an endpoint provider ID, EID. The resource at that URL in the OOBI is ultimately responsible for providing that detail, but an OOBI as a URL may contain hints in the query string for the URL, such as a `role` or `name` designation.

~~~python
http://8.8.5.6:8080/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM?role=watcher&name=eve

https://example.com/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM?role=witness
~~~

When the role is provided in the IURL, the EID of the endpoint provider for that role would be discovered via the proof returned by querying the URL. In addition, Tthe proof returned may indicate a different URL for that role. Thereby, a self-describing IURL may act also as a forwarding mechanism. 

To clarify, the minimum information in an OOBI is the pair, `(URL, AID)`. The compact representation of an OOBI leverages the namespacing of the URL itself to provide the AID. Furthermore, the query string in the URL namespace may contain other information or hints, such as the role of the service endpoint represented by the URL or a user-friendly name.  


#### Well-Known OOBI

An OOBI may be returned as the result of a get request to an {{IETF RFC-5785 }}  well-known URL. For example,

~~~python
 /.well-known/keri/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM
~~~

Where `EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM` is the AID
and the result of the request is either target URL or a redirection to the target URL where the target URL is something like

~~~python
https://example.com/witness/witmer

http://8.8.5.5:8080/witness/witmer

http://10.0.5.15:8088/witness/witmer
~~~

The resultant target URL may be in a different domain or IP address from the `well-known` resource.


#### CID and EID

A more verbose version would also include the endpoint role and the AID (EID) of the endpoint provider in a self-describing OOBI URL. For example,

~~~python
https://example.com/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM/witness/BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE

http://8.8.5.6/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM/witness/BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE
~~~


Where 
`EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM` is the AID (CID) of the controller and 

`BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE` is the AID (EID) of the controller's endpoint provider acting in the role of `witness`.


#### Multi-OOBI (MOOBI)

An OOBI may include a list of URLs thus simultaneously making an introductory association between the AID and multiple URLs. This would be a multi-OOBI (MOOBI). In general, we may refer to a MOOBI as a special case of an OOBI without making a named distinction. The first KERI reply message below is an example of a MOOBI

#### KERI Reply Messages as OOBIs

A more verbose expression for an OOBI would be an unsigned KERI reply message, `rpy`. The route, `r` field in the message starts with `/oobi`. This specifies that it is an OOBI, so the recipient knows to apply OOBI processing logic to the message. A list of URLs may be provided so that one reply message may provide multiple introductions.   For example,

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rpy",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "/oobi/witness",
  "a" :
  {
    "urls":  
    [
      "http://example.com/watcher/watson", 
      "http://example.com/witness/wilma"
    ],
    "aid":  "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"
  }
}
~~~

A service endpoint location reply message could also be re-purposed as an OOBI by using a special route path that starts with `/oobi` but also includes the AID being introduced and, optionally, the role of the service endpoint provider. This approach effectively combines the information from both the  `/end/role` and `/loc/scheme` reply messages into one. This may allow a shortcut to authenticate the service endpoint. This is shown below.

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rpy",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM/watcher",
  "a" :
  {
    "eid": "BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE",
    "scheme": "http", 
    "url":  "http://example.com/watcher/wilma"
  }
}
~~~



#### Self (Blind) OOBI (SOOBI)

A bare URL but no AID may be used as a self (blind) OOBI for blind or self-introductions e.g. SOOBI. Querying that SOOBI may return or result in a default target OOBI or default target endpoint reply. This provides a mechanism for self-introduction or blind i.e. self OOBI (SOOBI). Consider the examples of self-OOBIs below.

~~~python
http://8.8.5.7:8080/oobi

http://localhost:8080/oobi

http://8.8.5.7:8080/oobi?role=controller&name=eve

http://localhost:8080/oobi?role=controller&name=eve
~~~ 


To elaborate, by default, the result of a `GET` request to a self OOBI URL could be another OOBI with an AID that is the `self` AID of the node providing the self OOBI endpoint or the actual authenticatable `self` endpoint with its AID or a default set of authenticatable endpoints. This is useful to bootstrap components in an infrastructure where the target URLs do not use a public DNS address but instead use something more secure like an explicit public IP address or a private IP or private DNS address. A self-introduction provides a bootstrap mechanism similar to a hostname configuration file with the exception that in the OOBI case, the AID is not in the configuration file, just the bare URL, and the given node queries that bare URL (SOOBI) to get the target endpoint AID.  This allows bootstrap using bare IP addresses in systems where the IP infrastructure is more securely managed than public DNS or where some other Out-Of-Band-Authentication (OOBA) mechanism is used in concert. 

To clarify, because a bare URL acting as a SOOBI, does not expose an AID, the resultant response when querying the OOBI may depend on other factors such as the source IP of the querier (requester) and/or another out-of-band-authentication (OOBA) mechanism. This supports the private bootstrap of infrastructure. 
Of course, one could argue that this is just kicking the can down the road, but IP addresses are correlatable, and a self OOBI can leverage IP infrastructure for discovery when used in combination with some other OOBA mechanism without unnecessary correlation.

For example, a given indirect mode controller is identified by its AID (CID). The controller must also create witness hosts with endpoints. This means first spinning up witness host nodes and creating witness AIDs (WIDs) for those nodes. Given that these WIDs must be eventually designated in the KEL for the CID, the controller of the CID can confirm using its KEL that the signed endpoint reply provided by a SOOBI request is indeed signed by the corresponding private keys for a WID designated in its KEL. This means that the only place that the WID must appear is in the KEL and not in all the config files used to bootstrap communications between the CID host and its designated WID hosts. Just SOOBIs will do. Whereas regular OOBIs with redundant configuration information may be a vector for a type of DDOS attack where corrupted, inconsistent, redundant configuration information results in a failure to boot a system. Redundancy for security is best applied in the context of a self-healing or resilient threshold structure that explicitly manages the redundancy as a security mechanism instead of as un-managed inadvertent redundancy.

#### OOBI Forwarding  

In every case, an OOBI may result in proof for a different URL than that provided in the OOBI itself. It allows OOBI forwarding so that introductions produced as hard copies, such as QR codes, do not necessarily become stale. The recipient of the OOBI may choose to accept that proof or not. Ultimately, the recipient only treats URLs as valid endpoints when they are fully KERI authenticated. Given that an OOBI result is always KERI authenticated before use in a given role, the worst case from a security perspective is that an OOBI may be part of a DDOS attack but not as part of a service endpoint cache poison attack.


#### OOBI with MFA

An OOBI may be augmented with one or more Out-Of-Band Authentications (OOBAs) to minimize the likelihood of a DDOS OOBI attack. A given recipient may require as a precondition to accepting an OOBI one or more  OOBA mechanisms, such as text messages, emails, etc., that provide some degree of non-KERI-based security to the OOBI. Thus, an OOBI could employ out-of-band (with respect to KERI) multi-factor authentication (MFA) to preclude any OOBI-based DDOS attacks on KERI.


#### SPED (Speedy Percolated Endpoint Discovery)

All the information needed to discover and verify is bootstrapped from the OOBI. Subsequent authorization is non-interactive, thus making it highly scalable. BADA-RUN authorization is also lightweight for the host because the only memory requirements are a sequence number, date-time stamp window, and nullification state. This provides what we call zero-trust percolated discovery or speedy percolated endpoint discovery (SPED) {{PT}}{{FPP}}{{IPT}}{{DOMIP}}. Percolation means that each discoverer, in turn, may share what it discovers with any subsequent discoverers. Because the information so discovered is end-verifiable, the percolation mechanism does not need to be trusted. Percolating intermediaries do not need to be trusted.

#### JIT/NTK Discovery

With percolated discovery, discovery mechanisms can be made very efficient because they can be optimized for any given exchange of verifiable data that requires discovery. This is called just-in-time/need-to-know JIT/NTK discovery. Each Exchanger of verifiable data must have already verified the data before exchanging it with the Exchangee. Therefore, all the information needed to verify (proofs) must have already been available to the Exchanger, i.e., need-to-know. The Exchanger can then percolate that verification information to the Exchangee at the time of exchange, i.e, just-in-time. This avoids the need to have a dedicated global infrastructure for the discovery of verifiable data and the associated proofs.

#### Summary

The main value of an OOBI is that it is compact and is not encumbered by authentication proofs but may be used to kick-start the process of authentication (proving).

One way to pre-configure a vacuous KERI installation is to provide OOBIs or SOOBIs in a configuration file. The bootstrap process of the installation then queries the associated URLs to retrieve the KERI authentication proofs (BADA) that are then used to populate its database securely. This simplifies the configuration file.

An alternative would be to populate the configuration file with the KERI authentication proofs. But these proofs may be quite verbose and cumbersome and may make the config file somewhat difficult to manage in human-readable/writable form. Furthermore, if one already had the proofs, one could just pre-populate the database with those proofs. Therefore OOBI, OOBI-based configuration files may be advantageous as either easier to manage or as a viable option when the proofs are not yet available at configuration time.

Furthermore, a clean clone replay restart of a given KERI component is designed to fix any unverified corruption of its associated KELs.If each component uses OOBIs to retrieve the authentication proofs from other components, then all the components will have clean proofs instead of stale proofs. 


### BADA (Best-Available-Data-Acceptance) Policy

The recipient of an OOBI verifies the OOBI by authenticating the endpoint URL given by the OOBI with respect to an authorization signed by the controller of the AID given by the OOBI. This authorization follows the BADA (Best Available Data Acceptance) policy. The BADA policy guarantees the monotonicity of updates to authentically signed data at rest. This follows best practices for zero-trust computing infrastructure for authentic data. The authorization is usually obtained as a resource in reply to a query to the OOBI URL. Specifically, the service endpoint at the URL responds with a resource that contains the supporting reply messages that are KERI authenticatable. 

#### Security Issues

KERI follows a "zero-trust" security model for authentic or securely attributable data. That means that data is signed both in motion and at rest. The primary attack against signed data is a replay attack. In a replay attack, an adversary obtains a copy of data with a verifiable signature and then replays it later. Without some other information, it is difficult for a host to detect that it is indeed a replay or malicious reuse of signed data and not the original use of that data.

To elaborate, there are two primary types of attacks on authentic or authenticatable data-at-rest. The first is a replay attack. The second is a deletion attack. In a replay attack, an adversary keeps a copy of an authentic message or data together with its verifiable signature that has already been created and used by the controller of a KERI AID and then sometime later replays that same message with the signature. A verifier may thereby be fooled into believing that the replay is actually a new message and not a stale message. There are both interactive and non-interactive mitigations to replay attacks. Interactive mitigations use some type of nonce or salt exchanged between Updater and Updatee. The nonce exchange introduces latency, scalability, and synchronization limitations. Non-interactive mitigations require a monotonic ordering mechanism. Typically, monotonic ordering is based on logic rooted in a sequence number or date-time stamp. Because non-interactive mitigations are asynchronous, however, they do not have the latency and scalability limitations of interactive mitigations and are therefore preferred.

The KEL (Key Event Log) of a KERI AID provides such a monotonic ordering mechanism as it employs both a sequence number and digest chaining. For authentic data directly anchored to or determined by a KEL, the relative KEL location determines the monotonic order. This ordering determination includes TEL (Transaction Event Logs), which themselves are monotonically ordered with respect to anchoring seals in the associated KEL {{PTEL_ID}}.  For authentic data not directly anchored or included in a KEL, the relative key state (which is determined by the KEL) may be used in combination with a date-time stamp to ensure monotonic ordering. Finally, for any AID whose key state is fixed, a date-time stamp may be used with appropriate update logic to ensure monotonic ordering. The logic that ensures monotonic ordering is called BADA (Best Available Data Acceptance) and is described later in this section.

A deletion attack is related to a replay attack. Once erased or deleted, a verifier may not be able to detect a replay attack of the deleted data because it has lost a record of the prior play to compare against. To elaborate, once erased, any stale authenticated data acting as authorization may be replayed without detection. This exposes a problem with the GPDR right-to-erasure, which, if naively implemented as total erasure, exposes the data controller to a replay attack of erased data. 

The primary mitigation mechanism for deletion attacks is maintaining redundant copies of the signed authentic data. As long as one of the redundant copies has not been deleted, then a comparison between the hosts of the redundant copies will expose the deletion attack. The monotonicity of the data is preserved in each copy. The hosts need merely compare copies. Only the current data item needs to be kept in full in order to support the use of that data.  For protection against replay attacks using stale data, only copies of the digest or signature of the data must be kept. To reiterate, a replay attack can be detected by comparing the digest or signature (which is a type of digest) of any undeleted copy with the presented data. 

To summarize, authentic data at rest consists of the data item and signature(s). The two primary attacks are replay and deletion. Replay attack mitigation relies on replay monotonicity in data updates. Deletion attack mitigation relies on the redundancy of monotonic data.

#### BADA Rules

The BADA (Best-Available-Data-Acceptance) rules apply to any data item stored in a database record whose value is used for some defined purpose. Updates are sourced from the controller of an associated KERI AID. The primary purpose of BADA policy is to enforce monotonicity of the updates with respect to the key state of that associated AID. This primarily protects against replay attacks on the database record. For example, a rollback to an earlier value via replay of an earlier update. An *Update* or change to the database record is *accepted* when it follows the BADA rules (policy) for acceptance. The BADA rules ensure the monotonicity of all updates. 

There are two different mechanisms for the controller of an AID to authorize updates to a given database record. The first is by referencing the update in the KEL of the authorizing AID. All entries in a KEL must be signed by the current signing keypair(s) given by the Key-state for that KEL. The second is by signing a date-time stamped update. In this case, the update either includes a reference to the Key-state in the authorizing AID's KEL from which the signing keypair(s) needed to verify the signature is obtained or the AID is ephemeral with a fixed Key-state (has a non-transferable derivation code). The rules differ for each of the two mechanisms. 

#### KEL Anchored Updates

In this case, the update to a record is included in or anchored via a seal to the AID’s Key-state in its KEL. In either case, the update is referenced in an event in the KEL of the AID. By virtue of the reference, the Controller of that KEL's AID is authorizing that Update. The record may have a *Prior* value that is being updated or the *Update* serves to create the initial value of the record. *Prior* means the prior record.

~~~
Rules for the acceptance of the *Update*:  (in order of priority)
  Confirm *Update* is anchored or included in AID's KEL.
  
  WHEN Update is anchored in AID's KEL AND...
    IF no *Prior* THEN accept. (always)
    IF *Prior* AND...
      *Update’s* anchor appears later in KEL than the Prior’s anchor THEN accept.  
  Otherwise, do not accept.
~~~

#### Signed (Not Anchored) Updates

In this case, the update to a record is signed by the controller of the AID, but the update itself is NOT included in or anchored to the AID’s KEL. The record may have a prior value that is being updated or the update serves to create the initial value of the record. In this context, prior means the prior record. All date times are relative to the controller's date time, NOT the database host's date time.

There are two cases. These are as follows.

1. Ephemeral AID whose Key-state is fixed (no KEL needed)
2. Persistent AID whose Key-state is provided by a KEL  

~~~
Rules for the acceptance of the *Update*:  (in order of priority)
  Confirm signature on the *Update* verifies against indicated key-state under which signature was made.
  
  WHEN signature verifies AND...
    IF no *Prior* THEN accept (always).
    IF *Prior* THEN ...
      Compare the *Update’s* verified signature key-state against the *Prior's* verified signature key-state.
      IF the *Update’s* key-state appears later in KEL than the *Prior's* key-state THEN accept.
      IF both the *Update’s* and the *Prior's* key-states appear at the same location in KEL AND...
              *Update’s* date-time is later than the *Prior's* date-time THEN accept.           
  Otherwise, do not accept.
~~~
       
#### RUN off the CRUD  

In the conventional client-server database architecture, the database server is responsible for creating records on behalf of clients and assigning unique identifiers for each record. The server returns to the client the unique record identifier when it creates a record. The server is the source of truth.  But in a zero-trust (end-verifiable) decentralized peer-to-peer architecture, there is no client/server. Every host is a Peer. Each Peer is the source of truth for its own data. Therefore, each Peer is responsible for managing its own records. Each Peer MUST be able to create unique identifiers for its own data. This inverts the architecture because each Peer creates a unique identifier for each of its own data items and sends that identifier with the data item to the other Peers. Each Peer stores data on behalf of the other Peers. This inverted architecture enables consistent, authentic data update policies that work asynchronously across multiple Peers and are replay and deletion attack-resistant. Each Peer has an end-verifiable (via signature) monotonically updated view of the data records sourced from the other Peers.

The acronym for the traditional client-server database update policy is CRUD (Create, Read, Update, Delete). The acronym for this new peer-to-peer end-verifiable monotonic update policy is RUN (Read, Update, Nullify). As described above, because the source of truth for each data item is a decentralized controller Peer, a given database hosted by any Peer does not Create records in the traditional sense of a server creating records for a client. The hosting Peer merely stores a copy of an Update to records sent out by the source Peer (controller). Thus there is no Create action, only an Update action. When a Peer has not yet seen any version of a record, then its copy is vacuous and is replaced by the first Update it sees.  To clarify, a source Peer Updates other Peers by sending out the latest copy or version of its own record. The original copy or version is always created by the source Peer not the data hosting destination Peer or destination Peer for short. 

In order to ensure that the destination Peers are resistant to replay and deletion attacks, they apply non-interactive monotonic update logic to any Updates they receive from the source Peer. This means that a destination Peer MUST NOT ever delete a record storing the latest version of an Update. Thus, there is no Delete. Instead of Delete, Peers Nullify. A Nullify is a special type of Update that indicates that the data in the record is no longer valid but, importantly, without actually erasing or Deleting the record that includes a reference to the latest monotonic determining anchor and/or date-time. There are two ways to indicate Nullification. The first is to assign a `null` value to the record. This works for single-field records. The second is to attach an associated Boolean logic flag field that indicates the record has been Nullified. This works for multi-field records.


#### OOBI KERI Endpoint Authorization (OKEA)

An important use case for BADA-RUN is to process OOBIs that provide service endpoint discovery of the AIDS of KERI components. These components include but are not limited to, Controllers, Agents, Backers (Witness or Registrar), Watchers, Jurors, Judges, and Forwarders. An endpoint is a URL that may include an IP Scheme, Host, Port, and Path. The model for securely managing endpoint data starts with a Principal Controller of an AID. A Principal Controller authorizes some other component to act as a Player in a Role. Typically, a Role serves some function needed by the Principal Controller to support its AID and may be reached at a service endpoint URL for that Role. Each component, in turn, is the Controller of its own AID. Each component AID is a Player that may provide or act in a Role on behalf of the Principal Controller by providing services at the associated service endpoint for its associated Role. 

The authorization model uses a zero-trust BADA-RUN policy to Update authorizations. A Principal Controller authorizes a Player by signing a Role authorization message that authorizes the Player's AID to act in a role. A Player authorizes its endpoint URL by signing an endpoint authorization message that authorizes a URL (location) with a scheme. Any Peer may keep an updated copy of the latest service endpoint URL(s) provided by a Player in a Role for a given Principal AID by following the BADA-RUN policy on Updates sent to its database of these authorizations. The authorizations are issued in the context of the KERI Key-state for the Principal and Player AIDs.

Some components (Players in Roles) are implicitly authorized by the Principal Controller by being explicitly designated in the KEL of the Principal, i.e. there is no explicit authorization message of the Player/Role. The authorization is implied by the KEL entry. For example, a Backer designation of a Witness or Registrar AID implicitly authorizes that AID to act as a Player in the Role of Witness or Registrar. An associated explicit endpoint authorization message signed by that Witness or Backer is still needed to provide the URL (location and scheme) of the actual service endpoint for that Player.

The combination of KERI and the BADA-RUN policy enables any Controller to manage data in a zero-trust architecture at the database level. Any Controller may promulgate verifiably authentic information with replay and deletion attack resistance. The authentic information may be simply source data or instead authorizations to enable some other function. The hard work of determining the associated Key-state is provided by KERI. KERI makes the establishment of authenticity straightforward. The BADA-Run policy protects against replay and deletion attacks given authentic data. 

This approach follows the many thin layers approach of the Hourglass protocol model.  BADA-RUN is a thin layer on top of KERI authenticity. OOBIs are a thin discovery layer that sits on top of a thin authorization layer (leveraging reply messages and BADA-RUN logic) on top of KERI. 

This also follows the design ethos of KERI of minimally sufficient means. OOBIs leverage the existing Internet discovery mechanisms but without needing to trust the Internet security model (or the lack of one). End-verifiability in KERI provides safety to any OOBI discovery. The Internet's discovery mechanism, DNS/CA, is out-of-band with respect to KERI security guarantees. Thus, OOBIs may safely use DNS/CA, web search engines, social media, email, and messaging as discovery mechanisms. The worst case is the OOBI fails to result in a successful discovery and some other OOBI must be used.

Typically, the query of a ReST endpoint given by the OOBI URL could return as proof any associated authorizing reply message(s) as well as any associated KELs. 

#### Authorized Endpoint Disclosure Example

This section provides an example of using OKEA (OOBI KERI Endpoint Authorization) with BADA-RUN for endpoint disclosure.

The KERI protocol defines a generic `reply` message for updating information using the BADA-RUN policy. Each `reply` message includes a route, `r`, field that indicates both the payload type and the handler that should process the message. The route, `r`, field value is a slash, `/` delimited pathname string.  The Principal Controller AID is indicated by the CID (Controller ID) or `cid` field. The endpoint component Player is indicated the EID (Endpoint Controller ID) or `eid` field. There are two different authorization cases. In one case, a CID authorizes an EID in a Role. In the other case, an EID authorizes a Loc (URL location) for a scheme. There are two routes for each type of authorization. One route Updates the authorization and the other Nullifies the authorization. These are summarized as follows,

* Datetime stamped BADA authorization Reply message by CID of EID in Role (Update)
* Datetime stamped BADA deauthorization by CID of EID in Role (Nullify)
* Datetime stamped BADA authorization by EID of  URL for scheme (Update).
* Datetime stamped BADA deauthorization by EID of URL for scheme  (Nullify)  

A party interested in discovering the service endpoint for a given Controller AID initiates the discovery by providing an OOBI. A successful discovery will result in the return of signed `reply` messages that provide verifiable proof that the service endpoint (either directly provided in the OOBI, or indirectly provided via forwarding) is an authorized endpoint for that AID.

To summarize, upon acceptance of an OOBI the recipient queries the provided URL for proof that the URL is an authorized endpoint for the given AID. The proof format may depend on the actual role of the endpoint. A current witness for an AID is designated in the current key state's latest establishment event in the AID's KEL. Therefore, merely replying with the Key State or KEL may serve as proof for a witness introduced by an OOBI. The actual URL may be authorized by an attendant signed `/loc/scheme` reply message with the URL.

Other roles that are not explicitly part of Key-state (i.e. are not designated in KEL establishment events) must be authorized by explicit signed reply messages. Typically, these will be a signed `/end/role/` reply message. The actual URL may be authorized by an attendant signed `/loc/scheme` reply message with the URL.

Example reply messages.

#### Player EID in Role by CID Update

~~~json
{
  "v": "KERI10JSON000113_",
  "t": "rpy",
  "d": "Ekd189yFsX1eLhQ2NffI6AaF8ZxKXyej_jfn4wMNJq-w",
  "dt": "2021-01-01T00:00:00.000000+00:00",
  "r": "/end/role/add",
  "a":
  {
    "cid": "EhlsdBaCvxnW0z3m2OXxStaZkG76g0zC_vtPbPPglDK0",
    "role": "witness",
    "eid": "BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"
  }
}
~~~

#### Player EID in Role by CID Nullify

~~~json
{
  "v": "KERI10JSON000113_",
  "t": "rpy",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2021-01-01T00:00:00.000000+00:00",
  "r": "/end/role/cut",
  "a":
  {
    "cid": "EhlsdBaCvxnW0z3m2OXxStaZkG76g0zC_vtPbPPglDK0",
    "role": "witness",
    "eid": "BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"
  }
}
~~~


#### Endpoint Location with Scheme by EID Update

~~~json
{
  "v": "KERI10JSON000108_",
  "t": "rpy",
  "d": "EbAwspDQjS-Ve-tzDtAuzx4K8uhh-0AyXWZrSKm64PFQ",
  "dt": "2021-01-01T00:00:00.000000+00:00",
  "r": "/loc/scheme",
  "a":
  {
    "eid": "BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY",
    "scheme": "http",
    "url": "http://localhost:8080/controller/tam"
  }
}

~~~

#### Endpoint Location with Scheme by EID Nullify
To Nullify set the `url` to the empty string `""`.

~~~json
{
  "v": "KERI10JSON000108_",
  "t": "rpy",
  "d": "EbAwspDQjS-Ve-tzDtAuzx4K8uhh-0AyXWZrSKm64PFQ",
  "dt": "2021-01-01T00:00:00.000000+00:00",
  "r": "/loc/scheme",
  "a":
  {
    "eid": "BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY",
    "scheme": "http",
    "url": ""
  }
}

~~~



::: issue 
https://github.com/trustoverip/tswg-keri-specification/issues/34
:::


[//]: # (\newpage)

[//]: # (\makebibliography)

[//]: # (# Bibliography)

## Bibliography

[[def: KERI]]

~ https://github.com/trustoverip/tswg-keri-specification

[[def: CESR]]

~ https://github.com/trustoverip/tswg-cesr-specification

[[def: SAID]]

~ https://github.com/trustoverip/tswg-said-specification

[[def: OOBI]]

~ https://github.com/trustoverip/tswg-oobi-specification

[[def: DIDK]]

~ https://github.com/WebOfTrust/ietf-did-keri

[[def: RFC8949]]

~ https://www.rfc-editor.org/rfc/rfc8949.html

[[def: CBORC]]

~ https://en.wikipedia.org/wiki/CBOR

[[def: MGPK]]

~ https://github.com/msgpack/msgpack/blob/master/spec.md

[[def: KERI-WP]]

~ https://arxiv.org/abs/1907.02143

[[def: UIT]]

~ https://github.com/SmithSamuelM/Papers/blob/master/whitepapers/IdentifierTheory_web.pdf

[[def: DAD]]

~ https://github.com/SmithSamuelM/Papers/blob/master/whitepapers/DecentralizedAutonomicData.pdf

[[def: IDSys]]

 ~ https://github.com/SmithSamuelM/Papers/blob/master/whitepapers/Identity-System-Essentials.pdf

[[def: JSch]]

~ https://json-schema.org

[[def: JSch_202012]]

~ https://json-schema.org/draft/2020-12/release-notes.html

[[def: HCR]]

~ https://en.wikipedia.org/wiki/Collision_resistance

[[def: ITPS]]

~ https://en.wikipedia.org/wiki/Information-theoretic_security

[[def: OTP]]

~ https://en.wikipedia.org/wiki/One-time_pad

[[def: VCphr]]

~ https://www.ciphermachinesandcryptology.com/en/onetimepad.htm

[[def: SSplt]]

~ https://www.ciphermachinesandcryptology.com/en/secretsplitting.htm

[[def: SShr]]

~ https://en.wikipedia.org/wiki/Secret_sharing

[[def: CSPRNG]]

~ https://en.wikipedia.org/wiki/Cryptographically-secure_pseudorandom_number_generator

[[def: IThry]]

 ~ https://en.wikipedia.org/wiki/Information_theory

[[def: BLAKE3]]

~ https://github.com/BLAKE3-team/BLAKE3

[[def: BLAKE3Spec]]

~ https://github.com/BLAKE3-team/BLAKE3-specs/blob/master/blake3.pdf

[[def: BLAKE3Hash]]

~ https://www.infoq.com/news/2020/01/blake3-fast-crypto-hash/

[[def: QCHC]]

~ https://cr.yp.to/hash/collisioncost-20090823.pdf

[[def: TMCrypto]]

~ https://eprint.iacr.org/2019/1492.pdf

[[def: EdSC]]

~ https://eprint.iacr.org/2020/823

[[def: PSEd]]

~ https://ieeexplore.ieee.org/document/9519456?denied=

[[def: TMEd]]  

~ https://eprint.iacr.org/2020/1244.pdf

[[def: Salt]]

~ https://medium.com/@fridakahsas/salt-nonces-and-ivs-whats-the-difference-d7a44724a447

[[def: Stretch]]

~ https://en.wikipedia.org/wiki/Key_stretching

[[def: HDKC]]

~ https://github.com/WebOfTrustInfo/rwot1-sf/blob/master/topics-and-advance-readings/hierarchical-deterministic-keys--bip32-and-beyond.md
  
[[def: OWF]]  

~ https://en.wikipedia.org/wiki/One-way_function

[[def: COWF]]

~ http://www.crypto-it.net/eng/theory/one-way-function.html

[[def: RB]]

~ https://en.wikipedia.org/wiki/Rainbow_table

[[def: DRB]]

~ https://www.commonlounge.com/discussion/2ee3f431a19e4deabe4aa30b43710aa7

[[def: BDay]]

~ https://en.wikipedia.org/wiki/Birthday_attack

[[def: BDC]]

~ https://auth0.com/blog/birthday-attacks-collisions-and-password-strength/

[[def: DHKE]]

~ https://www.infoworld.com/article/3647751/understand-diffie-hellman-key-exchange.html

[[def: KeyEx]]

~ https://libsodium.gitbook.io/doc/key_exchange

[[def: Hash]]

~ https://en.wikipedia.org/wiki/Cryptographic_hash_function

[[def: PKI]]

~ https://en.wikipedia.org/wiki/Public-key_cryptography

[[def: SCPK]]

~ https://link.springer.com/content/pdf/10.1007%2F3-540-46416-6_42.pdf

[[def: SCURL]]

~ https://pdos.csail.mit.edu/~kaminsky/sfs-http.ps

[[def: SFS]]

~ https://pdos.csail.mit.edu/~kaminsky/sfs-http.ps

[[def: SCPN]]

~ https://dl.acm.org/doi/pdf/10.1145/319195.319213

[[def: DNS]]

~ https://en.wikipedia.org/wiki/Domain_Name_System

[[def: CAA]]

~ https://en.wikipedia.org/wiki/DNS_Certification_Authority_Authorization

[[def: CA]]

~ https://en.wikipedia.org/wiki/Certificate_authority

[[def: CRL]]

~ https://en.wikipedia.org/wiki/Certificate_revocation_list

[[def: OCSPW]]

~ https://en.wikipedia.org/wiki/Online_Certificate_Status_Protocol

[[def: WOT]]

 ~ https://en.wikipedia.org/wiki/Web_of_trust

[[def: CEDS]]

~ https://resources.infosecinstitute.com/cybercrime-exploits-digital-certificates/#gref

[[def: KDDH]]

~ https://krebsonsecurity.com/2019/02/a-deep-dive-on-the-recent-widespread-dns-hijacking-attacks/

[[def: DNSH]]

~ https://arstechnica.com/information-technology/2019/01/a-dns-hijacking-wave-is-targeting-companies-at-an-almost-unprecedented-scale/

[[def: SFTCA]]

~ https://pdfs.semanticscholar.org/7876/380d71dd718a22546664b7fcc5b413c1fa49.pdf

[[def: DNSP]]

~ https://www.thesslstore.com/blog/dns-poisoning-attacks-a-guide-for-website-admins/

[[def: BGPC]]

~ https://petsymposium.org/2017/papers/hotpets/bgp-bogus-tls.pdf

[[def: BBGP]]

~ https://www.usenix.org/conference/usenixsecurity18/presentation/birge-lee

[[def: CTE]]

~ https://certificate.transparency.dev

[[def: CTAOL]]

~ https://queue.acm.org/detail.cfm?id=2668154

[[def: RT]]

~ https://www.links.org/files/RevocationTransparency.pdf

[[def: VDS]]

~ https://github.com/google/trillian/blob/master/docs/papers/VerifiableDataStructures.pdf

[[def: ESMT]]

~ https://eprint.iacr.org/2016/683.pdf

[[def: Ricardian contract, RC]]

~ https://en.wikipedia.org/wiki/Ricardian_contract

[[def: Namespace]]

~ https://en.wikipedia.org/wiki/Namespace

[[spec]]
