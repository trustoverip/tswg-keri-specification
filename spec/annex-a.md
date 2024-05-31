## Annex A

### Cryptographic strength and security

#### Cryptographic strength

For crypto-systems with perfect-security, the critical design parameter is the number of bits of entropy needed to resist any practical brute force attack. In other words, when a large random or pseudo-random number from a cryptographic strength pseudo-random number generator (CSPRNG) [[ref: CSPRNG]] expressed as a string of characters is used as a seed or private key to a cryptosystem with perfect-security, the critical design parameter is determined by the amount of random entropy in that string needed to withstand a brute force attack. Any subsequent cryptographic operations must preserve that minimum level of cryptographic strength. In information theory, [[10]] [[ref: ITPS]] the entropy of a message or string of characters is measured in bits. Another way of saying this is that the degree of randomness of a string of characters can be measured by the number of bits of entropy in that string.  Assuming conventional non-quantum computers, the convention wisdom is that, for systems with information-theoretic or perfect-security, the seed/key needs to have on the order of 128 bits (16 bytes, 32 hex characters) of entropy to practically withstand any brute force attack [[12]] [[11]]. A cryptographic quality random or pseudo-random number expressed as a string of characters will have essentially as many bits of entropy as the number of bits in the number. For other crypto-systems such as digital signatures that do not have perfect-security, the size of the seed/key may need to be much larger than 128 bits in order to maintain 128 bits of cryptographic strength.

An N-bit long base-2 random number has 2<sup>N</sup> different possible values. Given that no other information is available to an attacker with perfect-security, the attacker may need to try every possible value before finding the correct one. Thus, the number of attempts that the attacker would have to try maybe as much as 2<sup>N-1</sup>.  Given available computing power, one can easily show that 128 bits is a large enough N to make brute force attack computationally infeasible.

The adversary may have access to supercomputers. Current supercomputers can perform on the order of one quadrillion operations per second. Individual CPU cores can only perform about 4 billion operations per second, but a supercomputer will parallelly employ many cores. A quadrillion is approximately 2<sup>50</sup> = 1,125,899,906,842,624. Suppose somehow an adversary had control over one million (2<sup>20</sup> = 1,048,576) supercomputers which could be employed in parallel when mounting a brute force attack. The adversary then could try 2<sup>50</sup> x  2<sup>20</sup> = 2<sup>70</sup> values per second (assuming very conservatively that each try took only one operation).

There are about 3600 * 24 * 365 = 313,536,000 = 2<sup>log<sub>2</sub>313536000</sup>=2<sup>24.91</sup> ~= 2<sup>25</sup> seconds in a year. Thus, this set of a million super computers could try 2<sup>50+20+25</sup> = 2<sup>95</sup> values per year. For a 128-bit random number this means that the adversary would need on the order of 2<sup>128-95</sup> = 2<sup>33</sup> = 8,589,934,592 years to find the right value. This assumes that the value of breaking the cryptosystem is worth the expense of that much computing power. Consequently, a cryptosystem with perfect-security and 128 bits of cryptographic strength is computationally infeasible to break via brute force attack.

[//]: # (Information theoretic security and perfect-security {#sec:annexB .informative})

#### Information theoretic security and perfect-security

The highest level of cryptographic security with respect to a cryptographic secret (seed, salt, or private key) is called information-theoretic security. A cryptosystem that has this level of security cannot be broken algorithmically even if the adversary has nearly unlimited computing power including quantum computing. It must be broken by brute force if at all. Brute force means that in order to guarantee success the adversary must search for every combination of key or seed. A special case of information-theoretic security is called perfect-security.  Perfect-security means that the ciphertext provides no information about the key. There are two well-known cryptosystems that exhibit perfect-security. The first is a one-time-pad (OTP) or Vernum Cipher;  the other is secret splitting, a type of secret sharing that uses the same technique as a one-time-pad.

#### Post-Quantum Security
Post-quantum or quantum-safe cryptography deals with techniques that maintain their cryptographic strength despite attacks from quantum computers. Because it is currently assumed that practical quantum computers do not yet exist, post-quantum techniques are forward-looking to some future time when they do exist. A one-way function that is post-quantum secure will not be any less secure (resistant to inversion) in the event that practical quantum computers suddenly or unexpectedly become available. One class of post-quantum secure one-way functions are some cryptographic strength hashes. The analysis of D.J. Bernstein with regards the collision resistance of cryptographic one-way hashing functions concludes that quantum computation provides no advantage over non-quantum techniques. Consequently, one way to provide some degree of post-quantum security is to hide cryptographic material behind digests of that material created by such hashing functions. This directly applies to the public keys declared in the pre-rotations. Instead of a pre-rotation making a cryptographic pre-commitment to a public key, it makes a pre-commitment to a digest of that public key. The digest may be verified once the public key is disclosed (unhidden) in a later rotation operation. Because the digest is the output of a one-way hash function, the digest is uniquely strongly bound to the public key. When the unexposed public keys of a pre-rotation are hidden in a digest, the associated private keys are protected from a post-quantum brute force inversion attack on those public keys.

To elaborate, a post-quantum attack that may practically invert the one-way public key generation (ECC scalar multiplication) function using quantum computation must first invert the digest of the public key using non-quantum computation. Pre-quantum cryptographic strength is, therefore, not weakened post-quantum. A surprise quantum capability may no longer be a vulnerability. Strong one-way hash functions, such as 256-bit (32-byte) Blake2, Blake3, and SHA3, with 128-bits of pre-quantum strength, maintain that strength post-quantum. Furthermore, hiding the pre-rotation public keys does not impose any additional storage burden on the controller because the controller must always be able to reproduce or recover the associated private keys to sign the associated rotation operation. Hidden public keys may be compactly expressed as Base64 encoded qualified public keys digests (hidden) where the digest function is indicated in the derivation code.

#### KERI Security Properties

Every operation in this protocol is expressed via cryptographically verifiable events. Successful exploitation, therefore, must attack and compromise the availability and/or consistency of events. Security analysis, therefore, is focused on characterizing the nature and timing of these attacks and how well the protocol preserves the availability and consistency of events when subject to attack. Therefore, these potential exploits are described in terms of these properties.

The first property concerns live versus dead event exploits. A live exploit involves attacks on current or recent events. Protection from live exploits is essential to maintaining operational security in the present. Protection from live exploits focuses on providing sufficient availability of current events as well as ensuring their consistency (non-duplicity). A dead exploit, in contrast, involves attacks on past events. Protection from dead exploits is primarily provided by duplicity detection (consistency). One verifiable copy of a KEL (KERL) is enough to detect duplicity in any other verifiable but inconsistent copy. Attacks on the availability of past events are relatively easily mitigated by archiving redundant copies. The eventuality of dead exploits of compromised signing keys must be mitigated because digital signatures may become less secure as computing and cryptographic technology advance over time (quantum or otherwise). Eventually, their keys may become compromised via a direct attack on their cryptographic scheme.

The second property is a direct versus indirect operational mode exploit. The protocol may operate in two basic modes, called direct and indirect. The availability and consistency of attack surfaces are different for the two modes, and hence, the mitigation properties of the protocol are likewise mode-specific.

The third property is a malicious third party versus a malicious controller exploit. In the former, the attack comes from an external malicious attacker, but the controller is honest. In the latter, the controller may also be malicious and, in some ways, may be indistinguishable from a successful malicious third party. The incentive structure for the two exploit types is somewhat different, and this affects the mitigation properties of the protocol. It is helpful in both the design and analysis of protection to consider these two kinds of attacks separately.

The main participants in the protocol are controllers and validators. The other participants, such as witnesses, watchers, jurors, judges, and resolvers, provide support to and may be under the control of either or both of the two main participants.

The analysis of protection against an attack can be further decomposed into three properties of each protection mechanism with respect to an attack: susceptibility to being attacked, vulnerability to harmfulness given an attack, and recoverability given a harmful attack. Security design involves making trade-offs between these three properties of protection mechanisms. Harm from a successful exploit may arise in either or both of the following two cases:
- A controller may suffer harm due to the loss or encumberment of some or all of its control authority such that the malicious entity may produce consistent, verifiable events contrary to the desires of the controller and/or impede the ability of the controller to promulgate new key events.
- A validator may suffer harm due to its acceptance of inconsistent verifiable events produced by a malicious entity (controller and/or third party).

Protection consists of either prevention or mitigation of both of the harm cases. The primary protection mechanisms for the controller include best practice key management techniques for maintaining root control authority, redundant confirmation of events by supporting components, and duplicity detection on the behavior of designated supporting components. The primary protection mechanism for the validator is duplicity detection on the behavior of supporting components.

#### Key Event Receipt Log

A Key Event Receipt Log (KEL) consists of signed key events, keeping track of establishment events. To begin with the inception event and any number of rotation events. We call that this establishment subsequence.  
The Key Event Receipt Logs are KELs that also include receipts of events signed by the witnesses of those events (called *commitments*); these are also append-only but not hash-chained.

#### Seal

A seal anchors arbitrary data or a tree of hashes of arbitrary data to a particular event in the key event sequence. A seal is a cryptographic commitment in a secondary root-of-trust (e.g. TEL) that is anchored in a primary-root-of-trust (e.g.KEL). The main characteristics are that payload of the seal becomes immutable and the controller commits a signature to the seal.

### Validation


#### Verifier
A verifier is an entity or component that cryptographically verifies an event message's structure and its signature(s). Structure verification includes verifying the event's said, the appearance of fields, and prior event digests. In order to verify signatures, a verifier must first determine which set of keys are or were the controlling set for the AID of that event when the event was issued. In other words, a verifier must also establish the control authority for the event at issuance. This control establishment requires a copy of the inception event for identifiers that are declared as non-transferable at inception. For identifiers that are declared transferable at inception, this control establishment requires a complete copy of the sequence of key operation events (inception and all rotations) for the identifier up to and including the issued event. Signature verification includes verifying signatures from both current signing and exposed prior rotation (if any) public keys for the event. This includes verifying threshold satisfaction for both current and prior rotation thresholds. Without loss of generality, any reference to the verification of an event or verification of an event's signatures refers to the complete process described above.

#### Validator
In contrast, a validator is an entity or component that determines that a given signed event associated with an AID was valid at the time of its issuance. Validation first requires that the event itself is verifiable; that is, it has verifiable structure and signatures from the current controlling key pairs at the time of its issuance. Therefore, a validator must first act as a verifier in order to establish the root authoritative set of keys and verify the associated signatures. Once verified, the validator may apply other criteria or constraints to the event in order to determine its validity. This may include witnessing and delegation validation. The final result of validation may be acceptance of the event into the associated KEL. The location of an event in its key event sequence is determined by its sequence number, `sn`. The version of an event at a given location in the key event sequence is different or inconsistent with some other event at the same location if any of its content differs or is inconsistent with that other event.

#### Witness
A witness is an entity or component designated (trusted) by the controller of an identifier. The primary role of a witness is to verify, sign, and keep events associated with an identifier. A witness is the controller of its own self-referential identifier which may or may not be the same as the identifier to which it is a witness.  

An identifier witness therefore is part of its trust basis and may be controlled (but not necessarily so) by its controller. The purpose of a pool of witnesses is to protect the controller from external exploit of its identifier.  
The terms [[ref: Backer]] and [[ref: Witness]] are closely related in KERI but are not synonyms or interchangeable.

In an operational sense a witness constitutes an entity that may receive, verify, and store key events for an identifier. Each witness controls its own identifier used to sign key event messages, a controller is a special case of a witness.

#### Watcher
KERI's alternative to total global ordering and consensus protocols is the duplicity detection mechanism. In verification and validation watchers are all that matter; they guarantee that logs are immutable by one very simple rule: "[[ref: first seen]] wins".

In an operational sense a set of watchers (that the validators trust) record any and all copies of key event logs (KEL) that they see. Because these watchers can be anyone and anywhere, any controller of a public identifier is at peril should they choose to publish inconsistent copies of their KEL. This removes the incentive to be duplicitous.

#### Duplicity

A duplicitous event is defined as a verified but different version of an event at the same location. The possession of a KEL for any AID enables duplicity detection by a validator for any set of events with respect to that KEL. Indeed, this property of KERI enables duplicity evident processing of events. This forms a basis for evaluating trust in the controller of an AID. A validator can decide to trust or not based on the evidence or lack thereof of duplicity. A validator may choose to trust when there is no evidence of duplicity. A validator should choose not to trust when there is evidence of duplicity. In some cases, the controller may perform a recovery operation that enables a validator to reconcile that duplicity and allow the validator to once again trust the controller.

#### Event Types and Classes

In validation, in addition to the version, the type and/or class of event may matter. There are five types of events, inception, `icp`, rotation, `rot`, interaction, `ixn`, delegated inception `dip`, and delegated rotation, `drt`.

There are two main classes of events these are:
- establishment consisting of the types inception, rotation, delegated inception, and delegated rotation.
- non-establishment consisting of the type, interaction.

There is one sub-class, delegated establishment, which consists of the types of delegated inception and delegated rotation.

#### Validator Roles and Event Locality

Each controller must accept events into its own copy of its KEL. In this sense, every controller is also a validator for its own AID. Controllers, as validators, play different roles for different types and classes of events. The validation logic for acceptance of an event into a given controller's KEL depends on the role that the controller plays for that type or class of event.

The possible roles that a given validator may play for any given event are as follows: controller, witness, delegator, Delegatee, or none of the above. For the sake of clarity, validators that act in different roles with respect to a given event are called the parties to the event. When the context makes it clear, a party that is not one of a controller, witness, delegator, or Delegatee is called simply a validator. Otherwise, the role of the validator is qualified and can be expressed by  the roles of controller, witness, validator, delegator, and Delegatee. A party may be referred to as a validator when it does not matter what role a party plays. To clarify, all the parties perform validation, but the validation rules are different for each role.  A given controller may also act as a delegator or Delegatee for a given event. A given event for an AID may both delegate other AIDs and be delegated by yet other AIDs. An event is processed differently by each party depending on its respective role or roles.

Events are also processed as either local (protected, trustable) or nonlocal, i.e., remote (unprotected, untrustable). The validator of a local event may assume that the event came from a protected, trustable source, such as the device upon which the validation code is running or from a protected transmission path from some trustable source. The validator of a remote (nonlocal) event must assume that the event may have come from a malicious, untrustable source.  To elaborate, an event is deemed local when the event is sourced locally on a device under the supervision of the validator or was received via some protected channel using some form of MFA (multi-factor authentication) that the validator trusts. An event is deemed remote (nonlocal) when it is received in an unprotected (untrustable) manner. The purpose of local versus remote is to enable increased security when processing local events where a threshold structure may be imposed, such as a threshold of accountable duplicity for a witness pool.

To elaborate, a witness pool may act as a threshold structure for enhanced security when each witness only accepts local events that are protected by a unique authentication factor in addition to the controller's signatures on the event, thereby making the set of controller signature(s) the primary factor and the set of unique witness authentication factors a secondary thresholded multifactor. In this case, an attacker would have to compromise not merely the controller's set of private key(s) but also the unique second factor on each of a threshold number of witnesses.

Likewise, a delegator may act as a threshold structure for enhanced security when the delegator only accepts local events for delegation that are protected by a unique authentication factor, thereby making the set of controller signature(s) the primary factor, the set of unique witness authentication factors a secondary thresholded multifactor and the delegator's unique authentication factor as a tertiary factor. An attacker, therefore, has to compromise not merely the controller's private key(s) as the primary factor but also the unique secondary factor on each of a threshold number of witnesses and the unique tertiary factor for the delegator. This layered set of multifactor authentication mechanisms can make exploit practically infeasible.

#### Validation Rules

The validation rules are as follows:

- Given a local event, the event's controller (non-Delegatee) can sign and accept that event into its copy of that event's KEL. The controller should then propagate that event with attached controller signatures to the event's witnesses for receipting. Given a remote event, the event's controller (non-Delegatee) should not sign or otherwise accept that event into its copy of that event's KEL. The controller should not propagate that event to the event's witnesses for receipting.

- Given a local event, the event's witness must first verify the event's controller signatures before it can sign (witness) and accept that event into its copy of that event's KEL. The witness then should create a receipt of the event with the attached controller and witness signatures and can then propagate that event to other validators. Given a remote event, the event's witness should not sign or otherwise accept that event into its copy of that event's KEL. The witness should not propagate that event to other validators including witnesses.

- Given a local delegated event, the event's Delegatee can sign and accept that event into its copy of that event's KEL. The Delegatee then should propagate that event with attached signatures to the event's witnesses for receipting. The Delegatee also should propagate that event with attached controller signatures and attached witness signatures (if witnessed) to the event's delegator for approval via an anchored seal. Given a remote event, the event's Delegatee should not sign or otherwise accept that event into its copy of that event's KEL. The Delegatee should not propagate that event to the event's witnesses for receipting or to the event's delegator for approval.

- Given a local delegated event, the event's delegator must first verify the event's Delegatee signatures and witness signatures (if witnessed) before it can accept that event into its copy of that event's KEL. The delegator can then decide to approve that event by sealing (anchoring the event's seal) the event in the delegator's own KEL. Since the Delegator sealed the event, the delegator then can propagate a receipt of the sealing (anchoring) event to the event's Delegatee and to the event's witnesses (if any).  Given a remote delegated event, the event's delegator should not approve (seal) or otherwise accept that event into its copy of that event's KEL. A malicious attacker that compromises the pre-rotated keys of the Delegatee may issue a malicious but verifiable rotation that changes its witness pool in order to bypass the local security logic of the witness pool. The approval logic of the delegator should choose not to automatically approve a delegable rotation event unless that event's change to the witness pool is below the witness pool's prior threshold.

- Given a local or remote event, a non-controller, non-witness, non-delegator validator must first verify the event's controller signatures, witness signatures (if witnessed), and delegator anchoring seal (if delegated) before it can accept that event into its copy of that event's KEL.

- Given either a local or remote receipt any validator must first verify the witness signatures or delegator seals attached to that receipt and then can attach those signatures or seals to its copy of the event.

### Superseding Recovery and Reconciliation

#### First Seen Policy

Once a given version of an event at a location has been accepted, it is considered "first seen" for that KEL. Once an event has been first seen, it is always seen and can't be unseen. This rule is succinctly expressed as "first seen, always seen, never unseen." This first-seen property enables duplicity detection of different versions of an event. Although an event can never be unseen, in some special cases, it may be superseded by a different version of an event at the same location. Although never explicitly represented in an event message itself, each event belonging to a KEL is also assigned a strictly monotonically increasing integer ordinal called the first-seen number, `fn`, which is stored alongside the event in the KEL database. This allows any copy of a KEL to keep track of the ordering of when each event was first-seen independent of the event's location given by its sequence number, `sn`. Different copies of a KEL may have different first-seen numbers, `fn` for given versions of events at a location, `sn`, but consistent copies of the KEL will have the same version of the event at every location. Events that are superseded are essentially forked. A KEL is essentially a directed acyclic graph (DAG) of events. When an event is superseded, a branch in the DAG is created. There may be only one undisputed path through the DAG called the trunk. All the superseded branches are considered disputed.

#### Reconciliation

Reconciliation is the process of determining the undisputed path, i.e., the trunk. If every validator of a KEL cannot universally find the same undisputed path (trunk) through a KEL, then the KEL is irreconcilable. Reconciliation happens by applying the superseding validation acceptance (reconciliation) rules to different versions of events that are received for the same location in a KEL. Superseding events provide a universal reconciliation process to enable recovery from key compromises where such key compromises resulted in the first acceptance of compromised events into a KEL. Recovery happens with superseding rotation events that both rotate out the compromised keys and dispute the events signed by those compromised keys. Because events are signed nonrepudiably, any key compromise is still the responsibility of the controller. That controller still may be held accountable for any harm that resulted from the compromise. However, recovery enables the KEL to be repaired so that future validators of the KEL will not see the compromised events after recovery. The events will only be seen by the validators who first saw the events before recovery.

The superseding validation acceptance rules for events at a given location may involve some combination of the location, version, type, and class of the event as well as the role of the validator, such as controller, witness, delegator, Delegatee, or none of the above.


#### Superseding Recovery

To supersede an event means that after an event has already been accepted as first seen into a KEL, a different event at the same location (same sequence number) is accepted that supersedes that pre-existing event. The new event becomes part of the trunk (undisputed path), and the old event is the first event in a fork (branch) that includes all the subsequent events to the superseded event. This enables the recovery over the control of a KEl despite events signed by compromised keys. The result of superseded recovery is that the KEL is forked at the `sn` (location) of the superseding event. The compromised events are shunted to the disputed branch, and new events to the KEL are attached to the new end of the trunk formed by the superseding event. To clarify, all events in the superseded branch of the fork still exist but, by virtue of being superseded, are disputed. The set of superseding events in the superseding fork forms the authoritative branch of the KEL, i.e., its trunk or undisputed path. All the already-seen but superseded events in the superseded fork still remain in the KEL. These superceded events may be viewed or replayed in order of their original acceptance because the database stores all accepted events in order of acceptance and denotes this order using the first seen ordinal number, `fn`. The `fn` is not the same as the `sn` (sequence number). Each event accepted into a KEL has a unique `fn` but multiple events due to recovery forks may share the same `sn`.  Events with the same `sn` in different copies of the same KEL may have different `fns` because the events may have been first seen or accepted into that KEL in a different order. Notably, an event that may not supersede, according to the rules below, another event at the same location cannot be first seen at all by that KEL. This effectively protects the KEL from later compromise for any downstream recipients of that KEL.


#### Superseding Rules for Recovery at a given location, SN (sequence number).

A.

  A0. Any rotation event may supersede an interaction event at the same `sn` where that interaction event is not before any other rotation event.

  A1. A non-delegated rotation may not supersede another rotation.

  A2. An interaction event may not supersede any event.


B.  A delegated rotation may supersede the latest-seen delegated rotation at the same `sn` under either of the following conditions:

  B1.  The superseding rotation's delegating event is later than the superseded rotation's delegating event in the delegator's KEL, i.e., the `sn` of the superseding event's delegation is higher than the `sn` of the superseded event's delegation.

  B2. The superseding rotation's delegating event is the exact same delegating event as the superseded rotation's delegating event in the delegator's KEL, and the anchoring seal of the superseding rotation's delegated event appears later in the seal list than the anchoring seal of the superseded rotation's delegated event. i.e., both superseded and superseding event delegations appear in the same delegating event, and the anchoring seal of the superseding rotation's event appears later in the seal list than the anchoring event seal of the superseded rotation's event.

  B3. The `sn` of the superseding rotation's delegating event is the same as the `sn` of the superseded rotation's delegating event in the delegator's KEL, and the superseding rotation's delegating event is a rotation, and the superseded rotation's delegating event is an interaction, i.e., the superseding rotation's delegating event is itself a superseding rotation of the superseded rotation's delegating interaction event in its delegator's KEL.

C. IF neither A. nor B. is satisfied, then recursively apply rules A. and B. to the delegating events of those delegating events and so on until either A. or B. is satisfied, or the root KEL of the delegation which must be undelegated has been reached.

  C1. IF neither A. nor B. is satisfied by the recursive application of C. to each delegator's KEL in turn, i.e., the root KEL of the delegation has been reached without satisfaction, then the superseding rotation is discarded. The terminal case of the recursive application of C. will occur at the root KEL, which by definition must be non-delegated therefore either A. or B. must be satisfied, or else the superseding rotation must be discarded.

The latest-seen delegated rotation constraint in B. means that any earlier delegated rotations can NOT be superseded. This greatly simplifies the validation logic and avoids a potentially infinite regress of forks in the delegated identifier's KEL. However, this means recovery can happen for any compromise of pre-rotated keys, only the latest-seen. In order to unrecoverably capture control of a delegated identifier, the attacker must issue a delegated rotation that rotates to keys under the control of the attacker that the delegator must approve and then issue and get approved by the delegator another rotation that follows but does not supersede the compromising rotation. At that point, recovery is no longer possible because the delegate would no longer control the private pre-rotated keys needed to sign a recovery rotation as the latest-seen rotation verifiably. Recovery is possible after the first compromised rotation by superseding it but not after the subsequent compromised rotation.

A rotation event at the same location may supersede an interaction. This enables recovery of live exploit of the exposed current set of authoritative keys used to sign non-establishment events via a rotation establishment event to the unexposed next set of authoritative keys. The recovery process forks off a disputed branch from the recovered trunk. This disputed branch has the compromised events, and the main trunk has the recovered events.


### KERI's Algorithm for Witness Agreement (KAWA)

#### Introduction

A controller may provide a highly available promulgation service for its events via a set or pool of N designated witnesses. This witness pool may also provide enhanced security for the controller over its events. Even though the witnesses are explicitly designated by the controller, they may or may not be under the control of the controller. The designation is a cryptographic commitment to the witnesses via a verifiable statement included in an establishment event. The purpose of the witness set is to better protect the service from faults including Byzantine faults. Thus, the service employs a type of Byzantine Fault Tolerant (BFT) algorithm called KERI’s Algorithm for Witness Agreement (KAWA). The primary purpose of KAWA is to protect the controller’s ability to promulgate the authoritative copy of its key event history despite external attacks. This includes maintaining a sufficient degree of availability such that any validator may obtain an authoritative copy on demand.

The critical insight is that because the controller is the sole source of truth for the creation of any and all key events, it alone, is sufficient to order its own key events. Indeed, a key event history does not need to provide double spend proofing of an account balance, merely consistency. Key events, by and large, are idempotent authorization operations as opposed to non-idempotent account balance decrement or increment operations. Total or global ordering may be critical for non-idempotency, whereas local ordering may be sufficient for idempotency, especially to merely prove the consistency of those operations. The implication of these insights is that fault tolerance may be provided with a single-phase agreement by the set of witnesses instead of a much more complex multi-phase commit among a pool of replicants or other total ordering agreement process as is used by popular BFT algorithms. Indeed, the security guarantees from KAWA may approach that of other BFT algorithms but without their scalability, cost, throughput, or latency limitations. If those other algorithms may be deemed sufficiently secure, then so may be KAWA. Moreover, because the controller is the sole source of truth for key events, a validator may hold that controller (whether trusted or not) accountable for those key events. As a result, the algorithm is designed to enable a controller to provide itself with any degree of protection it deems necessary given this accountability.

#### Advantages

The reliance on a designated set of witnesses provides several advantages. The first is that the identifier’s trust basis is not locked to any given witness or set of witnesses but may be transferred at the controller’s choosing. This provides portability. The second is that the number and composition of witnesses is also at the controller’s choosing. The controller may change this in order to make trade-offs between performance, scalability, and security. This provides flexibility and adaptability. Thirdly, the witnesses need not provide much more than verification and logging. This means that even highly cost or performance constrained applications may take advantage of this approach.

Likewise, given any guarantees of accountability the controller may declare, a validator may provide itself with any degree of protection it deems necessary by designating a set of observers (watchers, jurors, and judges). Specifically, a validator may be protected by maintaining a copy of the key event history as first seen (received) by the validator or any other component trusted by the validator (watcher, juror, judge). This copy may be used to detect any alternate inconsistent (duplicitous) copies of the key event history. The validator then may choose how to best respond in the event of a detected duplicitous copy to protect itself from harm. A special case is a malicious controller that intentionally produces alternate key event histories. Importantly, observer components that maintain copies of the key event history such as watchers, jurors, and judges, may be under the control of validators not controllers. As a result, a malicious alternate (duplicitous) event history may be eminently detectable by any validator. This is called ambient duplicity detection (which stems from ambient verifiability). In this case, a validator may still be protected because it may still hold such a malicious controller accountable given a duplicitous copy (trust or not trust). It is at the validator’s discretion whether or not to treat its original copy as the authoritative one with respect to any other copy and thereby continue trusting or not that original copy. A malicious controller may not therefore substitute later with impunity any alternate copy it may produce. Furthermore, as discussed above, a malicious controller that creates an alternative event history imperils any value it may wish to preserve in the associated identifier. The alternative event history  is potentially completely self-destructive with respect to the identifier. A malicious controller producing a detectably duplicitous event history is tantamount to a detectable total exploit of its authoritative keys and the keys of its witness set. This is analogous to a total but detectable exploit of any BFT ledger such as a detectable 51% attack on a proof-of-work ledger. A detectable total exploit destroys any value in that ledger after the point of exploit.

To restate, a controller may designate its witness set in such a way as to provide any arbitrary degree of protection from external exploit. Nonetheless in the event of such an exploit a validator may choose either to hold that controller accountable as duplicitous and therefore stop trusting the identifier or to treat the validator’s copy of the key event history as authoritative (ignoring the exploited copy) and therefore continue trusting the identifier. This dependence on the validator’s choice in the event of detected duplicity both imperils any potential malicious controller and protects the validator.

KERI’s KAWA or the algorithm is run by the controller of an identifier in concert with a set of N witnesses designated by the controller to provide as a service the key event history of that identifier via a KERL in a highly available and fault-tolerant manner. One motivation for using key event logs is that the operation of redundant immutable (deletion proof) event logs may be parallelizable and hence highly scalable. A KERL is an immutable event log that is made deletion proof by virtue of it being provided by the set of witnesses of which only a subset of F witnesses may at any time be faulty. In addition to designating the witness set, the controller also designates a threshold number, M, of witnesses for accountability. To clarify, the controller accepts accountability for an event when any subset M of the N witnesses confirms that event. The threshold M indicates the minimum number of confirming witnesses the controller deems sufficient given some number F of potentially faulty witnesses. The objective of the service is to provide a verifiable KERL to any validator on demand. Unlike direct mode where a validator may be viewed as an implicit witness, with indirect mode, a validator may not be one of the N explicitly designated witnesses that provide the service.

#### Witness Designation

The controller designates both the witness tally number and the initial set of witnesses in the inception event configuration. The purpose of the tally is to provide a threshold of accountability for the number of witnesses confirming an event. Subsequent rotation operations may amend the set of witnesses and change the tally number. This enables the controller to replace faulty witnesses and/or change the threshold of accountability of the witness set. When a rotation amends the witnesses it includes the new tally, the set of pruned (removed) witnesses and the set of newly grafted (added) witnesses.

#### Witnessing Policy

In this approach, the controller of a given identifier creates and disseminates associated key event messages to the set of N witnesses. Each witness verifies the signatures, content, and consistency of each key event it receives. When a verified key event is also the first seen version of that event the witness has received, then it witnesses that event by signing the event message to create a receipt, storing the receipt in its log (KERL), and returning the receipt as an acknowledgment to the controller. Depending on its dissemination policy, a witness may also send its receipt to other witnesses. This might be with a broadcast or gossip protocol or not at all.

In general, the witnessing policy is that the first seen version of an event always wins; that is, the first verified version is witnessed (signed, stored, acknowledged, and maybe disseminated), and all other versions are discarded. The exception to this general rule is that a rotation event may provide a superseding recovery. The recovery process may fork off a branch from the recovered trunk. This disputed branch has the disputed exploited events, and the main trunk has the recovered events. The operational mode and the threshold of accountable duplicity determine which events in the disputed branch are accountable to the controller.

Later messages or receipts from other witnesses may not change any existing entry in the log (the log is append-only, i.e., immutable) unless they are correctly reconcilable superseding events. Each witness also adds to its log any verified signatures from consistent receipts it receives from other witnesses. A consistent receipt is a receipt for the same version of the event already in its log at a location. Excepting superseding recovery, inconsistent receipts, i.e., for different event versions at the same location, are discarded (not kept in the log). However, as an option, a controller may choose to run a juror (in concert with a witness) that keeps a duplicitous event log (DEL) of the inconsistent or duplicitous receipts that a witness receives. To clarify, a witness’ KERL is by construction, an immutable log. This log includes the events with attached verified signatures, which are the receipts from the controller, the witness, and other witnesses.

Initial dissemination of receipts to the N witnesses by the controller may be implemented extremely efficiently with respect to network bandwidth using a round-robin protocol of exchanges between the controller and each of the witnesses in turn. Each time the controller connects to a witness to send new events and collect the new event receipts, the Controller also sends the receipts it has received so far from other witnesses. This round-robin protocol may require the controller to perform at most two passes through the entire set of witnesses in order to fully disseminate a receipt from each witness to every other witness for a given event. This means that at most 2·N acknowledged exchanges are needed for each event to create a fully witnessed KERL at every witness and controller. Network load, therefore, scales linearly with the number of witnesses.

When network bandwidth is less constrained, a gossip protocol might provide full dissemination with lower latency than a round-robin protocol but with higher bandwidth usage. Gossip protocols scale with N · log(N) (where N is the number of witnesses) instead of 2·N. A directed acyclic graph or other data structure can be used to determine what needs to be gossiped.

#### Immunity and Availability

It can be shown that for any set of N witnesses, (see [[ref: KERI-WP ]]) there is a threshold M < N that guarantees that at most one sufficient agreement occurs or none at all despite a dishonest controller but where at most F* = N-M of the witnesses are potentially unavailable and at most F < M is duplicitous. This guarantee means that the agreement is deemed immune (from failure due to faulty F or F*). To elaborate, given at most F* potentially unavailable or F potentially duplicitous witnesses, an immune agreement requires that M be a sufficient majority of N and guarantees as a result that the service may either only produce a sufficient agreement for one version of each event or none at all despite a dishonest or exploited controller. The following table provides values of  N, M, F, and F* that satisfy this immunity constraint.

| F |  N | 3F+1 | (N+F+1)/2 | N-F |   M | F*=N-M |
|--:|---:|-----:|----------:|----:|----:|-------:|
| 1 |  4 |    4 |         3 |   3 |   3 |      1 |
| 1 |  6 |    4 |         4 |   5 | 4,5 |    2,1 |
| 2 |  7 |    7 |         5 |   5 |   5 |      2 |
| 2 |  9 |    7 |         6 |   7 | 6,7 |    3,2 |
| 3 | 10 |   10 |         7 |   7 |   7 |      7 |
| 3 | 12 |   10 |         8 |   9 | 8,9 |    4,3 |


Given the immune constraint is satisfied, the service may not produce multiple divergent but proper KERL). In order to be deemed proper, an agreement must have been verified as consistent with all prior events by every non-faulty witness who is a party to that agreement. Thus, any user of the service, be it a validator, watcher, juror, or judge, will be able to obtain either a proper event agreement on demand from some witness or none at all. Any non-faulty witness with a proper agreement will keep that agreement in its KERL and provide it on demand. Consequently, the availability of a proper event at a witness is tantamount to the availability of a proper log (KERL) of all prior events consistent with that event at that witness, and thereby, high availability of the service is assured.

#### Security Properties

The continuing promulgation of key events assumes a sufficiently responsive controller. Lack of responsiveness is primarily a threat to the controller, not a validator. Consequently, providing sufficient controller responsiveness is the controller's responsibility, not of KAWA. In contrast, a responsive but dishonest (or compromised) controller may pose a live threat to a validator with respect to new events never before seen by the validator. The validation process must provide means for the validator to protect itself from such threats. When the controller is responsive but dishonest, the Controller may create inconsistent versions of an event that are first seen by different subsets of its witnesses. In the case where only F of the witnesses is faulty despite a dishonest controller, the validator may protect itself by requiring a large enough sufficient agreement or threshold of accountable duplicity, M, that guarantees that either only one satisfying agreement or none at all, e.g., makes the service immune. To restate, the validator may select its M to ensure that the service is immune such that the service will either provide one and only one KERL or none at all. This protects the validator.

A greater threat to a validator may be that of a dishonest controller that may collude with its witnesses to promulgate alternative (divergent) event version agreements, each with sufficient agreement. But this would violate the assumption of at most F faulty witnesses. In this case, the witness consensus process, i.e., the KAWA algorithm, may not protect the validator. Protection must come from some other process under the validator’s control. In this case, a validator may protect itself with duplicity detection via a set of observers (validators, watchers, jurors, judges). In such a case, in order to undetectably promulgate alternate but sufficiently accountable event version agreements, a dishonest controller with dishonest witnesses must prevent any validator from communicating with any other observer who may have seen any alternate event version agreement. This attack may be made practically unfeasible given a large and diverse enough set of observers. Indeed, once duplicity is detected, that identifier loses all its value to any detecting validator. This imperils any dishonest controller who attempts such an attack.

The final threat is the threat of dead exploit where, sometime in the future, the exposed key pairs used to sign past events in a KERL may be compromised. The compromised keys may then be used to create an alternate or divergent verifiable event history. Recall, however, that a proper KERL enables validation of the controlling keys of the associated identifier over the time frame of the events in the log. Once produced, a proper KERL may be provided by any observer (validator, watcher, juror, or judge) that has retained a copy of it not merely the witnesses. Subsequent compromise of a controller’s keys and a compromise of witnesses may not invalidate any of the events in a pre-existent proper KERL.

Therefore, in order to fool a validator into accepting an erroneous or compromised divergent key event history, a successful exploiter must forge a proper KERL but with a different sequence of key events. To do this the exploiter must not only exploit the controller’s signing keys that were authoritative at some event but also exploit M of the N designated witnesses at that event as well. The exploiter must also prevent that validator from accessing any other but alternate proper KERL from any other observer (validator, watcher, juror, judger) that may have a copy as a check against such an attack. The combination of these tasks makes such an exploit extremely difficult to achieve.

Consequently, even in the extreme case that sometime in the future, a complete and total dead exploit of the controller keys and at least M of the witnesses occurs such that they forge a seemingly proper but divergent KERL, any prior copy of a proper KERL will enable detection and proof of accountable duplicity of that dead exploit. In this case, the validator may choose to use the prior copy from some set of jurors it trusts to determine which of the divergent KERLs is authoritative. This is similar to how certificate transparency works. In order for such a dead attack to succeed, the attacker must prevent a targeted validator from accessing any other copies of an alternate KERL.

The idea of ambient verifiability mentioned above comes from the fact that the original KERL may be distributed among any number of watchers from whom a validator may obtain a copy. At some point, the degree of accessibility to an original copy becomes essentially ubiquitous, at which point verifiability may be considered ambient. Given ambient verifiability, then, duplicity detection becomes likewise ambient.

To elaborate, a successful dead attack requires the isolation of a validator from ambient sources of the KERL. In general, isolation from ambient sources may be prohibitively expensive. Consequently, ambient verifiability provides asymmetry between the attacker and the defender in favor of the defender. Indeed, the end goal of KERI is to achieve ambient security in the sense that nearly anyone, anywhere, at any time, can become a verifiable controller of a verifiable identity that is protected by ambient verifiability and hence duplicity detection of the associated KERL.

Furthermore, any mutual interaction events between a validator and controller may provide proof of priority. In a mutual interaction, the validator includes a copy or digest of an interaction event sourced by the controller in an event sourced by the validator. A total compromise of the controller and all witnesses would not be able to forge the validator’s signature on the mutual interaction event. Thus, the existence of any mutual interaction events may then be used to prove priority even in the extremely unlikely case of a complete and total dead exploit of a controller and all of its witnesses.

Alternatively, in the case of a complete and total dead exploit, the validator and controller may jointly agree to use some other, more formal mechanism to resolve the priority of divergent KERLs. This may be the median of the astronomical time of the original reception of a receipt by a mutually trusted set of observers. This may be through the use of anchor transactions on a distributed consensus ledger. This later approach would only require minimal use of a distributed consensus ledger in order to resolve the most extreme and unlikely case of total dead exploit.

Finally, however unlikely, subsequent improvements in cryptographic attack mechanisms such as quantum computing may enable, at some future time, complete compromise of all exposed key pairs. One solution would be for the market to operate a trusted set of jurors that archive KERLs just in case of some such future total compromise. These trusted jurors may secure their archives with post-quantum cryptography. Thus, any post-quantum attack may be detectable merely by appeal to one or more of these archives.

### Native CESR Encodings of KERI Messages

A native CESR encoding of the field map of a KERI message body is represented using pure CESR instead of JSON, CBOR, or MGPK. Because the top-level fields in every KERI message body are fixed and each value in CESR is self-describing and self-framing, there is no need to provide labels at the top level, only the field values in a fixed order. In the following tables, for comparison and clarity, the first column provides the equivalent field label as would be used in JSON, CBOR, or MGPK; the second column provides the field value format; and the third column a short description. For field values that are primitives, an example primitive may be provided as the value. To restate, no top-level labels appear in an actual serialized native CESR message body, just the concatenated field values either as primitives or groups of primitives with the appropriate prepended CESR group codes. The order of appearance of fields as values is strict.

Nested field maps may appear as values of top-level fields. For example, a seal may be expressed as a field map. In that case, the CESR count code for a generic field map is used.

Similarly, lists may appear as values of top-level fields. For example, the current signing keys are expressed as a key list. In that case, the CESR count code for a generic list is used.

#### CESR Field Encodings

Some field values in KERI messages that include non-Base64 characters have custom CESR  Text domain encodings (Base64). These encodings are more compact than the case given the direct conversion of a binary string with non-Base64 characters into Base64.

##### DateTime

As described above, the datetime, `dt` field value, if any, shall be the ISO-8601 datetime string with microseconds and UTC offset as per IETF RFC-3339.  An example datetime string in this format is as follows:

`2020-08-22T17:50:09.988921+00:00`

Because this field value format employs non-Base64 characters, direct conversion to Base64 would increase the size of the value. Instead, the non-Base64 characters are converted to unique Base-64 characters using the following conversion table:

| Non-Base64| Base64 | Description |
|:----:|:---:|:-----|
| `:` | `c`| colon |
| `.` | `d`| dot |
| `+` | `p`| plus |

Using this conversion, the base CESR encoding of the DateTime example above becomes:

`2020-08-22T17c50c09d988921p00c00`

The CESR code for DateTime is prepended to this string to produce the fully qualified CESR encoding. This encodes the datetime compactly into Base64 without doing a direct Base64 conversion of a binary string.

##### Threshold

As described above, the fractionally weighted threshold field value may be represented as a list of lists of fractional weights. Those fractional weights may be simple or complex. A complex fractional weight is a single-element field map whose key is a fractional weight and whose value is a list of fraction weights. When serialized in JSON, this field value format employs non-Base64 characters. An example fractionally weighted threshold in JSON is as follows:

```json
[[{"1/2": ["1/2", "1/2", "1/2"]}, "1/2", {"1/2": ["1", "1"]}], ["1/2", {"1/2": ["1", "1"]}]]
```

Direct conversion to Base64 would increase the size of the value. Instead, the block delimited expressions of lists, `[]` and field maps, `{:}` are converted to infix operators in Base64. Likewise, the non-Base64 separators for fractions and list elements are converted to infix operators as separators in Base64. The precedence order of the infix operators enables round-trip conversion between the block-delimited non-Base64 expression and the infix Base64 expression. Noteworthy is that the infix operator expression does not allow recursive nesting. This is not a problem because only one layer of nesting is supported. The following table provides the infix operators in order of priority. Higher in the table is a higher priority.

|Non-Base64 Operation|  Base64 Infix Operator | Description |
|:----:|:---:|:-----|
| `/` | `s`| slash |
| `{:[,]}` | `k`| key of map|
| `{:[,]}` | `v`| nested weight list element of map value|
| `[,]` | `c`| simple weight list element |
| `[[],[]]`| `a` | ANDed weight list ]

Using this infix conversion, the CESR encoding of the JSON fractionally weighted threshold example above becomes:

`1s2k1s2v1s2v1s2c1s2c1s2k1v1a1s21s2k1v1`

Because thresholds are variable length, the appropriate fully qualified CESR code for Base64 only variable-length strings is prepended to the threshold.  This encodes the threshold compactly into Base64 without doing a direct Base64 conversion of a binary string.

##### Route or Return Route

As described above, the value of a Route or Return Route field is a slash, `/` delimited path. Because the slash, `/`, is a non-Base64 character, direct conversion of the route string as binary to Base64 would increase the size of the value. Instead, slashes, `/` may be converted to dashes, `-`. This conversion is only applicable to a route that does not otherwise have any dash, `-` characters, or non-Base64 characters besides the slash, `/.` In that case, the route shall be converted as binary to Base64. An example route is as follows:

`/ipex/offer`

Converting the slashes to dashes gives:

`-ipex-offer`


In the case where a route may be converted to Base64 characters by merely subsituting dashes, `-` for slashes, `/`  then a fully qualified CESR Text domain representation may be created by prepending the appropriate CESR code for variable length Base64 strings.  This encodes the route compactly into Base64 without doing a direct Base64 conversion of a binary string. Otherwise, the route is treated as a variable-length binary string and is converted to Base64. In that case, the appropriate CESR code for variable-length binary strings is prepended to the converted route to provide the Text Domain encoding.

One caveat for Base64 encoded variable lengths strings is that the string shall not start with the `A` character. This is because of a pre-padding ambiguity for variable length Base64 strings. The convention to prevent this is always starting the route with a slash, `/`, which is converted to a dash, `-`. Otherwise, the route shall be treated as a variable-length binary string, which must be converted to Base64 for encoding in the Text domain.


#### Key Event Messages
These have the packet types `icp`, `rot`, `ixn`, `dip`, `drt`

##### Inception `icp`

Field order by label:  `v`, `t`, `d`, `i`, `s`, `kt`, `k`, `nt`, `n`, `bt`, `b`, `c`, `a`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `Y&&&&###` e.g., `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `X&&&` e.g., `icp` | Packet Type |
| `d` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `M&&&` e.g., `MAAA` | Sequence Number of Event |
| `kt` | `M&&&` e.g., `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1) |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List |
| 0th element | `DN6WBhWqp6wC08no2iWhgFYTaUgrasnqz6llSvWQTWZN` | Public Key of signer 0  |
| `nt` | `M&&&` e.g., `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List |
| 0th element | `EDDOarj1lzr8pqG5a-SSnM2cc_3JgstRRjmzrrA_Bibg` | Digest of Public Key of rotator 0 |
| `bt` | `M&&&` e.g., `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2) |
| `b` | `-I##` or `-I#####` | Count code for Backer AID List |
| 0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer 0 |
| 1th element | `BH8KSsFvoaOSgEbx-XCuDiSPCTq-qBBFDHkhf1_kmysr` | AID of backer 1 |
| 2th element | `BBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCuDiSPCTq-q` | AID of backer 2 |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List |
| 0th element | `XDND` | Config trait 0 `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List |
| 0th element | `-H##` or `-H#####` | Count code for field map of Seal 0 |
| 0.0th label | `0J_&` e.g., `0J_i` | Label of field 0 of Seal 0 `i`   |
| 0.0th value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
| 0.1th label | `0J_s` | Label of field 1 of Seal 0 `s`   |
| 0.1th value | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
| 0.2th label | `0J_d` | Label of field 2 of Seal 0 `d`   |
| 0.2th value | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
| 1th element | `-R##` or `-R#####` | Count code for value of Seal 1 (event seal triple) |
| 1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of Seal 1 (event seal triple) pre+snu+dig |

##### Rotation `rot`

Field order by label:  `v`, `t`, `d`, `i`, `s`, `p`, `kt`, `k`, `nt`, `n`, `bt`, `br`, `ba`, `c`, `a`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `rot` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAB` | Sequence Number of Event |
| `p` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | Prior event SAID |
| `kt` | `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1) |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List |
| 0th element | `DC08no2iWhgFYTaUgrasnqz6llSvWQTWZNN6WBhWqp6w` | Public Key of signer 0 |
| `nt` | `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List |
| 0th element | `EM2cc_3JgstRRjmzrrA_BibgDDOarj1lzr8pqG5a-SSn` | Digest of Public Key of rotator 0 |
| `bt` | `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2) |
| `br` | `-I##` or `-I#####` | Count code for Backer Remove (cuts) AID List |
| 0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer cut 0 |
| `ba` | `-I##` or `-I#####` | Count code for Backer Add (adds) AID List |
| 0th element | `BDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCu` | AID of backer add 0 |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List |
| 0th element | `XDND` | Config trait 0 `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List |
| 0th element | `-H##` or `-H#####` | Count code for field map of Seal 0 |
| 0.0th label | `0J_i` | Label of field 0 of Seal 0 `i`   |
| 0.0th value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
| 0.1th label | `0J_s` | Label of field 1 of Seal 0 `s`   |
| 0.1th value | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
| 0.2th label  | `0J_d` | Label of field 2 of Seal 0 `d`   |
| 0.2th value | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
| 1th element | `-R##` or `-R#####` | Count code for value of Seal 1 (event seal triple) |
| 1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl` | Value of Seal 1 (event seal triple) pre+snu+dig |

##### Interaction `ixn`

Field order by label:  `v`, `t`, `d`, `i`, `s`, `p`, `a`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `ixn` | Packet Type |
| `d` | `EGgbiglDXNE0GC4NQq-hiB5xhHKXBxkiojgBabiu_JCk` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAC` | Sequence Number of Event |
| `p` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | Prior event SAID |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List |
| 0th element | `-H##` or `-H#####`  | Count code for field map of Seal 0 |
| 0.0th label| `0J_i` | Label of field 0 of Seal 0 `i`   |
| 0.0th value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
| 0.1th label | `0J_s` | Label of field 1 of Seal 0 `s`   |
| 0.1th value | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
|  0.2th label  | `0J_d` |  Label of field 2 of Seal 0 `d`   |
|0.2th value | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
| 1th element | `-R##` or `-R#####` | Count code for value of Seal 1 (event seal triple) |
| 1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl` | Value of  Seal 1 (event seal triple) pre+snu+dig |


##### Delegated Inception `dip`

Field order by label:  `v`, `t`, `d`, `i` , `s`, `kt`, `k`, `nt`, `n`, `bt`, `b`, `c`, `a`, `di`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native  op-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `dip` | Packet Type |
| `d` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAA` | Sequence Number of Event |
| `kt` | `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1) |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List |
| 0th element | `DN6WBhWqp6wC08no2iWhgFYTaUgrasnqz6llSvWQTWZN` | Public Key of signer 0 |
| `nt` | `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List |
| 0th element | `EDDOarj1lzr8pqG5a-SSnM2cc_3JgstRRjmzrrA_Bibg` | Digest of Public Key of rotator 0 |
| `bt` | `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2) |
| `b` | `-I##` or `-I#####` | Count code for Backer AID List |
| 0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer 0 |
| 1th element | `BH8KSsFvoaOSgEbx-XCuDiSPCTq-qBBFDHkhf1_kmysr` | AID of backer 1 |
| 2th element | `BBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCuDiSPCTq-q` | AID of backer 2 |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List |
| 0th element | `XDND` | Config trait 0 `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List |
| 0th element | `-H##` or `-H#####` | Count code for field map of Seal 0 |
| 0.0th label | `0J_i` | Label of field 0 of Seal 0 `i`   |
| 0.0th value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID
| 0.1th label | `0J_s` | Label of field 1 of Seal 0 `s`   |
| 0.1th value | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
| 0.2th label | `0J_d` | Label of field 2 of Seal 0 `d`   |
| 0.2th value | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
| 1th element | `-R##` or `-R#####` | Count code for value of Seal 1 (event seal triple) |
| 1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of of Seal 1 (event seal triple) pre+snu+dig |
| `di` | `EFXNB5C4NQq-hiGgxhHKXBxkiojgabiu_JCkE0GbiglD` | AID of delegating controller |


##### Delegated Rotation `drt`

Field order by label:  `v`, `t`, `d`, `i`, `s`, `p`, `kt`, `k`, `nt`, `n`, `bt`, `br`, `ba`, `c`, `a`, `di`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `drt` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of event message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL |
| `s` | `MAAB` | Sequence Number of Event |
| `p` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | Prior event SAID |
| `kt` | `MAAB` | Signing Threshold, either number or fractional weight qb64 variable length string (1) |
| `k` | `-I##` or `-I#####` | Count code for Signing Key List |
| 0th element | `DC08no2iWhgFYTaUgrasnqz6llSvWQTWZNN6WBhWqp6w` | Public Key of signer 0 |
| `nt` | `MAAB` | Rotation Threshold, either number or fractional weight qb64 variable length string (1) |
| `n` | `-I##` or `-I#####` | Count code for Rotation Key Digest List |
| 0th element | `EM2cc_3JgstRRjmzrrA_BibgDDOarj1lzr8pqG5a-SSn` | Digest of Public Key of rotator 0 |
| `bt` | `MAAC` | Rotation Threshold, either number or fractional weight qb64 variable length string (2) |
| `br` | `-I##` or `-I#####` | Count code for Backer Remove (cuts) AID List |
| 0th element | `BCuDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-X` | AID of backer cut 0 |
| `ba` | `-I##` or `-I#####` | Count code for Backer Add (adds) AID List |
| 0th element | `BDiSPCTq-qBBFDHkhf1_kmysrH8KSsFvoaOSgEbx-XCu` | AID of backer add 0 |
| `c` | `-I##` or `-I#####` | Count code for Config Trait List |
| 0th element | `XDND` | Config trait 0 `DND` |
| `a` | `-I##` or `-I#####` | Count code for Anchored Seal List |
| 0th element | `-H##` or `-H#####` | Count code for field map of Seal 0 |
| 0.0th label | `0J_i` | Label of field 0 of Seal 0 `i`   |
| 0.0th value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field 0 of Seal 0 AID |
| 0.1th label | `0J_s` | Label of field 1 of Seal 0 `s`   |
| 0.1th value | `MAAC` | Value of field 1 of Seal 0 Sequence Number |
| 0.2th label | `0J_d` | Label of field 2 of Seal 0 `d`   |
| 0.2th value | `EiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5C4NQq-h` | Value of field 2 of Seal 0 SAID |
| 1th element | `-R##` or `-R#####` | Count code for value of Seal 1 (event seal triple) |
| 1.1th value | `EHKXBxkiojgBaC4NQq-hiGCkE0GbiglDXNB5gxhbiu_JMAADEBxkiojgiGgxhHKXBDXNB5C4NQq-habiu_JCkE0Gbigl`  | Value of of Seal 1 (event seal triple) pre+snu+dig |
| `di` | `EFXNB5C4NQq-hiGgxhHKXBxkiojgabiu_JCkE0GbiglD` | AID of delegating controller |

##### Receipt `rct`

Field order by label:  `v`, `t`, `d`, `i`, `s`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `rct` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of event message being receipted |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | AID of controller of event message KEL being receipted |
| `s` | `MAAB` | Sequence Number of event message being receipted |


#### KERI support Messages
These have the packet types `qry`, `rpy`, `pro`, `bar`, `exn`

#### Query Message

Field order by label:  `v`, `t`, `d`, `dt`, `r`, `rr`, `q`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `qry` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of message |
| `dt` | `1AAG2020-08-22T17c50c09d988921p00c00` | Base64 custom encoded 32 char ISO-8601 DateTime |
| `r` | `4AAC-A-1-B-3` | Base64 variable length CESR SAD Path string |
| `rr` | `5AABAA-A` | Base64 variable length CESR SAD Path string |
| `q` | `-H##` or `-H#####` | Count code for Query field map |
|  `i` label | `0J_i` | Label of field  `i` in `q` field map  |
| `i` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `i` in `q` field map |



#### Reply Message

Field order by label:  `v`, `t`, `d`, `dt`, `r`, `a`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `rpy` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of message |
| `dt` | `1AAG2020-08-22T17c50c09d988921p00c00` | Base64 custom encoded 32 char ISO-8601 DateTime |
| `r` | `4AAC-A-1-B-3` | Base64 variable length CESR SAD Path string |
| `a` | `-H##` or `-H#####` | Count code for Attribute field map |
| `d` label | `0J_d` | Label of field `d` in `a` field map   |
| `d` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `d` in `a` field map |



#### Prod Message

Field order by label:  `v`, `t`, `d`, `dt`, `r`, `rr`, `q`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `pro` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of message |
| `dt` | `1AAG2020-08-22T17c50c09d988921p00c00` | Base64 custom encoded 32 char ISO-8601 DateTime |
| `r` | `4AAC-A-1-B-3` | Base64 variable length CESR SAD Path string |
| `rr` | `5AABAA-A` | Base64 variable length CESR SAD Path string |
| `q` | `-H##` or `-H#####` | Count code for Query field map |
| `i` label | `0J_i` | Label of field  `i` in `q` field map  |
| `i` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `i` in `q` field map |



#### Bare Message

Field order by label:  `v`, `t`, `d`, `dt`, `r`, `a`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `bar` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of event message being receipted |
| `dt` | `1AAG2020-08-22T17c50c09d988921p00c00` | Base64 custom encoded 32 char ISO-8601 DateTime |
| `r` | `4AAC-A-1-B-3` | Base64 variable length CESR SAD Path string |
| `a` | `-H##` or `-H#####` | Count code for Attribute field map |
| `d` label | `0J_d` | Label of field `d` in `a` field map   |
| `d` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `d` in `a` field map |


#### Exchange Transaction Inception Message

Field order by label:  `v`, `t`, `d`, `i`, `dt`, `r`, `q`, `a`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `xip` | Packet Type |
| `d` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | SAID of message, transaction identifier SAID |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | Sender AID |
| `dt` | `1AAG2020-08-22T17c50c09d988921p00c00` | Base64 custom encoded 32 char ISO-8601 DateTime |
| `r` | `4AAC-A-1-B-3` | Base64 variable length CESR SAD Path string |
| `q` | `-H##` or `-H#####` | Count code for Query field map |
| `i` label | `0J_i` | Label of field  `i` in `q` field map  |
| `i` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `i` in `q` field map |
| `a` | `-H##` or `-H#####` | Count code for Attribute field map |
| `d` label | `0J_d` | Label of field `d` in `a` field map   |
| `d` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `d` in `a` field map |



#### Exchange Message

Field order by label:  `v`, `t`, `d`, `i`, `x`, `p`, `dt`, `r`, `q`, `a`.

| Field Label | Value | Description |
|:--------:|:-------|:------|
| NA | `-F##` or `-0F#####` | Count code for CESR native top-level fixed field signable message |
| `v` | `YKERIBAA` | Protocol Version primitive (KERI 2.00) |
| `t` | `exn` | Packet Type |
| `d` | `EBxkiojgBabiu_JCkE0GC4NQq-hiGgbiglDXNB5xhHKX` | SAID of message |
| `i` | `EBabiu_JCkE0GbiglDXNB5C4NQq-hiGgxhHKXBxkiojg` | Sender AID  |
| `x` | `EC4NQq-hiGgbiglDXNB5xhHKXBxkiojgBabiu_JCkE0G` | Transaction Identifier SAID |
| `p` | `EGbiglDXNB5C4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0` | Prior message SAID |
| `dt` | `1AAG2020-08-22T17c50c09d988921p00c00` | Base64 custom encoded 32 char ISO-8601 DateTime |
| `r` | `4AAC-A-1-B-3` | Base64 variable length CESR SAD Path string |
| `q` | `-H##` or `-H#####` | Count code for Query field map |
| `i` label | `0J_i` | Label of field  `i` in `q` field map  |
| `i` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `i` in `q` field map |
| `a` | `-H##` or `-H#####` | Count code for Attribute field map |
| `d` label | `0J_d` | Label of field `d` in `a` field map   |
| `d` value | `EC4NQq-hiGgxhHKXBxkiojgBabiu_JCkE0GbiglDXNB5` | Value of field `d` in `a` field map |



### Out-Of-Band-Introduction (OOBI)

An Out-Of-Band Introduction (OOBI) provides a discovery mechanism that associates a given URI or URL with a given AID or [[ref: SAID]]. The URI provided by an OOBI acts as a service endpoint for discovering verifiable information about the AID or SAID. As such, an OOBI itself is not trusted but must be verified. To clarify, any information obtained from the service endpoint provided in the OOBI must be verified by some other mechanism. An OOBI, however, enables any internet and web search infrastructure to act as an out-of-band infrastructure to discover verifiable information over an in-band mechanism or protocol. The primary in-band verification protocol is KERI. The OOBI protocol provides a web-based bootstrap and/or discovery mechanism for the KERI and the ACDC (Authentic Chained Data Container) protocols [[ref: ACDC]] [[ref: OOBI]]. Thus, the security (or, more correctly, the lack of security) of an OOBI is out-of-band with respect to a KERI AID or an ACDC that uses KERI. To clarify, everything in KERI or that depends on KERI is end-verifiable; therefore, it has no security dependency, nor does it rely on security guarantees that may or may not be provided by web or internet infrastructure.  OOBIs provide a bootstrap that enables what we call Percolated Information Discovery (PID) based on the academic concept called Invasion Percolation Theory [[27]] [[28]] [[25]] [[26]]. This bootstrap may then be parlayed into a secure mechanism for accepting and updating data. The principal data acceptance and update policy is denoted BADA (Best-Available-Data-Acceptance).

Vacuous discovery of IP resources such as service endpoints associated with a KERI AID or SAID requires an OOBI to associate a given URL with a given AID or SAID [[ref: SAID]] [[ref: OOBI]] [[29]]. The principal reason for this requirement is that KERI AIDs are derived in a completely decentralized manner. The root-of-trust of a KERI AID is completely independent of the Internet and DNS addressing infrastructure. Thus, an IP address or URL could be considered a type of Out-Of-Band Infrastructure (OOBI) for KERI.  In this context, an introduction is an association between a KERI AID and a URL that may include either an explicit IP address or a DNS name for its host [[spec: RFC3986]] [[29]]. We call this a KERI OOBI and is a special case of OOBI) with a shared acronym. For the sake of clarity, unless otherwise qualified, OOBI is used to mean this special case of an 'introduction' and not the general case of 'infrastructure'.

Moreover, because IP infrastructure is not trusted by KERI, a KERI OOBI by itself is considered insecure with respect to KERI, and any OOBI must, therefore, be later verified using a KERI BADA mechanism. The principal use case for an OOBI is to jump-start or bootstrap the discovery of a service endpoint for a given AID. To reiterate, the OOBI by itself is not sufficient for discovery because the OOBI itself is insecure. The OOBI merely jump-starts or bootstraps the authenticated discovery.

OOBIs enable a KERI implementation to leverage existing IP and DNS infrastructure to introduce KERI AIDs and discover service endpoints, which may then be securely attributed. KERI does not, therefore, need its own dedicated discovery network; OOBIs with URLs will do.

A secondary use case for OOBIs is to provide service endpoints or URIs for SAD (items identifier by their SAID). A SAID is a content address derived from a cryptographic digest of the serialization of a data item. The SAID protocol [[1]] provides a derivation process where the SAID is actually included in the SAD. This makes a SAID self-referential. Verification of a SAD resource obtained by querying a URI that includes the SAD's SAID is accomplished by simply re-deriving the SAID of the SAD in the reply and comparing it to the SAID in the URI. The `sad` URI scheme may be simply expressed as `sad:said` where `said` is replaced with the actual SAID of the referenced SAD item. The media type of the returned SAD is determined by its CESR-compatible serialization type, such as JSON, CBOR, MGPK, or native CESR, for example.

#### Basic OOBI

The simplest form of a KERI OOBI may be expressed by any of a namespaced string, a tuple, a mapping, a structured message, or a structured attachment where every form contains both a KERI AID and a URL (or URI). The OOBI associates the URL with the AID. By convention, the URL typically includes the word `oobi` in its path to indicate that it is to be used as an OOBI, but this is not required. In abstract tuple form, an OOBI is as follows:

~~~python
(url, aid)
~~~

In concrete tuple form, an OOBI is as follows:

~~~python
("http://8.8.5.6:8080/oobi", "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM")
~~~

An OOBI itself is not signed or otherwise authenticatable by KERI but may employ some other Out-Of-Band-Authentication (OOBA) mechanism, i.e., non-KERI.

The OOBI is intentionally simplistic to enable very low byte count introductions such as a may be conveyed by a QR code or Data matrix [[29]] [[30]].


#### OOBI URL (IURL)

URLs provide a namespace, which means that the mapping between URL and AID can be combined into one namespaced URL where the AID is in the path component and any other hints, such as roles or names, are in the query component of the URL. This would be a type of self-describing OOBI URL.

For example, suppose the AID is

~~~python
EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM
~~~

This may be included as a path component of the URL, such as,

~~~python
http://8.8.5.6:8080/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM
~~~

This is called an OOBI URL, or IURL for short. All that is needed to bootstrap the discovery of a KERI AID is an IURL. KERI can leverage the full IP/DNS infrastructure as a discovery bootstrap of an AID by providing an associated IURL.

The AID may act in any of the KERI roles such as `watcher`, `witness`, `juror`, `judge` or `registrar` but is usually a `controller`. In the latter case, the IURL may be a service endpoint provided by one of the supporting components for a given controller. Thus, the AID in an OOBI may be either a controller ID, CID or an endpoint provider ID, EID. The resource at that URL in the OOBI is ultimately responsible for providing that detail, but an OOBI as a URL may contain hints in the query string for the URL, such as a `role` or `name` designation.

~~~python
http://8.8.5.6:8080/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM?role=watcher&name=eve

https://example.com/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM?role=witness
~~~

When the role is provided in the IURL, the EID of the endpoint provider for that role would be discovered via the proof returned by querying the URL. In addition, The proof returned may indicate a different URL for that role so a self-describing IURL may act also as a forwarding mechanism.

To clarify, the minimum information in an OOBI is the pair, `(URL, AID)`. The compact representation of an OOBI leverages the namespacing of the URL itself to provide the AID. Furthermore, the query string in the URL namespace may contain other information or hints, such as the role of the service endpoint represented by the URL or a user-friendly name.


#### Well-Known OOBI

An OOBI may be returned as the result of a ‘GET’ request to an [[spec: RFC5785]] well-known URL.

For example,

~~~python
 /.well-known/keri/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM
~~~

Where:

 `EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM` is the AID
and the result of the request is either target URL or a redirection to the target URL where the target URL can be

~~~python
https://example.com/witness/witmer

http://8.8.5.5:8080/witness/witmer

http://10.0.5.15:8088/witness/witmer
~~~

The resultant target URL may be in a different domain or IP address from the `well-known` resource.


#### CID and EID

A more verbose version would also include the endpoint role and the AID (EID) of the endpoint provider in a self-describing OOBI URL.

For example,

~~~python
https://example.com/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM/witness/BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE

http://8.8.5.6/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM/witness/BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE
~~~


Where:
`EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM` is the AID (CID) of the controller and `BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE` is the AID (EID) of the controller's endpoint provider acting in the role of `witness`.


#### Multi-OOBI (MOOBI)

An OOBI may include a list of URLs thus simultaneously making an introductory association between the AID and multiple URLs. This would be a multi-OOBI (MOOBI). In general, a MOOBI is a special case of an OOBI without making a named distinction. The first KERI reply message below is an example of a MOOBI.

#### KERI Reply Messages as OOBIs

A more verbose expression for an OOBI would be an unsigned KERI reply message, `rpy`. The route, `r` field in the message starts with `/oobi`. This specifies that it is an OOBI, so the recipient knows to apply OOBI processing logic to the message. A list of URLs may be provided so that one reply message may provide multiple introductions.

::: note 
  Examples in this section are not cryptographically verifiable
:::

For example,

~~~json
{
  "v": "KERI10JSON00011c_",
  "t":  "rpy",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r": "/oobi/witness",
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

A service endpoint location reply message could also be re-purposed as an OOBI by using a special route path that starts with `/oobi` but also includes the AID being introduced and, optionally, the role of the service endpoint provider. This approach effectively combines the information from both the `/end/role` and `/loc/scheme`reply messages into one. This may allow a shortcut to authenticate the service endpoint. This is shown below.

~~~json
{
  "v": "KERI10JSON00011c_",
  "t": "rpy",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r": "/oobi/EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM/watcher",
  "a":
  {
    "eid": "BrHLayDN-mXKv62DAjFLX1_Y5yEUe0vA9YPe_ihiKYHE",
    "scheme": "http",
    "url":  "http://example.com/watcher/wilma"
  }
}
~~~

#### Self (Blind) OOBI (SOOBI)

A bare URL but no AID may be used as a self (blind) OOBI for blind or self-introductions e.g., SOOBI. Querying that SOOBI may return or result in a default target OOBI or default target endpoint reply. This provides a mechanism for self-introduction or blind i.e., self OOBI (SOOBI). Consider the examples of self-OOBIs below.

~~~python
http://8.8.5.7:8080/oobi

http://localhost:8080/oobi

http://8.8.5.7:8080/oobi?role=controller&name=eve

http://localhost:8080/oobi?role=controller&name=eve
~~~


To elaborate, by default, the result of a `GET` request to a self OOBI URL could be another OOBI with an AID that is the `self` AID of the node providing the self OOBI endpoint or the actual authenticatable `self` endpoint with its AID or a default set of authenticatable endpoints. This is useful to bootstrap components in an infrastructure where the target URLs do not use a public DNS address but instead use something more secure like an explicit public IP address or a private IP or private DNS address. A self-introduction provides a bootstrap mechanism similar to a hostname configuration file with the exception that in the OOBI case, the AID is not in the configuration file, just the bare URL, and the given node queries that bare URL (SOOBI) to get the target endpoint AID.  This allows bootstrap using bare IP addresses in systems where the IP infrastructure is more securely managed than public DNS or where some other OOBA mechanism is used in concert.

To clarify, because a bare URL, acting as a SOOBI, does not expose an AID, the resultant response when querying the OOBI may depend on other factors such as the source IP of the querier (requester) and/or another OOBA mechanism. This supports the private bootstrap of infrastructure. Of course, one could argue that this is just kicking the can down the road, but IP addresses are correlatable, and a self OOBI can leverage IP infrastructure for discovery when used in combination with some other OOBA mechanism without unnecessary correlation.

For example, a given indirect mode controller is identified by its AID (CID). The controller must also create witness hosts with endpoints. This means first spinning up witness host nodes and creating witness AIDs (WIDs) for those nodes. Given that these WIDs must be eventually designated in the KEL for the CID, the controller of the CID can confirm using its KEL that the signed endpoint reply provided by a SOOBI request is indeed signed by the corresponding private keys for a WID designated in its KEL. This means that the only place that the WID must appear is in the KEL and not in all the config files used to bootstrap communications between the CID host and its designated WID hosts. Just SOOBIs will do. Whereas regular OOBIs with redundant configuration information may be a vector for a type of DDOS attack where corrupted, inconsistent, redundant configuration information results in a failure to boot a system. Redundancy for security is best applied in the context of a self-healing or resilient threshold structure that explicitly manages the redundancy as a security mechanism instead of as un-managed inadvertent redundancy.

#### OOBI Forwarding

In every case, an OOBI may result in proof for a different URL than that provided in the OOBI itself. It allows OOBI forwarding so that introductions produced as hard copies, such as QR codes, do not necessarily become stale. The recipient of the OOBI may choose to accept that proof or not. Ultimately, the recipient only treats URLs as valid endpoints when they are fully KERI authenticated. Given that an OOBI result is always KERI authenticated before use in a given role, the worst case from a security perspective is that an OOBI may be part of a DDOS attack but not as part of a service endpoint cache poison attack.


#### OOBI with MFA

An OOBI may be augmented with one or more OOBAs to minimize the likelihood of a DDOS OOBI attack. A given recipient may require as a precondition to accepting an OOBI one or more OOBA mechanisms, such as text messages, emails, etc., that provide some degree of non-KERI-based security to the OOBI. Thus, an OOBI could employ out-of-band (with respect to KERI) multi-factor authentication (MFA) to preclude any OOBI-based DDOS attacks on KERI.


#### SPED (Speedy Percolated Endpoint Discovery)

All the information needed to discover and verify is bootstrapped from the OOBI. Subsequent authorization is non-interactive, thus making it highly scalable. BADA-RUN authorization is also lightweight for the host because the only memory requirements are a sequence number, date-time stamp window, and nullification state. This provides what we call zero-trust percolated discovery or speedy percolated endpoint discovery (SPED) [[25]][[26]][[27]][[28]]. Percolation means that each discoverer, in turn, may share what it discovers with any subsequent discoverers. Because the information so discovered is end-verifiable, the percolation mechanism does not need to be trusted. Percolating intermediaries do not need to be trusted.

#### JIT/NTK Discovery

With percolated discovery, discovery mechanisms can be made very efficient because they can be optimized for any given exchange of verifiable data that requires discovery. This is called just-in-time/need-to-know JIT/NTK discovery. Each Exchanger of verifiable data must have already verified the data before exchanging it with the Exchangee. Therefore, all the information needed to verify (proofs) must have already been available to the Exchanger, i.e., need-to-know. The Exchanger can then percolate that verification information to the Exchangee at the time of exchange, i.e,, just-in-time. This avoids the need to have a dedicated global infrastructure for the discovery of verifiable data and the associated proofs.

#### Summary

The main value of an OOBI is that it is compact and is not encumbered by authentication proofs but may be used to kick-start the process of authentication (proving).

One way to pre-configure a vacuous KERI installation is to provide OOBIs or SOOBIs in a configuration file. The bootstrap process of the installation then queries the associated URLs to retrieve the KERI authentication proofs (BADA) that are then used to populate its database securely. This simplifies the configuration file.

An alternative would be to populate the configuration file with the KERI authentication proofs. But these proofs may be quite verbose and cumbersome and may make the config file somewhat difficult to manage in human-readable/writable form. Furthermore, if one already had the proofs, one could just pre-populate the database with those proofs. Therefore OOBI, OOBI-based configuration files may be advantageous as either easier to manage or as a viable option when the proofs are not yet available at configuration time.

Furthermore, a clean clone replay restart of a given KERI component is designed to fix any unverified corruption of its associated KELs.  If each component uses OOBIs to retrieve the authentication proofs from other components, then all the components will have clean proofs instead of stale proofs.


### BADA (Best-Available-Data-Acceptance) Policy

The recipient of an OOBI verifies the OOBI by authenticating the endpoint URL given by the OOBI with respect to an authorization signed by the controller of the AID given by the OOBI. This authorization follows the BADA policy. The BADA policy guarantees the monotonicity of updates to authentically signed data at rest. This follows best practices for zero-trust computing infrastructure for authentic data. The authorization is usually obtained as a resource in reply to a query to the OOBI URL. Specifically, the service endpoint at the URL responds with a resource that contains the supporting reply messages that are KERI authenticatable.

#### Security Issues

KERI follows a "zero-trust" security model for authentic or securely attributable data. That means that data is signed both in motion and at rest. The primary attack against signed data is a replay attack. In a replay attack, an adversary obtains a copy of data with a verifiable signature and then replays it later. Without some other information, it is difficult for a host to detect that it is indeed a replay or malicious reuse of signed data and not the original use of that data.

To elaborate, there are two primary types of attacks on authentic or authenticatable data-at-rest. The first is a replay attack. The second is a deletion attack. In a replay attack, an adversary keeps a copy of an authentic message or data together with its verifiable signature that has already been created and used by the controller of a KERI AID and then sometime later replays that same message with the signature. A verifier may thereby be fooled into believing that the replay is actually a new message and not a stale message. There are both interactive and non-interactive mitigations to replay attacks. Interactive mitigations use some type of nonce or [[ref: salt]] exchanged between Updater and Updatee. The nonce exchange introduces latency, scalability, and synchronization limitations. Non-interactive mitigations require a monotonic ordering mechanism. Typically, monotonic ordering is based on logic rooted in a sequence number or date-time stamp. Because non-interactive mitigations are asynchronous, however, they do not have the latency and scalability limitations of interactive mitigations and are therefore preferred.

The KEL of a KERI AID provides such a monotonic ordering mechanism as it employs both a sequence number and digest chaining. For authentic data directly anchored to or determined by a KEL, the relative KEL location determines the monotonic order. This ordering determination includes TELs , which themselves are monotonically ordered with respect to anchoring seals in the associated KEL [[ref: ACDC]].  For authentic data not directly anchored or included in a KEL, the relative key state (which is determined by the KEL) may be used in combination with a date-time stamp to ensure monotonic ordering. Finally, for any AID whose key state is fixed, a date-time stamp may be used with appropriate update logic to ensure monotonic ordering. The logic that ensures monotonic ordering is called BADA and is described later in this section.

A deletion attack is related to a replay attack. Once erased or deleted, a verifier may not be able to detect a replay attack of the deleted data because it has lost a record of the prior play to compare against. To elaborate, once erased, any stale authenticated data acting as authorization may be replayed without detection. This exposes a problem with the GPDR (General Data Protection Regulation) right-to-erasure, which, if naively implemented as total erasure, exposes the data controller to a replay attack of erased data.

The primary mitigation mechanism for deletion attacks is maintaining redundant copies of the signed authentic data. As long as one of the redundant copies has not been deleted, then a comparison between the hosts of the redundant copies will expose the deletion attack. The monotonicity of the data is preserved in each copy. The hosts need merely compare copies. Only the current data item needs to be kept in full in order to support the use of that data.  For protection against replay attacks using stale data, only copies of the digest or signature of the data must be kept. To reiterate, a replay attack can be detected by comparing the digest or signature (which is a type of digest) of any undeleted copy with the presented data.

To summarize, authentic data at rest consists of the data item and signature(s). The two primary attacks are replay and deletion. Replay attack mitigation relies on replay monotonicity in data updates. Deletion attack mitigation relies on the redundancy of monotonic data.

#### BADA Rules

The BADA rules apply to any data item stored in a database record whose value is used for some defined purpose. Updates are sourced from the controller of an associated KERI AID. The primary purpose of BADA policy is to enforce monotonicity of the updates with respect to the key state of that associated AID. This primarily protects against replay attacks on the database record. For example, a rollback to an earlier value via replay of an earlier update. An Update or change to the database record is ‘accepted’ when it follows the BADA rules (policy) for acceptance. The BADA rules ensure the monotonicity of all updates.

There are two different mechanisms for the controller of an AID to authorize updates to a given database record. The first is by referencing the update in the KEL of the authorizing AID. All entries in a KEL must be signed by the current signing keypair(s) given by the Key-state for that KEL. The second is by signing a date-time stamped update. In this case, the update either includes a reference to the Key-state in the authorizing AID's KEL from which the signing keypair(s) needed to verify the signature is obtained or the AID is ephemeral with a fixed Key-state (has a non-transferable derivation code). The rules differ for each of the two mechanisms.

#### KEL Anchored Updates

In this case, the update to a record is included in or anchored via a seal to the AID’s Key-state in its KEL. In either case, the update is referenced in an event in the KEL of the AID. By virtue of the reference, the Controller of that KEL's AID is authorizing that Update. The record may have a Prior value that is being updated or the Update serves to create the initial value of the record. Prior means the prior record.

~~~
Rules for the acceptance of the Update:  (in order of priority)
  Confirm Update is anchored or included in AID's KEL.

  WHEN Update is anchored in AID's KEL AND...
    IF no Prior THEN accept. (always)
    IF Prior AND...
  The Update’s anchor appears later in KEL than the Prior’s anchor THEN accept.
  Otherwise, do not accept.
~~~

#### Signed (Not Anchored) Updates

In this case, the update to a record is signed by the controller of the AID, but the update itself is NOT included in or anchored to the AID’s KEL. The record may have a Prior value that is being updated or the update serves to create the initial value of the record. In this context, Prior means the Prior record. All date times are relative to the controller's date time, NOT the database host's date time.

There are two cases. These are as follows.

1. Ephemeral AID whose Key-state is fixed (no KEL needed)
2. Persistent AID whose Key-state is provided by a KEL

~~~
Rules for the acceptance of the Update: (in order of priority)

Confirm signature on the Update verifies against indicated key-state under which signature was made.

  WHEN signature verifies AND...
    IF no Prior THEN accept (always).
    IF Prior THEN ...
    Compare the Update’s verified signature key-state against the Prior's verified signature key-state.
      IF the Update’s key-state appears later in KEL than the Prior's key-state THEN accept.
      IF both the Update’s and the Prior's key-states appear at the same location in KEL AND...
        the Update’s date-time is later than the Prior's date-time THEN accept.
  Otherwise, do not accept.
~~~

#### RUN off the CRUD

In the conventional client-server database architecture, the database server is responsible for creating records on behalf of clients and assigning unique identifiers for each record. The server returns to the client the unique record identifier when it creates a record. The server is the source of truth.  But in a zero-trust (end-verifiable) decentralized peer-to-peer architecture, there is no client/server. Every host is a Peer. Each Peer is the source of truth for its own data. Therefore, each Peer is responsible for managing its own records. Each Peer must be able to create unique identifiers for its own data. This inverts the architecture because each Peer creates a unique identifier for each of its own data items and sends that identifier with the data item to the other Peers. Each Peer stores data on behalf of the other Peers. This inverted architecture enables consistent, authentic data update policies that work asynchronously across multiple Peers and are replay and deletion attack-resistant. Each Peer has an end-verifiable (via signature) monotonically updated view of the data records sourced from the other Peers.

The acronym for the traditional client-server database update policy is CRUD (Create, Read, Update, Delete). The acronym for this new peer-to-peer end-verifiable monotonic update policy is RUN (Read, Update, Nullify). As described above, because the source of truth for each data item is a decentralized controller Peer, a given database hosted by any Peer does not Create records in the traditional sense of a server creating records for a client. The hosting Peer merely stores a copy of an Update to records sent out by the source Peer (controller). Thus, there is no Create action, only an Update action. When a Peer has not yet seen any version of a record, then its copy is vacuous and is replaced by the first Update it sees.  To clarify, a source Peer Updates other Peers by sending out the latest copy or version of its own record. The original copy or version is always created by the source Peer not the data hosting destination Peer or destination Peer for short.

In order to ensure that the destination Peers are resistant to replay and deletion attacks, destination Peers apply non-interactive monotonic update logic to any Updates they receive from the source Peer. This means that a destination Peer must not ever delete a record storing the latest version of an Update. Thus, there is no Delete. Instead of Delete, Peers Nullify. A Nullify is a special type of Update that indicates that the data in the record is no longer valid but, importantly, without actually erasing or Deleting the record that includes a reference to the latest monotonic determining anchor and/or date-time. There are two ways to indicate Nullification. The first is to assign a `null` value to the record. This works for single-field records. The second is to attach an associated Boolean logic flag field that indicates the record has been Nullified. This works for multi-field records.


#### OOBI KERI Endpoint Authorization (OKEA)

An important use case for BADA-RUN is to process OOBIs that provide service endpoint discovery of the AIDS of KERI components. These components include but are not limited to, Controllers, Agents, Backers (Witness or Registrar), Watchers, Jurors, Judges, and Forwarders. An endpoint is a URL that may include an IP Scheme, Host, Port, and Path. The model for securely managing endpoint data starts with a Principal Controller of an AID. A Principal Controller authorizes some other component to act as a Player in a Role. Typically, a Role serves some function needed by the Principal Controller to support its AID and may be reached at a service endpoint URL for that Role. Each component, in turn, is the Controller of its own AID. Each component AID is a Player that may provide or act in a Role on behalf of the Principal Controller by providing services at the associated service endpoint for its associated Role.

The authorization model uses a zero-trust BADA-RUN policy to Update authorizations. A Principal Controller authorizes a Player by signing a Role authorization message that authorizes the Player's AID to act in a role. A Player authorizes its endpoint URL by signing an endpoint authorization message that authorizes a URL (location) with a scheme. Any Peer may keep an updated copy of the latest service endpoint URL(s) provided by a Player in a Role for a given Principal AID by following the BADA-RUN policy on Updates sent to its database of these authorizations. The authorizations are issued in the context of the KERI Key-state for the Principal and Player AIDs.

Some components (Players in Roles) are implicitly authorized by the Principal Controller by being explicitly designated in the KEL of the Principal, i.e., there is no explicit authorization message of the Player/Role. The authorization is implied by the KEL entry. For example, a Backer designation of a Witness or Registrar AID implicitly authorizes that AID to act as a Player in the Role of Witness or Registrar. An associated explicit endpoint authorization message signed by that Witness or Backer is still needed to provide the URL (location and scheme) of the actual service endpoint for that Player.

The combination of KERI and the BADA-RUN policy enables any Controller to manage data in a zero-trust architecture at the database level. Any Controller may promulgate verifiably authentic information with replay and deletion attack resistance. The authentic information may be simply source data or instead authorizations to enable some other function. The hard work of determining the associated Key-state is provided by KERI. KERI makes the establishment of authenticity straightforward. The BADA-RUN policy protects against replay and deletion attacks given authentic data.

This approach follows the many thin layers approach of the Hourglass protocol model.  BADA-RUN is a thin layer on top of KERI authenticity. OOBIs are a thin discovery layer that sits on top of a thin authorization layer (leveraging reply messages and BADA-RUN logic) on top of KERI.

This also follows the design ethos of KERI of minimally sufficient means. OOBIs leverage the existing Internet discovery mechanisms but without needing to trust the Internet security model (or the lack of one). End-verifiability in KERI provides safety to any OOBI discovery. The Internet's discovery mechanism, DNS/CA, is out-of-band with respect to KERI security guarantees. Thus, OOBIs may safely use DNS/CA, web search engines, social media, email, and messaging as discovery mechanisms. The worst case is the OOBI fails to result in a successful discovery and some other OOBI must be used.

Typically, the query of a ReST endpoint given by the OOBI URL could return as proof any associated authorizing reply message(s) as well as any associated KELs.

#### Authorized Endpoint Disclosure Example

This section provides an example of using OKEA (OOBI KERI Endpoint Authorization) with BADA-RUN for endpoint disclosure.

The KERI protocol defines a generic `reply` message for updating information using the BADA-RUN policy. Each `reply` message includes a route, `r`, field that indicates both the payload type and the handler that should process the message. The route, `r`, field value is a slash, `/` delimited pathname string.  The Principal Controller AID is indicated by the CID (Controller ID) or `cid` field. The endpoint component Player is indicated the EID (Endpoint Controller ID) or `eid` field. There are two different authorization cases. In one case, a CID authorizes an EID in a Role. In the other case, an EID authorizes a Loc (URL location) for a scheme. There are two routes for each type of authorization. One route Updates the authorization and the other Nullifies the authorization. These are summarized as follows,

* Datetime stamped BADA authorization Reply message by CID of EID in Role (Update)
* Datetime stamped BADA deauthorization by CID of EID in Role (Nullify)
* Datetime stamped BADA authorization by EID of URL for scheme (Update).
* Datetime stamped BADA deauthorization by EID of URL for scheme (Nullify)

A party interested in discovering the service endpoint for a given Controller AID initiates the discovery by providing an OOBI. A successful discovery will result in the return of signed `reply` messages that provide verifiable proof that the service endpoint (either directly provided in the OOBI, or indirectly provided via forwarding) is an authorized endpoint for that AID.

To summarize, upon acceptance of an OOBI the recipient queries the provided URL for proof that the URL is an authorized endpoint for the given AID. The proof format may depend on the actual role of the endpoint. A current witness for an AID is designated in the current key state's latest establishment event in the AID's KEL. Therefore, merely replying with the Key State or KEL may serve as proof for a witness introduced by an OOBI. The actual URL may be authorized by an attendant signed `/loc/scheme` reply message with the URL.

Other roles that are not explicitly part of Key-state (i.e., are not designated in KEL establishment events) must be authorized by explicit signed reply messages. Typically, these will be a signed `/end/role/` reply message. The actual URL may be authorized by an attendant signed `/loc/scheme` reply message with the URL.

::: note 
  Examples in this section are not cryptographically verifiable
:::

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

[//]: # (\newpage)

[//]: # (\makebibliography)

[//]: # (# Bibliography)