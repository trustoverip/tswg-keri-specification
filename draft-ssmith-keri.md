---

title: "Key Event Receipt Infrastructure (KERI)"
abbrev: "KERI"
docname: draft-ssmith-keri-latest
category: info

ipr: trust200902
area: TODO
workgroup: TODO Working Group
keyword: Internet-Draft

stand_alone: yes
smart_quotes: no
pi: [toc, sortrefs, symrefs]

author:
 -
    name: S. Smith
    organization: ProSapien LLC
    email: sam@prosapien.com

normative:

  KERI-ID:
    target: https://github.com/WebOfTrust/ietf-keri
    title: IETF KERI (Key Event Receipt Infrastructure) Internet Draft
    date: 2022
    author:
      ins: S. Smith
      name: Samuel M. Smith
      org: ProSapien LLC

  CESR-ID:
    target: https://github.com/WebOfTrust/ietf-cesr
    title: IETF CESR (Composable Event Streaming Representation) Internet Draft
    date: 2022
    author:
      ins: S. Smith
      name: Samuel M. Smith
      org: ProSapien LLC

  SAID-ID:
    target: https://github.com/WebOfTrust/ietf-said
    title: IETF SAID (Self-Addressing IDentifier) Internet Draft
    date: 2022
    author:
      ins: S. Smith
      name: Samuel M. Smith
      org: ProSapien LLC
    date: 2022

  OOBI-ID:
    target: https://github.com/WebOfTrust/ietf-oobi
    title: IETF OOBI (Out-Of-Band-Introduction) Internet Draft
    author:
      ins: S. Smith
      name: Samuel M. Smith
      org: ProSapien LLC
    date: 2022

  DIDK-ID:
    target: https://github.com/WebOfTrust/ietf-did-keri
    title: IETF DID-KERI Internet Draft
    author:
      ins: P. Feairheller
      name: Phil Feairheller
      org: GLEIF

  RFC8259: JSON

  JSOND:
    target: https://www.json.org/json-en.html
    title: JavaScript Object Notation Delimiters

  RFC8949: CBOR

  CBORC:
    target: https://en.wikipedia.org/wiki/CBOR
    title: CBOR Mapping Object Codes

  MGPK:
    target: https://github.com/msgpack/msgpack/blob/master/spec.md
    title: Msgpack Mapping Object Codes


informative:

  KERI:
    target: https://arxiv.org/abs/1907.02143
    title: Key Event Receipt Infrastructure (KERI)
    date: 2021
    author:
      ins: S. Smith
      name: Samuel M. Smith
      org: ProSapien LLC

  UIT:
    target: https://github.com/SmithSamuelM/Papers/blob/master/whitepapers/IdentifierTheory_web.pdf
    title: Universay Identifier Theory
    seriesinfo: WhitePaper
    date: 2020
    author:
      ins: S. Smith
      name: Samuel M. Smith

  DAD:
    target: https://github.com/SmithSamuelM/Papers/blob/master/whitepapers/DecentralizedAutonomicData.pdf
    title: "Decentralized Autonomic Data (DAD) and the three R's of Key Management"
    seriesinfo: WhitePaper
    date: 2018
    author:
      ins: S. Smith
      name: Samuel M. Smith

  IDSys:
    target: https://github.com/SmithSamuelM/Papers/blob/master/whitepapers/Identity-System-Essentials.pdf
    title: Identity System Essentials
    seriesinfo: WhitePaper
    date: 2016
    author:
      -
        ins: S. Smith
        name: Samuel M. Smith
      -
        ins: D. Khovratovich
        name: Dmitry Khovratovich

  RFC4648: Base64

  RFC0020: ASCII

  RFC3986: URI

  RFC8820: URIDesign

  RFC4627: JSONMIME

  JSch:
    target: https://json-schema.org
    title: JSON Schema

  JSch_202012:
    target: https://json-schema.org/draft/2020-12/release-notes.html
    title: "JSON Schema 2020-12"

  RFC6901: JSONPTR

  HCR:
    target: https://en.wikipedia.org/wiki/Collision_resistance
    title: Hash Collision Resistance

  ITPS:
    target: https://en.wikipedia.org/wiki/Information-theoretic_security
    title: Information-Theoretic and Perfect Security

  OTP:
    target: https://en.wikipedia.org/wiki/One-time_pad
    title: One-Time-Pad

  VCphr:
    target: https://www.ciphermachinesandcryptology.com/en/onetimepad.htm
    title: Vernom Cipher (OTP)

  SSplt:
    target: https://www.ciphermachinesandcryptology.com/en/secretsplitting.htm
    title: Secret Splitting

  SShr:
    target: https://en.wikipedia.org/wiki/Secret_sharing
    title: Secret Sharing

  CSPRNG:
    target: https://en.wikipedia.org/wiki/Cryptographically-secure_pseudorandom_number_generator
    title: Cryptographically-secure pseudorandom number generator (CSPRNG)

  IThry:
    target: https://en.wikipedia.org/wiki/Information_theory
    title: Information Theory

  BLAKE3:
    target: ttps://github.com/BLAKE3-team/BLAKE3
    title: BLAKE3

  BLAKE3Spec:
    target: https://github.com/BLAKE3-team/BLAKE3-specs/blob/master/blake3.pdf
    title: BLAKE3 one function, fast everywhere

  BLAKE3Hash:
    target: https://www.infoq.com/news/2020/01/blake3-fast-crypto-hash/
    title: “BLAKE3 Is an Extremely Fast, Parallel Cryptographic Hash”
    seriesinfo: InfoQ
    date: 2020-01-12

  QCHC:
    target: https://cr.yp.to/hash/collisioncost-20090823.pdf
    title: "Cost analysis of hash collisions: Will quantum computers make SHARCS obsolete?"

  TMCrypto:
    target: https://eprint.iacr.org/2019/1492.pdf
    title: “Too Much Crypto”
    date: 2021-05-24
    author:
        ins: J. Aumasson
        name: Jean-Philippe Aumasson

  EdSC:
    target: https://eprint.iacr.org/2020/823
    title: "The Provable Security of Ed25519: Theory and Practice Report"

  PSEd:
    target: https://ieeexplore.ieee.org/document/9519456?denied=
    title: "The Provable Security of Ed25519: Theory and Practice"
    seriesinfo: "2021 IEEE Symposium on Security and Privacy (SP)"
    date: 2021-05-24
    author:
      -
        ins: J. Brendel
        name: Jacqueline Brendel
      -
        ins: C. Cremers
        name: Cas Cremers
      -
        ins: D. Jackson
        name: Dennis Jackson
      -
        ins: M. Zhao
        name: Mang Zhao

  TMEd:
    target: https://eprint.iacr.org/2020/1244.pdf
    title: Taming the many EdDSAs

  Salt:
    target: https://medium.com/@fridakahsas/salt-nonces-and-ivs-whats-the-difference-d7a44724a447
    title: Salts, Nonces, and Initial Values

  Stretch:
    target: https://en.wikipedia.org/wiki/Key_stretching
    title: Key stretching

  HDKC:
    target: https://github.com/WebOfTrustInfo/rwot1-sf/blob/master/topics-and-advance-readings/hierarchical-deterministic-keys--bip32-and-beyond.md
    title: "Hierarchical Deterministic Keys: BIP32 & Beyond"
    author:
      -
        ins: C. Allen
        name: Christopher Allen
      -
        ins: S. Applecline
        name: Shannon Applecline

  OWF:
    target: https://en.wikipedia.org/wiki/One-way_function
    title: One-way_function

  COWF:
    target: http://www.crypto-it.net/eng/theory/one-way-function.html
    title: One-way Function
    seriesinfo: Crypto-IT

  RB:
    target: https://en.wikipedia.org/wiki/Rainbow_table
    title: Rainbow Table

  DRB:
    target: https://www.commonlounge.com/discussion/2ee3f431a19e4deabe4aa30b43710aa7
    title: Dictionary Attacks, Rainbow Table Attacks and how Password Salting defends against them

  BDay:
    target: https://en.wikipedia.org/wiki/Birthday_attack
    title: Birthday Attack

  BDC:
    target: https://auth0.com/blog/birthday-attacks-collisions-and-password-strength/
    title: Birthday Attacks, Collisions, And Password Strength

  DHKE:
    target: https://www.infoworld.com/article/3647751/understand-diffie-hellman-key-exchange.html
    title: "Diffie-Hellman Key Exchange"

  KeyEx:
    target: https://libsodium.gitbook.io/doc/key_exchange
    title: Key Exchange

  Hash:
    target: https://en.wikipedia.org/wiki/Cryptographic_hash_function
    title: Cryptographic Hash Function

  W3C_DID:
    target: https://w3c-ccg.github.io/did-spec/
    title: "W3C Decentralized Identifiers (DIDs) v1.0"

  PKI:
    target: https://en.wikipedia.org/wiki/Public-key_cryptography
    title: Public-key Cryptography

  SCPK:
    target: https://link.springer.com/content/pdf/10.1007%2F3-540-46416-6_42.pdf
    title: Self-certified public keys
    seriesinfo: "EUROCRYPT 1991: Advances in Cryptology, pp. 490-497, 1991"
    author:
      ins: M. Girault
      name: Marc Girault

  SCURL:
    target: https://pdos.csail.mit.edu/~kaminsky/sfs-http.ps
    title: "SFS-HTTP: Securing the Web with Self-Certifying URLs"
    seriesinfo: "Whitepaper, MIT, 1999"
    author:
      -
        ins: M. Kaminsky
        name: M. Kaminsky
      -
        ins: E. Banks
        name: E. Banks

  SFS:
    target: https://pdos.csail.mit.edu/~kaminsky/sfs-http.ps
    title: "Self-certifying File System"
    seriesinfo: “MIT Ph.D. Dissertation"
    date: 2000-06-01
    author:
      ins: D. Mazieres
      name: David Mazieres

  SCPN:
    target: https://dl.acm.org/doi/pdf/10.1145/319195.319213
    title: "Escaping the Evils of Centralized Control with self-certifying pathnames"
    seriesinfo: “MIT Laboratory for Computer Science, 2000"
    author:
      -
        ins: D. Mazieres
        name: David Mazieres
      -
        ins: M. Kaashoek
        name: M. F. Kaashoek

  RFC0791: IP

  RFC0799: IND

  DNS:
    target: https://en.wikipedia.org/wiki/Domain_Name_System
    title: Domain Name System

  CAA:
    target: https://en.wikipedia.org/wiki/DNS_Certification_Authority_Authorization
    title: DNS Certification Authority Authorization

  CA:
    target: https://en.wikipedia.org/wiki/Certificate_authority
    title: Certificate Authority

  RFC5280: ICRL

  CRL:
     target: https://en.wikipedia.org/wiki/Certificate_revocation_list
     title: Certificate Revocation List

  RFC6960: OCSP

  OCSPW:
     target: https://en.wikipedia.org/wiki/Online_Certificate_Status_Protocol
     title: Online Certificate Status Protocol

  WOT:
    target: https://en.wikipedia.org/wiki/Web_of_trust
    title: Web of Trust

  CEDS:
    target: "https://resources.infosecinstitute.com/cybercrime-exploits-digital-certificates/#gref"
    title: “How Cybercrime Exploits Digital Certificates”
    seriesinfo: "InfoSecInstitute"
    date: 2014-07-28

  KDDH:
    target: "https://krebsonsecurity.com/2019/02/a-deep-dive-on-the-recent-widespread-dns-hijacking-attacks/"
    title: A Deep Dive on the Recent Widespread DNS Hijacking Attacks
    seriesinfo: "KrebsonSecurity"
    date: 2019-02-19

  DNSH:
    target: "https://arstechnica.com/information-technology/2019/01/a-dns-hijacking-wave-is-targeting-companies-at-an-almost-unprecedented-scale/"
    title: A DNS hijacking wave is targeting companies at an almost unprecedented scale
    seriesinfo: "Ars Technica"
    date: 2019-01-10
    author:
      ins: D. Goodin
      name: Dan Goodin

  SFTCA:
    target: https://pdfs.semanticscholar.org/7876/380d71dd718a22546664b7fcc5b413c1fa49.pdf
    title: "Search for Trust: An Analysis and Comparison of CA System Alternatives and Enhancements"
    seriesinfo: "Dartmouth Computer Science Technical Report TR2012-716, 2012"
    author:
      ins: A. Grant
      name: A. C. Grant

  DNSP:
    target: https://www.thesslstore.com/blog/dns-poisoning-attacks-a-guide-for-website-admins/
    title: "DNS Poisoning Attacks: A Guide for Website Admins"
    seriesinfo: "HashedOut"
    date: 2020/01/21
    author:
      ins: G. Stevens
      name: G. Stevens

  BGPC:
    target: https://petsymposium.org/2017/papers/hotpets/bgp-bogus-tls.pdf
    title: Using BGP to acquire bogus TLS certificates
    seriesinfo: "Workshop on Hot Topics in Privacy Enhancing Technologies, no. HotPETs 2017"
    author:
      ins: "H. Birge-Lee"
      name: "H. Birge-Lee"

  BBGP:
    target: "https://www.usenix.org/conference/usenixsecurity18/presentation/birge-lee"
    title: "Bamboozling certificate authorities with BGP"
    seriesinfo: "vol. 27th USENIX Security Symposium, no. 18, pp. 833-849, 2018"
    author:
      ins: "H. Birge-Lee"
      name: "H. Birge-Lee"

  RFC6962: CT

  CTE:
    target: https://certificate.transparency.dev
    title: Certificate Transparency Ecosystem

  CTAOL:
    target: https://queue.acm.org/detail.cfm?id=2668154
    title: "Certificate Transparency: Public, verifiable, append-only logs"
    seriesinfo: "ACMQueue, vol. Vol 12, Issue 9"
    date: 2014-09-08
    author:
      ins: B. Laurie
      name: B. Laurie

  RT:
    target: https://www.links.org/files/RevocationTransparency.pdf
    title: Revocation Transparency

  VDS:
    target: https://github.com/google/trillian/blob/master/docs/papers/VerifiableDataStructures.pdf
    title: Verifiable Data Structures
    seriesinfo: "WhitePaper"
    date:  2015-11-01

  ESMT:
    target: https://eprint.iacr.org/2016/683.pdf
    title: Efficient sparse merkle trees
    seriesinfo: "Nordic Conference on Secure IT Systems, pp. 199-215, 2016"

  RC:
    target: https://en.wikipedia.org/wiki/Ricardian_contract
    title: Ricardian Contract


--- abstract

This document presents identity system-based secure overlay for the Internet. This system is based on a Key Event Receipt Infrastructure (KERI) or the KERI protocol {{KERI}}{{KERI-ID}}{{RFC0791}}. The primary key management operation is key Rotation (transference) via a novel key pre-rotation scheme as the background for the acronym KERI. {{DAD}}{{KERI}}.

The identity system-based secure overlay for the Internet, based on KERI includes a primary root-of-trust in Self-certifying identifiers (SCIDs) {{UIT}}{{SCPK}}{{SFS}}{{SCPN}}{{SCURL}}. This root-of-trust  presents a formalism for Autonomic identifiers (AIDs) and Autonomic namespaces (ANs). They are part of an Autonomic identity system (AIS). This system uses the design principle of minimally sufficient means to provide a candidate trust spanning layer for the internet. Associated with this system is a Decentralized key management infrastructure (DKMI).

The primary root-of-trust are SCIDs  that are strongly bound at issuance to a cryptographic signing (public, private) keypair which is self-contained until/unless control needs to be transferred to a new keypair. In that event, an append-only chained Key event log (KEL) of signed transfer statements provides end verifiable control provenance. This makes intervening operational infrastructure replaceable because the event logs may be served up by any infrastructure including ambient infrastructure. End Verifiable logs on ambient infrastructure enable ambient verifiability (Verifiable by anyone, anywhere, at any time).

The primary key management operation is key Rotation (transference) via a novel key pre-rotation scheme {{DAD}}{{KERI}}. Two primary trust modalities motivated the design, these are a direct (one-to-one) mode and an indirect (one-to-any) mode. The indirect mode depends on witnessed Key event receipt logs (KERL) as a secondary root-of-trust for validating events, which is the background for the acronym KERI, Key Event Receipt Infrastructure. In the direct mode, the identity Controller establishes control via verified signatures of the controlling keypair. The indirect mode extends that trust basis with witnessed KERLs for validating events. The security and accountability guarantees of indirect mode are provided by KERI’s Agreement Algorithm for Control Establishment (KA2CE) among a set of Witnesses.

The KA2CE approach may be much more performant and scalable than more complex approaches that depend on a total ordering distributed consensus ledger. Nevertheless, KERI may employ a distributed consensus ledger when other considerations make it the best choice. The KERI approach to DKMI allows for more granular composition. Moreover, because KERI is event streamed it enables DKMI that operates in-stride with data events streaming applications such as web 3.0, IoT, and others where performance and scalability are more important. The core KERI engine is identifier namespace independent. This makes KERI a candidate for a universal portable DKMI {{KERI}}{{KERI-ID}}{{UIT}}.




--- middle

# Introduction

The main motivation for this work is to provide a secure decentralized foundation of attributional trust for the Internet as a trustable spanning layer in the form of an identifier system security overlay. This identifier system security overlay provides verifiable authorship (authenticity) of any message or data item via secure (cryptographically verifiable) attribution to a *cryptonymous (cryptographic strength pseudonymous)* *self-certifying identifier (SCID)* {{KERI}}{{UIT}}{{SCPK}}{{SFS}}{{SCPN}}{{SCURL}}{{PKI}}.

A major flaw in the original design of the Internet Protocol was that it has no security layer(s) (i.e. Session or Presentation layers) to provide interoperable verifiable authenticity {{RFC0791}}. There was no built-in mechanism for secure attribution to the source of a packet. Specifically, the IP packet header includes a source address field that indicates the IP address of the device that sent the packet. Anyone (including any intermediary) can forge an IP (Internet Protocol) packet. Because the source address of such a packet can be undetectably forged, a recipient may not be able to ascertain when or if the packet was sent by an imposter.  This means that secure attribution mechanisms for the Internet must be overlaid (bolted-on). KERI provides such a security overlay. We describe it as an identifier system security overlay.

## Self-Certifying IDentifier (SCID)

The KERI identifier system overlay leverages the properties of cryptonymous ***self-certifying identifiers*** (SCIDs) which are based on asymmetric public-key cryptography (PKI) to provide end-verifiable secure attribution of any message or data item without needing to trust in any intermediary {{PKI}}{{KERI}}{{UIT}}{{SCPK}}{{SFS}}{{SCPN}}{{SCURL}}. A self-certifying identifier (SCID) is uniquely cryptographically derived from the public key of an asymmetric keypair, `(public, private)`. It is self-certifying in the sense that does not rely on a trusted entity. Any non-repudiable signature made with the private key may be verified by extracting the public key from either the identifier itself or incepting information uniquely associated with the cryptographic derivation process for the identifier. In a basic SCID, the mapping between an identifier and its controlling public key is self-contained in the identifier itself. A basic SCID is *ephemeral* i.e. it does not support rotation of its keypairs in the event of key weakness or compromise and therefore must be abandoned once the controlling private key becomes weakened or compromised from exposure. The class of identifiers that generalize SCIDs with enhanced properties such as persistence is called *autonomic identifiers* (AIDs).

## Autonomic IDentifier (AID)

A Key Event Log (KEL) gives rise to an enhanced class of SCIDs that are persistent, not ephemeral, because their keys may be refreshed or updated via rotation allowing secure control over the identifier in spite of key weakness or even compromise.
This family of generalized enhanced SCIDs we call ***autonomic identifiers*** (AIDs). *Autonomic* means self-governing, self-regulating, or self-managing and is evocative of the self-certifying, self-managing properties of this class of identifier.

## Key Pre-rotation Concept

An important innovation of KERI is that it solves the key rotation problem of PKI (including that of simple self-certifying identifiers) via a novel but elegant mechanism we call ***key pre-rotation*** {{DAD}}{{KERI}}. This *pre-rotation* mechanism enables an entity to persistently maintain or regain control over an identifier in spite of the exposure-related weakening over time or even compromise of the current set of controlling (signing) keypairs. With key pre-rotation, control over the identifier can be re-established by rotating to a one-time use set of unexposed but pre-committed rotation keypairs that then become the current signing keypairs. Each rotation in turn cryptographically commits to a new set of rotation keys but without exposing them. Because the pre-rotated keypairs need never be exposed prior to their one-time use, their attack surface may be optimally minimized. The current key-state is maintained via an append-only ***verifiable data structure*** we call a ***key event log*** (KEL).


## Cryptographic Primitives

### CESR

A ***cryptographic primitive ***is a serialization of a value associated with a cryptographic operation including but not limited to a digest (hash), a salt, a seed, a private key, a public key, or a signature. All cryptographic primitives in KERI MUST be expressed using the CESR (Compact Event Streaming Representation) protocol {{CESR-ID}}.  CESR supports round trip lossless conversion between its text, binary, and raw domain representations and lossless composability between its text and binary domain representations. Composability is ensured between any concatenated group of text primitives and the binary equivalent of that group because all CESR primitives are aligned on 24-bit boundaries. Both the text and binary domain representations are serializations suitable for transmission over the wire. The text domain representation is also suitable to be embedded as a string value of a field or array element as part of a field map serialization such as JSON, CBOR, or MsgPack {{RFC8259}}{{JSOND}}{{RFC8949}}{{CBORC}}{{MGPK}}. The text domain uses the set of characters from the URL-safe variant of Base64 which in turn is a subset of the ASCII character set {{RFC4648}}{{RFC0020}}. For the sake of readability, all examples in this specification will be expressed in CESR's text-domain.

### Qualified Cryptographic Primitive

When *qualified*, a cryptographic primitive includes a prepended derivation code (as a proem) that indicates the cryptographic algorithm or suite used for that derivation. This simplifies and compactifies the essential information needed to use that cryptographic primitive. All cryptographic primitives expressed in either text or binary CESR are *qualified* by definition. Qualification is an essential property of CESR {{CESR-ID}}. The CESR protocol supports several different types of encoding tables for different types of derivation codes. These tables include very compact codes. For example, a 256-bit (32-byte) digest using the BLAKE3 digest algorithm, i.e. Blake3-256, when expressed in text-domain CESR is 44 Base64 characters long and begins with the one character derivation code `E`, such as, `EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug` {{BLAKE3}}{{BLAKE3Spec}}{{BLAKE3Hash}}. The equivalent *qualified* binary domain representation is 33 bytes long.
Unless otherwise indicated, all cryptographic primitives in this specification will appear as *qualified* primitives using text-domain CESR.

## Identifier System Security Overlay

The function of KERI's identifier-system security overlay is to establish the authenticity (or authorship) of the message payload in an IP Packet by verifiably attributing it to a cryptonymous self-certifying identifier (AID) via an attached set of one or more asymmetric keypair-based non-repudiable digital signatures. The current valid set of associated asymmetric keypair(s) is proven via a verifiable data structure called a ***key event log*** (KEL) {{KERI}}{{VDS}}{{ESMT}}{{RT}}. The identifier system provides a mapping between the identifier and the keypair(s) that control the identifier, namely, the public key(s) from those keypairs. The private key(s) is secret and is not shared.

An authenticatable (verifiable) internet message (packet) or data item includes the identifier and data in its payload. Attached to the payload is a digital signature(s) made with the private key(s) from the controlling keypair(s). Given the identifier in a message, any verifier of a message (data item) can use the identifier system mapping to look up the public key(s) belonging to the controlling keypair(s). The verifier can then verify the attached signature(s) using that public key(s). Because the payload includes the identifier, the signature makes a non-repudiable cryptographic commitment to both the source identifier and the data in the payload.

### Security Overlay Flaws

There are two major flaws in conventional PKI-based identifier system security overlays (including the Internet's DNS/CA system) {{PKI}}{{DNS}}{{RFC0799}}{{CAA}}{{CA}}{{RFC5280}}.

The *first major flaw** is that the mapping between the identifier (domain name) and the controlling keypair(s) is merely asserted by a trusted entity e.g. certificate authority (CA) via a certificate. Because the mapping is merely asserted, a verifier can not cryptographically verify the mapping between the identifier and the controlling keypair(s) but must trust the operational processes of the trusted entity making that assertion, i.e. the CA who issued and signed the certificate. As is well known, a successful attack upon those operational processes may fool a verifier into trusting an invalid mapping i.e. the certificate is issued to the wrong keypair(s) albeit with a verifiable signature from a valid certificate authority. {{CEDS}}{{KDDH}}{{DNSH}}{{SFTCA}}{{DNSP}}{{BGPC}}{{BBGP}}. Noteworthy is that the signature on the certificate is NOT made with the controlling keypairs of the identifier but made with keypairs controlled by the issuer i.e. the CA. The fact that the certificate is signed by the CA means that the mapping itself is not verifiable but merely that the CA asserted the mapping between keypair(s) and identifier. The certificate merely provides evidence of the authenticity of the assignment of the mapping but not evidence of the veracity of the mapping.

The *second major flaw* is that when rotating the valid signing keys there is no cryptographically verifiable way to link the new (rotated in) controlling/signing key(s) to the prior (rotated out) controlling/signing key(s). Key rotation is merely implicitly asserted by a trusted entity (CA) by issuing a new certificate with new controlling/signing keys.  Key rotation is necessary because over time the controlling keypair(s) of an identifier becomes weak due to exposure when used to sign messages and must be replaced. An explicit rotation mechanism first revokes the old keys and then replaces them with new keys. Even a certificate revocation list (CRL) as per RFC5280, with an online status protocol (OCSP) registration as per RFC6960, does not provide a cryptographically verifiable connection between the old and new keys, it is merely asserted {{RFC5280}}{{RFC6960}}{{OCSPW}}. The lack of a single universal CRL or registry means that multiple potential replacements may be valid. From a cryptographic verifiability perspective, rotation by assertion with a new certificate that either implicitly or explicitly provides revocation and replacement is essentially the same as starting over by creating a brand new independent mapping between a given identifier and the controlling keypair(s). This start-over style of key rotation may well be one of the main reasons that PGP's web-of-trust failed {{WOT}}. Without a universally verifiable revocation mechanism, then any rotation (revocation and replacement) assertions either explicit or implicit are mutually independent of each other. This lack of universal cryptographic verifiability of a rotation fosters ambiguity at any point in time as to the actual valid mapping between the identifier and its controlling keypair(s). In other words, for a given identifier, any or all assertions made by some set of CAs may be potentially valid.

We call the state of the controlling keys for an identifier at any time the key state. Cryptographic verifiability of the key state over time is essential to remove this ambiguity. Without this verifiability, the detection of potential ambiguity requires yet another bolt-on security overlay such as the certificate transparency system {{CTE}}{{CTAOL}}{{RFC6962}}{{RT}}{{VDS}}{{ESMT}}.

The KERI protocol fixes both of these flaws using a combination of ***autonomic identifiers***, ***key pre-rotation***, a ***verifiable data structure*** (VDS) called a KEL as verifiable proof of key-state, and ***duplicity-evident*** mechanisms for evaluating and reconciling key state by validators {{KERI}}. Unlike certificate transparency, KERI enables the detection of duplicity in the key state via non-repudiable cryptographic proofs of duplicity not merely the detection of inconsistency in the key state that may or may not be duplicitous {{KERI}}{{CTAOL}}.


### Triad Bindings

In simple form an identifier-system security-overlay binds together a triad consisting of the ***identifier***, ***keypairs***, and ***controllers***. By ***identifier*** we mean some string of characters. By ***keypairs*** we mean a set of asymmetric (public, private) cryptographic keypairs used to create and verify non-repudiable digital signatures. By ***controllers*** we mean the set of entities whose members each control a private key from the given set of ***keypairs***. When those bindings are strong then the overlay is highly *invulnerable* to attack.  In contrast, when those bindings are weak then the overlay is highly *vulnerable* to attack. The bindings for a given identifier form a *triad* that binds together the set of *controllers*, the set of *keypairs*, and the *identifier*. To reiterate, the set of controllers is bound to the set of keypairs, the set of keypairs is bound to the identifier, and the identifier is bound to the set of controllers. This binding triad can be diagrammed as a triangle where the sides are the bindings and the vertices are the *identifier*, the set of *controllers*, and the set of *keypairs*. This triad provides verifiable ***control authority*** for the identifier.

With KERI all the bindings of the triad are strong because they are cryptographically verifiable with a minimum cryptographic strength or level of approximately 128 bits. See the Appendix on cryptographic strength for more detail.

The bound triad is created as follows\:

* Each controller in the set of controllers creates an asymmetric `(pubic, private)` keypair. The public key is derived from the private key or seed using a one-way derivation that MUST have a minimum cryptographic strength of approximately 128 bits {{OWF}}{{COWF}}. Depending on the crypto-suite used to derive a keypair the private key or seed may itself have a length larger than 128 bits. A controller may use a cryptographic strength pseudo-random number generator (CSPRNG) {{CSPRNG}} to create the private key or seed material. Because the private key material must be kept secret, typically in a secure data store, the management of those secrets may be an important consideration. One approach to minimize the size of secrets is to create private keys or seeds from a secret salt. The salt MUST have an entropy of approximately 128 bits. The salt may then be stretched to meet the length requirements for the crypto suite's private key size {{Salt}}{{Stretch}}. In addition, a hierarchical deterministic derivation function may be used to further minimize storage requirements by leveraging a single salt for a set or sequence of private keys {{HDKC}}. Because each controller is the only entity in control (custody) of the private key, and the public key is universally uniquely derived from the private key using a cryptographic strength one-way function, then the binding between each controller and their keypair is as strong as the ability of the controller to keep that key private {{OWF}}{{COWF}}. The degree of protection is up to each controller to determine. For example, a controller could choose to store their private key in a safe, at the bottom of a coal mine, air-gapped from any network, with an ex-special forces team of guards. Or the controller could choose to store it in an encrypted data store (key chain) on a secure boot mobile device with a biometric lock, or simply write it on a piece of paper and store it in a safe place. The important point is that the strength of the binding between controller and keypair does not need to be dependent on any trusted entity.

* The identifier is universally uniquely derived from the set of public keys using a one-way derivation function {{OWF}}{{COWF}}. It is therefore an AID (qualified SCID). Associated with each identifier (AID) is incepting information that MUST include a list of the set of *qualified* public keys from the controlling keypairs. In the usual case, the identifier is a *qualified* cryptographic digest of the serialization of all the incepting information for the identifier. Any change to even one bit of the incepting information changes the digest and hence changes the derived identifier. This includes any change to any one of the qualified public keys including its qualifying derivation code. To clarify, a *qualified* digest as identifier includes a derivation code as proem that indicates the cryptographic algorithm used for the digest. Thus a different digest algorithm results in a different identifier. In this usual case, the identifier is strongly cryptographically bound to not only the public keys but also any other incepting information from which the digest was generated.

A special case may arise when the set of public keys has only one member, i.e. there is only one controlling keypair. In this case, the controller of the identifier may choose to use only the *qualified* public key as the identifier instead of a *qualified* digest of the incepting information. In this case, the identifier is still strongly bound to the public key but is not so strongly bound to any other incepting information.  A variant of this single keypair special case is an identifier that can not be rotated. Another way of describing an identifier that cannot be rotated is that it is a *non-transferable* identifier because control over the identifier cannot be transferred to a different set of controlling keypairs. Whereas a rotatable keypair is *transferable* because control may be transferred via rotation to a new set of keypairs. Essentially, when non-transferable, the identifier's lifespan is *ephemeral*, not *persistent*, because any weakening or compromise of the controlling keypair means that the identifier must be abandoned. Nonetheless, there are important use cases for an *ephemeral* self-certifying identifier. In all cases, the derivation code in the identifier indicates the type of identifier, whether it be a digest of the incepting information (multiple or single keypair) or a single member special case derived from only the public key (both ephemeral or persistent).

* Each controller in a set of controllers is may prove its contribution to the control authority over the identifier in either an interactive or non-interactive fashion. One form of interactive proof is to satisfy a challenge of that control. The challenger creates a unique challenge message. The controller responds by non-repudiably signing that challenge with the private key from the keypair under its control. The challenger can then cryptographically verify the signature using the public key from the controller's keypair. One form of non-interactive proof is to periodically contribute to a monotonically increasing sequence of non-repudiably signed updates of some data item. Each update includes a monotonically increasing sequence number or date-time stamp. Any observer can then cryptographically verify the signature using the public key from the controller's keypair and verify that the update was made by the controller.  In general, only members of the set of controllers can create verifiable non-repudiable signatures using their keypairs. Consequently, the identifier is strongly bound to the set of controllers via provable control over the keypairs.

*** Tetrad Bindings

At inception, the triad of identifier, keypairs, and controllers are strongly bound together. But in order for those bindings to persist after a key rotation, another mechanism is required. That mechanism is a verifiable data structure called a *key event log* (KEL) {{KERI}}{{VDS}}.  The KEL is not necessary for identifiers that are non-transferable and do not need to persist control via key rotation in spite of key weakness or compromise. To reiterate, transferable (persistent) identifiers each need a KEL, non-transferable (ephemeral) identifiers do not.

For persistent (transferable) identifiers, this additional mechanism may be bound to the triad to form a tetrad consisting of the KEL, the identifier, the set of keypairs, and the set of controllers. The first entry in the KEL is called the *inception event* which is a serialization of the incepting information associated with the identifier mentioned previously.

The *inception event* MUST include the list of controlling public keys. It MUST also include a signature threshold and MUST be signed by a set of private keys from the controlling keypairs that satisfy that threshold. Additionally, for transferability (persistence across rotation) the *inception event* MUST also include a list of digests of the set of pre-rotated public keys and a pre-rotated signature threshold that will become the controlling (signing) set of keypairs and threshold after a rotation.  A non-transferable identifier MAY have a trivial KEL that only includes an *inception event* but with a null set (empty list) of pre-rotated public keys.

A rotation is performed by appending to the KEL a *rotation event*. A *rotation event* MUST include a list of the set of pre-rotated public keys (not their digests) thereby exposing them and MUST be signed by a set of private keys from these newly exposed newly controlling but pre-rotated keypairs that satisfy the pre-rotated threshold. The rotation event MUST also include a list of the digests of a new set of pre-rotated keys as well as the signature threshold for the set of pre-rotated keypairs. At any point in time the transferability of an identifier can be removed via a *rotation event* that rotates to a null set (empty list) of pre-rotated public keys.

Each event in a KEL MUST include an integer sequence number that is one greater than the previous event. Each event after the inception event MUST also include a cryptographic digest of the previous event. This digest means that a given event is cryptographically bound to the previous event in the sequence. The list of digests or pre-rotated keys in the inception event cryptographically binds the inception event to a subsequent rotation event. Essentially making a forward commitment that forward chains together the events. The only valid rotation event that may follow the inception event must include the pre-rotated keys. But only the controller who created those keys and created the digests may verifiably expose them. Each rotation event in turn makes a forward commitment (chain) to the following rotation event via its list of pre-rotated key digests.   This makes the KEL a doubly (backward and forward) hash (digest) chained non-repudiably signed append-only verifiable data structure.

Because the signatures on each event are non-repudiable, the existence of an alternate but verifiable KEL for an identifier is provable evidence of duplicity. In KERI, there may be at most one valid KEL for any identifier or none at all. Any validator of a KEL may enforce this one valid KEL rule before relying on the KEL as proof of the current key state for the identifier. This protects the validator. Any unreconcilable evidence of duplicity means the validator does not trust (rely on) any KEL to provide the key state for the identifier. Rules for handling reconciliable duplicity will be discussed later.  From a validator's perspective, either there is one-and-only-one valid KEL or none at all. This protects the validator. This policy removes any potential ambiguity about key state.  The combination of a verifiable KEL made from non-repudiably signed backward and forward hash chained events together with the only-one-valid KEL rule strongly binds the identifier to its current key-state as given by that one valid KEL or not at all. This in turn binds the identifier to the controllers of the current keypairs given by the KEL thus completing the tetrad.

At inception, the KEL may be even more strongly bound to its tetrad by deriving the identifier from a digest of the *inception event*. Thereby even one change in not only the original controlling keys pairs but also the pre-rotated keypairs or any other incepting information included in the *inception event* will result in a different identifier.

The essense of the KERI protocol is a strongly bound tetrad of identifier, keypairs, controllers, and key event log that forms the basis of its identifier system security overlay. The KERI protocol introduces the concept of duplicity evident programming via duplicity evident verifiable data structures. The full detailed exposition of the protocol is provided in the following sections.

# Basic Terminology

Several new terms were introduced above. These along with other terms helpful to describing KERI are defined below.

Primitive
: A serialization of a unitary value. A *cryptographic primitive* is the serialization of a value associated with a cryptographic operation including but not limited to a digest (hash), a salt, a seed, a private key, a public key, or a signature. All *primitives* in KERI MUST be expressed in CESR (Compact Event Streaming Representation) {{CESR-ID}}.

Qualified
: When *qualified*, a *cryptographic primitive* includes a prepended derivation code (as a proem) that indicates the cryptographic algorithm or suite used for that derivation. This simplifies and compactifies the essential information needed to use that *cryptographic primitive*. All *cryptographic primitives* expressed in either text or binary CESR are *qualified* by definition {{CESR-ID}}. Qualification is an essential property of CESR {{CESR-ID}}.

Cryptonym
: A cryptographic pseudonymous identifier represented by a string of characters derived from a random or pseudo-random secret seed or salt via a one-way cryptogrphic function with a sufficiently high degree of cryptographic strength (e.g. 128 bits, see appendix on cryptographic strength) {{OWF}}{{COWF}}{{TMCrypto}}{{QCHC}}. A *cryptonym* is a type of *primitive*. Due the enctropy in its derivation, a *cryptonym* is a universally unique identifier and only the controller of the secret salt or seed from which the *cryptonym* is derived may prove control over the *cryptonym*. Therefore the derivation function MUST be associated with the *cryptonym* and MAY be encoded as part of the *cryptonym* itself.

SCID
: Self-Certifying IDentifier.  A self-certifying identifier (SCID) is a type of cryptonym that is uniquely cryptographically derived from the public key of an asymmetric non-repudiable signing keypair, `(public, private)`. It is self-certifying or more precisely self-authenticating because it does not rely on a trusted entity. The authenticity of a non-repudiable signature made with the private key may be verified by extracting the public key from either the identifier itself or incepting information uniquely associated with the cryptographic derivation process for the identifier. In a basic SCID, the mapping between an identifier and its controlling public key is self-contained in the identifier itself. A basic SCID is *ephemeral* i.e. it does not support rotation of its keypairs in the event of key weakness or compromise and therefore must be abandoned once the controlling private key becomes weakened or compromised from exposure {{PKI}}{{KERI}}{{UIT}}{{SCPK}}{{SFS}}{{SCPN}}{{SCURL}}{{PKI}}.

AID
: Autonomic IDentifier. A self-managing *cryptonymous* identifier that MUST be self-certifying (self-authenticating) and MUST be encoded in CESR as a *qualified* cryptographic primitive. An AID MAY exhibit other self-managing properties such as transferable control using key *pre-rotation* which enables control over such an AID to persist in spite of key weakness or compromise due to exposure. Authoritative control over the identifier persists in spite of the evolution of the key-state.

Key State
: Includes the set of currently authoritative keypairs for an AID and any other information necessary to secure or establish control authority over an AID.

Key Event
: Concretely, the serialized data structure of an entry in the key event log for an AID. Abstractly, the data structure itself. Key events come in different types and are used primarily to establish or change the authoritative set of keypairs and/or anchor other data to the authoritative set of keypairs at the point in the key event log actualized by a particular entry.

Establishment Event
: Key Event that establishes or changes the key-state which includes the current set of authoritative keypairs (key-state) for an AID.

Non-establishment Event
: Key Event that does not change the current key-state for an AID. Typically the purpose of a non-establishment event is to anchor external data to a given key state as established by the most recent prior establishment event for an AID.

Inception Event
: Establishment Event that provides the incepting information needed to derive an AID and establish its initial key-state.

Inception
: The operation of creating an AID by binding it to the initial set of authoritative keypairs and any other associated information. This operation is made verifiable and duplicity evident upon acceptance as the *inception event* that begins the AID's KEL.

Rotation Event
: Establishment Event that provides the information needed to change the key-state which includes a change to the set of authoritative keypairs for an AID.

Rotation
: The operation of revoking and replacing the set of authoritative keypairs for an AID. This operation is made verifiable and duplicity evident upon acceptance as a *rotation event* that is appended to the AID's KEL.

Interaction Event
: Non-establishment Event that anchors external data to the key-state as established by the most recent prior establishment event.

KEL
:  Key Event Log. A verifiable data structure that is a backward and forward chained, signed, append-only log of key events for an AID. The first entry in a KEL MUST be the one and only Inception Event of that AID.

Version
: More than one version of a KEL for an AID exists when for any two instances of a KEL at least one event is unique between the two instances.

Verifiable
: A KEL is verifiable means all content in a KEL including the digests and the signatures on that content is verifiably compliant with respect to the KERI protocol. In other words, the KEL is internally consistent and has integrity vis-a-vis its backward and forward chaining digests and authenticity vis-a-vis its non-repudiable signatures. As a verifiable data structure, the KEL satisfies the KERI protocol-defined rules for that verifiability. This includes the cryptographic verification of any digests or signatures on the contents so digested or signed.

Duplicity
: Means the existence of more than one version of a verifiable KEL for a given AID. Because every event in a KEL must be signed with non-repudiable signatures any inconsistency between any two instances of the KEL for a given AID is provable evidence of duplicity on the part of the signers with respect to either or both the key-state of that AID and/or any anchored data at a given key-state.  A shorter KEL that does not differ in any of its events with respect to another but longer KEL is not duplicitous but merely incomplete.  To clarify, duplicity evident means that duplicity is provable via the presentation of a set of two or more mutually inconsistent but independently verifiable instances of a KEL.

Verifier
: Any entity or agent that cryptographically verifies the signature(s) and/or digests on an event message. In order to verify a signature, a verifier must first determine which set of keys are or were the controlling set for an identifier when an event was issued. In other words, a verifier must first establish control authority for an identifier. For identifiers that are declared as non-transferable at inception, this control establishment merely requires a copy of the inception event for the identifier. For identifiers that are declared transferable at inception, this control establishment requires a complete copy of the sequence of establishment events (inception and all rotations) for the identifier up to the time at which the statement was issued.

Validator
: Any entity or agent that evaluates whether or not a given signed statement as attributed to an identifier is valid at the time of its issuance.  A valid statement MUST be verifiable, that is, has a verifiable signature from the current controlling keypair(s) at the time of its issuance. Therefore a *Validator* must first act as a *Verifier* in order to establish the root authoritative set of keys. Once verified, the *Validator* may apply other criteria or constraints to the statement in order to determine its validity for a given use case. When that statement is part of a verifiable data structure then the cryptographic verification includes verifying digests and any other structural commitments or constraints.  To elaborate, with respect to an AID, for example, a *Validator* first evaluates one or more KELs in order to determine if it can rely on (trust) the key state (control authority) provided by any given KEL. A necessary but insufficient condition for a valid KEL is it is verifiable i.e. is internally inconsistent with respect to compliance with the KERI protocol. An invalid KEL from the perspective of a Validator may be either unverifiable or may be verifiable but duplicitous with respect to some other verifiable version of that KEL.  Detected duplicity by a given validator means that the validator has seen more than one verifiable version of a KEL for a given AID. Reconciliable duplicity means that one and only one version of a KEL as seen by a Validator is accepted as the authoritative version for that validator. Irreconcilable duplicity means that none of the versions of a KEL as seen by a validator are accepted as the authoritative one for that validator. The conditions for reconcilable duplicity are described later.

Message
: Consists of a serialized data structure that comprises its body and a set of serialized data structures that are its attachments. Attachments may include but are not limited to signatures on the body.

Key Event Message
: Message whose body is a key event and whose attachments may include signatures on its body.

Key Event Receipt
: Message whose body references a key event and whose attachments MUST include one or more signatures on that key event.


# Keypair Labeling Convention

In order to make key event expressions both clearer and more concise, we use a keypair labeling convention. When an AID's key state is dynamic, i.e. the set of controlling keypairs is transferable, then the keypair labels are indexed in order to represent the successive sets of keypairs that constitute the key state at any position in the KEL (key event log). To elaborate, we use indexes on the labels for AIDs that are transferable to indicate which set of keypairs is associated with the AID at any given point in its key state or KEL. In contrast, when the key state is static, i.e. the set of controlling keypairs is non-transferable then no indexes are needed because the key state never changes.

Recall that, a keypair is a two tuple, *(public, private)*, of the respective public and private keys in the keypair. For a given AID, the labeling convention uses an uppercase letter label to represent that AID. When the key state is dynamic, a superscripted index on that letter is used to indicate which keypair is used at a given key state. Alternatively, the index may be omitted when the context defines which keypair and which key state, such as, for example, the latest or current key state. To reiterate, when the key state is static no index is needed.

In general, without loss of specificity, we use an uppercase letter label to represent both an AID and when indexed to represent its keypair or keypairs that are authoritative at a given key state for that AID. In addition, when expressed in tuple form the uppercase letter also represents the public key and the lowercase letter represents the private key for a given keypair. For example, let *A* denote and AID, then let* A* also denote a keypair which may be also expressed in tuple form as *(A, a)*. Therefore, when referring to the keypair itself as a pair and not the individual members of the pair, either the uppercase label, *A*, or the tuple, *(A, a)*, may be used to refer to the keypair itself. When referring to the individual members of the keypair then the uppercase letter, *A*, refers to the public key, and the lowercase letter, *a*, refers to the private key.

Let the sequence of keypairs that are authoritative (i.e establish control authority) for an AID be indexed by the zero-based integer-valued, strictly increasing by one, variable *i*. Furthermore, as described above, an establishment key event may change the key state. Let the sequence of establishment events be indexed by the zero-based integer-valued, strictly increasing by one, variable *j*. When the set of controlling keypairs that are authoritative for a given key state includes only one member, then *i = j* for every keypair, and only one index is needed. But when the set of keypairs used at any time for a given key state includes more than one member, then *i != j* for every keypair, and both indices are needed.

In the former case, where only one index is needed because *i = j*, let the indexed keypair for AID, *A*, be denoted by *A<sup>i</sup>* or in tuple form by *(A<sup>i</sup>, a<sup>i</sup>)* where the keypair so indexed uses the *i<sup>th</sup>* keypair from the sequence of all keypairs.  The keypair sequence may be expressed as the list, *[A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, ...]*. The zero element in this sequence is denoted by *A<sup>0</sup>* or in tuple form by *(A<sup>0</sup>, a<sup>0</sup>)*.

In the latter case, where both indices are needed because *i != j*, let the indexed keypair for AID, *A*, be denoted by *A<sup>i,j</sup>* or in tuple form by *(A<sup>i,j</sup>, a<sup>i,j</sup>)* where the keypair so indexed is authoritative or potentially authoritative for *i<sup>th</sup>* keypair from the sequence of all keypairs that is authoritative in the the *j<sup>th</sup>* key state. Suppose, for example, that for a given AID labeled *A* each key state uses three keypairs to establish control authority, then the sequence of the first two key states will consume the first six keypairs as given by the following list, *[A<sup>0,0</sup>, A<sup>1,0</sup>, A<sup>2,0</sup>, A<sup>3,1</sup>,  A<sup>4,1</sup>,  A<sup>5,1</sup>]*.

Furthermore, with pre-rotation, each public key from the set of pre-rotated keypairs may be hidden as a qualified cryptographic digest of that public key. The digest of the public key labeled *A* is represented using the functional notation *H(A)* for hash (digest). When singly indexed, the digest of *A<sup>i</sup>* is denoted by *H(A</u><sup>i</sup>)* and when doubly indexed the digest of *A<sup>i,j</sup>* is denoted by *H(A<sup>i,j</sup>}*. A pre-rotated keypair is potentially authoritative for the next or subsequent establishment event after the establishment event when the digest of the pre-rotated keypair first appears. Therefore its *j<sup>th</sup>* index value is one greater than the *j<sup>th</sup>* index value of the establishment event in which its digest first appears. As explained in more detail below, for partial rotation of a pre-rotated set, a pre-rotated keypair from a set of two or more pre-rotated keypairs is only potentially authoritative so that its actual authoritative *j<sup>th</sup>* index may change when it is actually rotated in if ever.

Finally, each key event in a KEL MUST have a zero-based integer-valued, strictly increasing by one, sequence number. Abstractly we may use the variable *k* as an index on any keypair label to denote the sequence number of an event for which that keypair is authoritative. Usually, this appears as a subscript.  Thus any given keypair label could have three indices, namely, *i,j,k* that appear as follows, *A<sup>i,j</sup><sub>k</sub>* where *i* denotes the *i<sup>th</sup>* keypair from the sequence of all keypairs, *j* denotes the *j<sup>th</sup> establishment event in which the keypair is authoritative, and *k* represents the *k<sup>th</sup>* key event in which the keypair is authoritative. When a KEL has only establishment events then *j = k*.

# Pre-rotation Detail

Each establishment event involves two sets of keys that each play a role that together establishes complete control authority over the AID associated at the location of that event in the KEL. To clarify, control authority is split between keypairs that hold signing authority and keypairs that hold rotation authority. A rotation revodes and replaces the keypairs that hold signing authority as well as replacing the keypairs that hold rotation authority. The two set sets of keys are labeled *current* and *next*. Each establishment event designates both sets of keypairs. The first (*current*) set consists of the authoritative signing keypairs bound to the AID at the location in the KEL where the establishment event occurs. The second (*next*) set consists of the pre-rotated authoritative rotation keypairs that will be actualized in the next (ensuing) establishment event. Each public key in the set of next (ensuing) pre-rotated public keys is hidden in or blinded by a digest of that key. When the establishment event is the inception event then the *current* set is the *initial* set. The pre-rotated *next* set of Rotation keypairs are one-time use only rotation keypairs, but MAY be repurposed as signing keypairs after their one time use to rotate.

In addition, each establishment event designates two threshold expressions, one for each set of keypairs (*current* and *next*). The *current* threshold determines the needed satisficing subset of signatures from the associated *current* set of keypairs for signing authority to be considered valid. The *next* threshold determines the needed satisficing subset of signatures from the associated *next* set of hidden keypairs for rotation authority to be considered valid. The simplest type of threshold expression for either threshold is an integer that is no greater than nor no less than the number of members in the set. An integer threshold acts as an *M of N* threshold where *M* is the threshold and *N* is the total number of keypairs represented by the public keys in the key list. If any set of *M* of the *N* private keys belonging to the public keys in the key list verifiably signs the event then the threshold is satisfied for the control authority role (signing or rotation) associated with the given key list and threshold .

To clarify, each establishment event MUST include a list (ordered) of the qualified public keys from each of the current (initial) set of keypairs), a threshold for the current set, a list (ordered) of the qualified cryptographic digests of the qualified public keys from the next set of keypairs, and a threshold for the next set. Each event MUST also include the AID itself as either a qualified public key or a qualified digest of the inception establishment event.

Each non-establishment event MUST be signed by a threshold-satisficing subset of private keys from the *current* set of keypairs from the most recent establishment event. A little more explanation is needed to understand the requirements for a valid set of signatures for each type of establishment event.

## Inception Event Pre-rotation

The creator of the inception event MUST create two sets of keypairs, the *current* (*initial*) set, and the *next* set. The private keys from the current set are kept as secrets. The public keys from the *current* set are exposed via inclusion in the inception event. Both the public and private keys from the *next* set are kept as secrets and only the cryptographic digests of the public keys from the *next* set are exposed via inclusion in the event. The public keys from the *next* set are only exposed in a subsequent establishment if any.  Both thresholds are exposed via inclusion in the event.

Upon emittance of the inception event, the *current* (*initial*) set of keypairs becomes the current set of verifiable authoritative signing keypairs for the identifier. Emittance of the inception event also issues the identifier. Moreover, to be verifiably authoritative, the inception event must be signed by a threshold satisficing subset of the *current* (*initial*) set of private keys. The inception event may be verified against the attached signatures using the included *current* (*initial*) list of public keys. When self-addressing, a digest of the serialization of the inception event provides the AID itself as derived by the SAID protocol {{SAID-ID}}.

There MUST be only one inception establishment event. All subsequent establishment events MUST be rotation events.

## Rotation Using Pre-rotation

Unlike inception, the creator of a rotation event MUST create only one set of keypairs, the newly *next* set. Both the public and private keys from the newly *next* set are kept as secrets and only the cryptographic digests of the public keys from the newly *next* set are exposed via inclusion in the event. The list of newly *current* public keys MUST include the  an old  *next* threshold satisficing subset of old *next* public keys from the most recent prior establishment event.  For short, we denote the next threshold from the most recent prior establishment event as the *prior next* threshold, and the list of unblinded public keys taken from the blinded key digest list from the most recent prior establishment event as the *prior next* key list. The subset of old *prior next* keys that are included in the newly current set of public keys MUST be unhidden or unblinded because they appear as the public keys themselves and no longer appear as digests of the public keys. Both thresholds are exposed via inclusion in the event.

Upon emittance of the rotation event, the newly *current* keypairs become the *current* set of verifiable authoritative signing keypairs for the identifier. The old *current* set of keypairs from the previous establishment event has been revoked and replaced by the newly *current* set. Moreover, to be verifiably authoritative, the rotation event must be signed by a dual threshold satisficing subset of the newly *current* set of private keys. To elaborate, the set of signatures on a rotation event MUST satisfy two thresholds. These are the newly *current* threshold and the old  *prior next* threshold from the most recent prior establishment event. Therefore the newly *current* set of public keys must include a satisfiable subset with respect to the old *prior next* threshold of public keys from the old *prior next* key list. The included newly *current* list of public keys enables verification of the rotation event against the attached signatures.

The act of inclusion in each establishment event of the digests of the new *next* set of public keys performs a pre-rotation operation on that set by making a verifiable forward blinded commitment to that set. Consequently, no other set may be used to satisfy the threshold for the *next* rotation operation. Because the *next* set of pre-rotated keys is blinded (i.e. has not been exposed i.e. used to sign or even published) an attacker can't forge and sign a verifiable rotation operation without first unblinding the pre-rotated keys. Therefore, given sufficient cryptographic strength of the digests, the only attack surface available to the adversary is a side-channel attack on the private key store itself and not on signing infrastructure. But the creator of the pre-rotated private keys is free to make that key store as arbitrarily secure as needed because the pre-rotated keys are not used for signing until the next rotation.  In other words, as long as the creator keeps secret the pre-rotated public keys themselves, an attacker must attack the key storage infrastructure because side-channel attacks on signing infrastructure are obviated.

As explained later, for a validator, the first seen rule applies, that is, the first seen version of an event is the authoritative one for that validator. The first seen wins. In other words the first published becomes the first seen. Upon rotation, the old prior *next* keys are exposed but only after a new *next* set has been created and stored. Thus the creator is always able to stay one step ahead of an attacker. By the time a new rotation event is published, it is too late for an attacker to create a verifiable rotation event to supplant it because the orginal version has already been published and may be first seen by the validator. The window for an attacker is the network latency for the first published event to be first seen by the network of validators. Any later key compromise is too late.

In essence, each key set follows a rotation lifecycle where it changes its role with each rotation event. A pre-rotated keypair set starts as the member of the *next* key set holding one-time rotation control authority. On the ensuing rotation that keypair becomes part of the the *current* key set holding signing control authority. Finally on the following rotation that keypair is discarded. The lifecycle for the initial key set in an inception event is slightly different. The initial key set starts as the *current* set holding signing authority and is discarded on the ensuing rotation event if any.

## Pre-Rotation Example

Recall that the keypairs for a given AID may be represented by the indexed letter label such as *A<sup>i,j</sup><sub>k</sub>* where *i* denotes the *i<sup>th</sup>* keypair from the sequence of all keypairs, *j* denotes the *j<sup>th</sup> establishment event in which the keypair is authoritative, and *k* represents the *k<sup>th</sup>* key event in which the keypair is authoritative. When a KEL has only establishment events then *j = k*. When only one keypair is authoritative at any given key state then *i = j*.

Also, recall that a pre-rotated keypair is designated by the digest of its public key appearing in an establishment event. The digest is denoted as *H(A)* or *H(A<sup>i,j</sup><sub>k</sub>)* in indexed form. The appearance of the digest makes a forward verifiable cryptographic commitment that may be realized in the future when and if that public key is exposed and listed as a current authoritative signing key in a subsequent establishment event.

The following example illustrates the lifecycle roles of the key sets drawn from a sequence of keys used for three establishment events; one inception followed by two rotations. The initial number of authoritative keypairs is three and then changes to two and then changes back to three.

|Event| Current Keypairs | CT | Next Keypairs| NT |
|:-:|--:|--:|--:|--:|
|0| *[A<sup>0,0</sup>, A<sup>1,0</sup>, A<sup>2,0</sup>]* | 2 | *[H(A<sup>3,1</sup>), H(A<sup>4,1</sup>)]* | 1 |
|1| *[A<sup>3,1</sup>, A<sup>4,1</sup>]* | 1 | *[H(A<sup>5,2</sup>), H(A<sup>6,2</sup>), H(A<sup>7,2</sup>)]* | 2 |
|2| *[A<sup>5,2</sup>, A<sup>6,2</sup>, A<sup>7,2</sup>]* | 2 | *[H(A<sup>8,3</sup>), H(A<sup>9,3</sup>), H(A<sup>10,3</sup>]* | 2 |

+ *CTH* means Current Threshold.

+ *NTH* means Next Threshold.

## Reserve Rotation

The pre-rotation mechanism supports partial pre-rotation or more exactly partial rotation of pre-rotated keypairs. One important use case for partial rotation is to enable pre-rotated keypairs designated in one establishment event to be held in reserve and not exposed at the next (immediately subsequent) establishment event. This reserve feature enables keypairs held by controllers as members of a set of pre-rotated keypairs to be used for the purpose of fault tolerance in the case of non-availability by other controllers while at the same time minimizing the burden of participation by the reserve members. In other words, a reserved pre-rotated keypair contributes to the potential availability and fault tolerance of control authority over the AID without necessarily requiring the participation of the reserve key-pair in a rotation until and unless it is needed to provide continuity of control authority in the event of a fault (non-availability of a non-reserved member). This reserve feature enables different classes of key controllers to contribute to the control authority over an AID. This enables provisional key control authority. For example, a key custodial service or key escrow service could hold a keypair in reserve to be used only upon satisfaction of the terms of the escrow agreement. This could be used to provide continuity of service in the case of some failure event. Provisional control authority may be used to prevent types of common-mode failures without burdening the provisional participants in the normal non-failure use cases.

## Custorial Rotation

Partial pre-rotation supports another important use case that of custodial key rotation. Because control authority is split between two key sets, the first for signing authority and the second (pre-roateted) for rotation authority the associated thresholds and key list can be structured in such a way that a designated custodial agent can hold signing authority while the  original controller can hold exclusive rotation authority. The holder of the rotation authority can then at any time without the cooperation of the custodial agent if need be revoke the agent's signing authority and assign it so some other agent or return that authority to itself.

## Basic Fractionally Weighted Threshold

This partial rotation feature for either reserve or custodial rotation authority is best employed with thresholds that are fractionally weighted. The exact syntax for fractionally weighted thresholds is provided later, but for the sake of explanation of partial pre-rotation, a summary is provided here. A fractionally weighted threshold consists of a list of one or more clauses where each clause is itself a list of legal rational fractions ( i.e. ratios of non-negative integers expressed as fractions, zero is not allowed in the denominator). Each entry in each clause in the fractional weight list corresponds one-to-one to a public key appearing in a key list in an establishment event. Key lists order a key set. A weight list of clauses orders a set of rational fraction weights. Satisfaction of a fractionally weighted threshold requires satisfaction of each and every clause in the list. In other words, the clauses are logically ANDed together. Satisfaction of any clause requires that the sum of the weights in that clause that correspond to verified signatures on that event must sum to at least one. Using rational fractions and rational fraction summation avoids the problem of floating-point rounding errors and ensures exactness and universality of threshold satisfaction computations.

For example, consider the following simple single clause fractionally weighted threshold, *[1/2, 1/2, 1/2]*. Three weights mean there MUST be exactly three corresponding key pairs. Let the three keypairs in one-to-one order be denoted by the list of indexed public keys, *[A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>]. The threshold is satisfied if any two of the public keys sign because *1/2 + 1/2 = 1*. This is exactly equivalent to an integer-valued *2 of 3* threshold.

The order of appearance of the public key in a given key list and its associated threshold weight list MUST be the same.

Fractionally weighted thresholds become more interesting when the weights are not all equal or include multiple clauses. Consider the following five-element single clause fractionally weighted threshold list, *[1/2, 1/2, 1/2, 1/4, 1/4]* and its corresponding public key list, *[A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, A<sup>3</sup>, A<sup>4</sup>].  Satisfaction would be met given signatures from any two or more of A<sup>0</sup>, A<sup>1</sup>, or A<sup>2</sup> because each of these keys has a weight of 1/2 and the combination of any two or more sums to 1 or more. Alternatively, satisfaction would be met with signatures from any one or more of A<sup>0</sup>, A<sup>1</sup>, or A<sup>2</sup> and both of A<sup>3</sup>, and A<sup>4</sup> because any of those combinations would sum to 1 or more. Because participation of A<sup>3</sup> and A<sup>4</sup> is not required as long as at least two of A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> are available then A<sup>3</sup> and A<sup>4</sup> may be treated as reserve members of the controlling set of keys. These reserve members only need to participate in the unfortunate event that only one of the other three is available. The flexibility of a fractionally weighted threshold enables redundancy in the combinations of keys needed to satisfice for both day-to-day and reserve contingency use cases.

### Partial Pre-rotation Detail

Defined herein is a detailed description of the pre-rotation protocol. This protocol includes support for *partial pre-rotation* i.e. a rotation operation on a set of pre-rotated keys that may keep some keys in reserve (i.e unexposed) while exposing others as needed.

As described above, a valid ***rotation*** operation requires the satisfaction of two different thresholds. These are the *current* threshold of the given rotation (establishment) event with respect to its associated *current* public key list and the next threshold from the given rotation event's most recent prior establishment event with respect to its associated blinded next key digest list. For short, we denote the next threshold from the most recent prior establishment event as the *prior next* threshold, and the list of unblinded public keys taken from the blinded key digest list from the most recent prior establishment event as the *prior next* key list. Explication of the elements of the *prior next* key list requires exposing or unblinding the underlying public keys committed to by their corresponding digests that appear in the next key digest list of the most recent prior establishment event. The unexposed (blinded) public keys MAY be held in reserve.

More precisely, any rotation event's *current* public key list MUST include a satisfiable subset of the *prior next* key list with respect to the *prior next* threshold. In addition, any rotation event's *current* public key list MUST include a satisfiable set of public keys with respect to its *current* threshold. In other words, the current public key list must be satisfiable with respect to both the *current* and *prior next* thresholds.

To reiterate, in order to make verifiable the maintenance of the integrity of the forward commitment to the pre-rotated list of keys made by the *prior next* event, i.e. provide verifiable rotation control authority, the *current* key list MUST include a satisfiable subset of exposed (unblinded) pre-rotated next keys from the most recent prior establishment event where satisfiable is with respect to the  *prior next* threshold. Moreover, in order to establish verifiable signing control authority, the *current* key list MUST also include a satisfiable subset of public keys where satisfiable is with respect to the *current* threshold.

These two conditions are trivially satisfied whenever the *current* and *prior next* key lists and thresholds are equivalent. When both the *current* and the *prior next* key lists and thresholds are identical then the validation can be simplified by comparing the two lists and thresholds to confirm that they are identical and then confirming that the signatures satisfy the one threshold with respect to the one key list. When not identical, the validator MUST perform the appropriate set math to confirm compliance.

Recall, that the order of appearance of the public key in a given key list and its associated threshold weight list MUST be the same. The order of appearance, however, of any public keys that appear in both the *current* and *prior next* key lists MAY be different between the two key lists and hence the two associated threshold weight lists.  A validator MUST therefore confirm that the set of keys in the *current* key list truly includes a satisfiable subset of the *prior next* key list and that the *current* key list is satisfiable with respect to both the *current* and *prior next* thresholds. Actual satisfaction means that the set of attached signatures MUST satisfy both the *current* and *prior next* thresholds as applied to their respective key lists.

Suppose that the *current* public key list does not include a proper subset of the *prior next* key list. This means that no keys were held in reserve. This also means that the current key list is either identical to the prior next key list or is a superset of the prior next key list.  Nonetheless, such a rotation MAY change the *current* key list and or threshold with respect to the *prior next* key list and/or threshold as long as it meets the satisfiability constraints defined above.

If the *current* key list includes the full set of keys from the *prior next* key list then a ***full rotation*** has occurred, not a ***partial rotation*** because no keys were held in reserve or omitted. A *full rotation* MAY add new keys to the *current* key list and/or change the current threshold with respect to the *prior next* key list and threshold.

## Reserve Rotation Example

Provided here is an illustrative example to help to clarify the pre-rotation protocol, especially with regard to  and threshold satisfaction for reserve rotation.

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

The meaning of the column labels is as follows:

+ SN is the sequence number of the event. Each event uses two rows in the table.
+ Role is either Current (Crnt) or Next and indicates the role of the key list and threshold on that row.
+ Keys is the list of public keys denoted with indexed label of the keypair sequence.
+ Threshold is the threshold of signatures that must be satisfied for validity.

Commentary of each event follows:

+ (0) Inception: Five keypairs have signing authority and five other keypairs have rotation authority. Any two of the first three or any one of the first three and both the last two are sufficient. This anticipates holding the last two in reserve.

+ (1) Rotation: The first three keypairs from the prior next, A<sup>5</sup>, A<sup>6</sup>, and A<sup>7</sup>, are rotated at the new current signing keypairs. This exposes the keypairs. The last two from the prior next, A<sup>8</sup> and A<sup>9</sup>, are held in reserve. They have not been exposed are included in the next key list.

+ (2) Rotation: The prior next keypairs, A<sup>11</sup> and A<sup>12</sup> are unavalible to sign the rotation and particpate as the part of the newly current signing keys. Therefore A<sup>8</sup> and A<sup>9</sup> must be activated (pulled out of reserve) and included and exposed as both one time rotation keys and newly current signing keys. The signing authority (weight) of each of A<sup>8</sup> and A<sup>9</sup> has been increased to 1/2 from 1/4. This means that any two of the three of A<sup>10</sup>, A<sup>8</sup>, and A<sup>9</sup> may satisfy the signing threshold. Nonetheless, the rotation event \#2 MUST be signed by all three of A<sup>10</sup>, A<sup>8</sup>, and A<sup>9</sup> in order to satisfy the prior next threshold because in that threshold A<sup>8</sup>, and A<sup>9</sup>  only have a weight of 1/4.

+ (3) Rotation: The keypairs H(A<sup>16</sup>),H(A<sup>17</sup> have been held in reserve from event \#2

+ (4) Rotation: The keypairs H(A<sup>16</sup>), H(A<sup>17</sup> continue to be held in reserve.

+ (5) Rotation: The keypairs A<sup>16</sup>, and A<sup>17</sup> are pulled out of reserved and exposed in order to perform the rotation because A<sup>23</sup>, and A<sup>24</sup> are unavailable. Two new keypairs, A<sup>25</sup>, A<sup>26</sup>, are added to the current signing key list. The current signing authority of A<sup>16</sup>, and A<sup>17</sup> is none because they are assigned a weight of 0 in the new current signing threshold. For the rotation event to be valid it must be signed by A<sup>22</sup>, A<sup>16</sup>, and A<sup>17</sup> in order to satisfy the prior next threshold for rotation authority and also must be signed by any two of A<sup>22</sup>, A<sup>25</sup>, and A<sup>26</sup> in order to satisfy the new current signing authority for the event itself. This illustrates how reserved keypairs may be used exclusively for rotation authority and not for signing authority.


## Custodial Rotation Example

Provided here is an illustrative example to help to clarify the pre-rotation protocol, especially with regard to threshold satisfaction for custodial rotation.

| SN | Role | Keys | Threshold |
|:-:|:-:|--:|--:|
| 0 | Crnt | *[A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>]* | *[1/2, 1/2, 1/2]* |
| 0 | Next | *[H(A<sup>3</sup>), H(A<sup>4</sup>), H(A<sup>5</sup>)]* | *[1/2, 1/2, 1/2]* |
| 1 | Crnt | *[A<sup>3</sup>, A<sup>4</sup>, A<sup>5</sup>, A<sup>6</sup>, A<sup>7</sup>, A<sup>8</sup>]* | *[0, 0, 0, 1/2, 1/2, 1/2]* |
| 1 | Next | *[H(A<sup>9</sup>), H(A<sup>10</sup>), H(A<sup>11</sup>)]* | *[1/2, 1/2, 1/2]* |
| 2 | Crnt | *[A<sup>9</sup>, A<sup>10</sup>, A<sup>11</sup>, A<sup>12</sup>, A<sup>13</sup>, A<sup>14</sup>]* | *[0, 0, 0, 1/2, 1/2, 1/2]* |
| 2 | Next | *[H(A<sup>15</sup>), H(A<sup>16</sup>), H(A<sup>17</sup>)]* | *[1/2, 1/2, 1/2]*  |

The meaning of the column labels is as follows:

+ SN is the sequence number of the event. Each event uses two rows in the table.
+ Role is either Current (Crnt) or Next and indicates the role of the key list and threshold on that row.
+ Keys is the list of public keys denoted with indexed label of the keypair sequence.
+ Threshold is the threshold of signatures that must be satisfied for validity.


Commentary of each event follows:

+ (0) Inception: The private keys from current signing keypairs  A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> are held by the custodian of the identifier. The owner of the identifier provides the digests of the next rotation keypairs, H(A<sup>3</sup>), H(A<sup>4</sup>), and H(A<sup>5</sup>) to the custodian in order that the custodian may include them in the event and then sign the event. The owner holds the private keys from the next rotation keypairs A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup>. A self-addressing AID would then be created by the formulation of the inception event. Once formed, the custodian controls the signing authority over the identifier by virtue of holding the associated private keys for the current key list. But the owner controls the rotation authority by virtue of holding the associated private keys for the next key list. Because the controller of the rotation authority may at their sole discretion revoke and replace the keys that hold signing authority, the owner, holder of the next private keys, is ultimately in control of the identifier so constituted by this inception event.

+ (1) Rotation: The owner changes custodians with this event. The new custodian creates new current signing keypairs, A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> and holds the associated private keys. The new custodian provides the public keys A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> to the owner so that the owner can formulate and sign the rotation event that transfers signing authority to the new custodian. The owner exposes its rotation public keys,  A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup> by including them in the new current key list. But the weights of those rotation keys in the new current signing threshold are all 0 so they have no signing authority.  The owner creates a new set of next keypairs and includes their public key digests, H(A<sup>9</sup>), H(A<sup>10</sup>), H(A<sup>11</sup>) in the new next key list. The owner holds the associated private keys and thereby retains rotation authority. This event MUST be signed by any two of A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup> in order to satisfy the prior next threshold and also MUST be signed by any two A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> in order to satisfy the new current signing threshold. The new current threshold and new next threshold clearly delineate that the new custodian now holds exclusive signing authority and owner continues to retain exclusive rotation authority.

+ (2) Rotation: Change to yet another custodian following the same pattern as event \#1



# KERI Data Structures

A KERI data structure such as a key event message body may be abstractly modeled as a nested `key: value` mapping. To avoid confusion with the cryptographic use of the term *key* we instead use the term *field* to refer to a mapping pair and the terms *field label* and *field value* for each member of a pair. These pairs can be represented by two tuples e.g `(label, value)`. We qualify this terminology when necessary by using the term *field map* to reference such a mapping. *Field maps* may be nested where a given *field value* is itself a reference to another *field map*.  We call this nested set of fields a *nested field map* or simply a *nested map* for short. A *field* may be represented by a framing code or block delimited serialization.  In a block delimited serialization, such as JSON, each *field map* is represented by an object block with block delimiters such as `{}` {{RFC8259}}{{JSOND}}{{RFC4627}}. Given this equivalence, we may also use the term *block* or *nested block* as synonymous with *field map* or *nested field map*. In many programming languages, a field map is implemented as a dictionary or hash table in order to enable performant asynchronous lookup of a *field value* from its *field label*. Reproducible serialization of *field maps* requires a canonical ordering of those fields. One such canonical ordering is called insertion or field creation order. A list of `(field, value)` pairs provides an ordered representation of any field map. Most programming languages now support ordered dictionaries or hash tables that provide reproducible iteration over a list of ordered field `(label, value)` pairs where the ordering is the insertion or field creation order. This enables reproducible round trip serialization/deserialization of *field maps*. Serialized KERI data structures depend on insertion-ordered field maps for their canonical serialization/deserialization. KERI data structures support multiple serialization types, namely JSON, CBOR, MGPK, and CESR but for the sake of simplicity, we will only use JSON herein for examples {{RFC8259}}{{JSOND}}{{CBORC}}{{RFC8949}}{{MGPK}}{{CESR-ID}}. The basic set of normative field labels in KERI field maps is defined in the table in the following section.

## Field Labels for KERI Data Structures

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

A field label may have different values in different contexts but MUST not have a different field value ***type***. This requirement makes it easier to implement in strongly typed languages with rigid data structures. Notwithstanding the former, some field value types MAY be a union of elemental value types.

Because the order of appearance of fields is enforced in all KERI data structures, whenever a field appears (in a given message or block in a message) the message in which a label appears MUST provide the necessary context to fully determine the meaning of that field and hence the field value type and associated semantics.

## Compact Labels

The primary field labels are compact in that they use only one or two characters. KERI is meant to support resource-constrained applications such as supply chain or IoT (Internet of Things) applications. Compact labels better support resource-constrained applications in general. With compact labels, the over-the-wire verifiable signed serialization consumes a minimum amount of bandwidth. Nevertheless, without loss of generality, a one-to-one normative semantic overlay using more verbose expressive field labels may be applied to the normative compact labels after verification of the over-the-wire serialization. This approach better supports bandwidth and storage constraints on transmission while not precluding any later semantic post-processing. This is a well-known design pattern for resource-constrained applications.


## Special Label Ordering Requirements



## Version String Field

The version string, `v`, field MUST be the first field in any top-level KERI field map in which it appears. Typically the version string, `v`, field appears as the first top-level field in a KERI message body. This enables a RegEx stream parser to consistently find the version string in any of the supported serialization formats for KERI messages. The `v` field provides a regular expression target for determining the serialization format and size (character count) of a serialized KERI message body. A stream parser may use the version string to extract and deserialize (deterministically) any serialized KERI message body in a stream of serialized KERI messages. Each KERI message in a stream may use a different serialization type.

The format of the version string is `KERIvvSSSShhhhhh_`. The first four characters `KERI` indicate the enclosing field map serialization. The next two characters, `vv` provide the lowercase hexadecimal notation for the major and minor version numbers of the version of the KERI specification used for the serialization. The first `v` provides the major version number and the second `v` provides the minor version number. For example, `01` indicates major version 0 and minor version 1 or in dotted-decimal notation `0.1`. Likewise `1c` indicates major version 1 and minor version decimal 12 or in dotted-decimal notation `1.12`. The next four characters `SSSS` indicate the serialization type in uppercase. The four supported serialization types are `JSON`, `CBOR`, `MGPK`, and `CESR` for the JSON, CBOR, MessagePack, and CESR serialization standards respectively {{JSOND}}{{RFC4627}}{{CBORC}}{{RFC8949}}{{MGPK}}{{CESR-ID}}. The next six characters provide in lowercase hexadecimal notation the total number of characters in the serialization of the KERI message body. The maximum length of a given KERI message body is thereby constrained to be *2<sup>24</sup> = 16,777,216* characters in length. The final character `-` is the version string terminator. This enables later versions of ACDC to change the total version string size and thereby enable versioned changes to the composition of the fields in the version string while preserving deterministic regular expression extractability of the version string. Although a given KERI serialization type may use field map delimiters or framing code characters that appear before (i.e. prefix) the version string field in a serialization, the set of possible prefixes is sufficiently constrained by the allowed serialization protocols to guarantee that a regular expression can determine unambiguously the start of any ordered field map serialization that includes the version string as the first field value. Given the version string, a parser may then determine the end of the serialization so that it can extract the full serialization (KERI message body) from the stream without first deserializing it or parsing it field-by-field. This enables performant stream parsing and off-loading of KERI message streams that include any or all of the supported serialization types interleaved in a single stream.





## SAID (Self-Addressing IDentifier) Fields


Some fields in KERI data structures may have for their value a SAID. In this context, `d` is short for digest, which is short for Self-Addressing IDentifier (SAID). A SAID follows the SAID protocol {{SAID-ID}}. Essentially a SAID is a Self-Addressing IDentifier (self-referential content addressable). A SAID is a special type of cryptographic digest of its encapsulating *field map* (block). The encapsulating block of a SAID is called a SAD (Self-Addressed Data). Using a SAID as a *field value* enables a more compact but secure representation of the associated block (SAD) from which the SAID is derived. Any nested field map that includes a SAID field (i.e. is, therefore, a SAD) may be compacted into its SAID. The uncompacted blocks for each associated SAID may be attached or cached to optimize bandwidth and availability without decreasing security.

Each SAID provides a stable universal cryptographically verifiable and agile reference to its encapsulating block (serialized *field map*).

Recall that a cryptographic commitment (such as a digital signature or cryptographic digest) on a given digest with sufficient cryptographic strength including collision resistance {{HCR}}{{QCHC}} is equivalent to a commitment to the block from which the given digest was derived.  Specifically, a digital signature on a SAID makes a verifiable cryptographic non-repudiable commitment that is equivalent to a commitment on the full serialization of the associated block from which the SAID was derived. This enables reasoning about KERI data structures in whole or in part via their SAIDS in a fully interoperable, verifiable, compact, and secure manner. This also supports the well-known bow-tie model of Ricardian Contracts {{RC}}. This includes reasoning about the whole KERI data structure given by its top-level SAID, `d`, field as well as reasoning about any nested or attached data structures using their SAIDS.



## AID (Autonomic IDentifier) Fields

Some fields, such as the `i` and `di` fields, MUST each have an AID (Autonomic IDentifier) as its value. An AID is a fully qualified Self-Certifying IDentifier (SCID) as described above {{KERI}}{{KERI-ID}}. An AID MUST be self-certifying.
In this context, `i` is short for `ai`, which is short for the Autonomic IDentifier (AID). The AID given by the `i` field may also be thought of as a securely attributable identifier, authoritative identifier, authenticatable identifier, authorizing identifier, or authoring identifier.Another way of thinking about an `i` field is that it is the identifier of the authoritative entity to which a statement may be securely attributed, thereby making the statement verifiably authentic via a non-repudiable signature made by that authoritative entity as the Controller of the private key(s).




### Namespaced AIDs
Because KERI is agnostic about the namespace for any particular AID, different namespace standards may be used to express KERI AIDs within AID fields in an ACDC. The examples below use the W3C DID namespace specification with the `did:keri` method {{DIDK-ID}}. But the examples would have the same validity from a KERI perspective if some other supported namespace was used or no namespace was used at all. The latter case consists of a bare KERI AID (identifier prefix).

ToDo Explain agnosticism vis a vis namespaces
 Because AIDs may be namespaced, the essential component of an AID is the cryptographically derived Controller identifier prefix.  An AID MUST be the Controller identifier prefix.  part of a W3C Decentralized IDentifier (DID) {{W3C_DID}} or other namespace convention.

Version string namespaces the AIDs as KERI so don't need any namespacing on a per identifier basis.


## Version String Field

Get from ACDC

## Next Threshold Field

The `nt` field is next threshold for the next establishment event.


## Common Normalized ACDC and KERI Labels

`v` is the version string
`d` is the SAID of the enclosing block or map
`i` is a KERI identifier AID
`a` is the data attributes or data anchors depending on the message type




# Seals



## Digest Seal

~~~json
{
  "d": "Eabcde..."
}
~~~

## Merkle Tree Root Digest Seal

~~~json
{
  "rd": "Eabcde8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}
~~~

## Backer Seal

~~~json
{
  "bi": "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "d" : "EFGKDDA8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}

~~~

## Event Seal
~~~json
{

  "i": "Ebietyi8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM.",
  "s": "3",
  "d": "Eabcde8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}
~~~


## Last Establishment Event Seal

~~~json
{
  "i": "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
}

~~~



# Key Event Messages (Non-delegated)

Because adding the `d` field SAID to every key event message type will break all the explicit test vectors. Its no additional pain to normalize the field ordering across all message types and seals.
Originally all messages included an `i` field but that is not true anymore. So the changed field ordering is to put the fields that are common to all message types first in order followed by fields that are not common. The common fields are `v`, `t`, `d`.
The newly revised messages and seals are shown below.



## Inception Event

When the AID in the `i` field is a self-addressing self-certifying AID, the new Inception Event has two
qualified digest fields. In this case both the `d` and `i` fields must have the same value. This means the digest suite's derivation code, used for the `i` field must be the same for the `d` field.
The derivation of the `d` and `i` fields is special. Both the `d` and `i` fields are replaced with dummy `#` characters of the length of the digest to be used. The digest of the Inception event is then computed and both the `d` and `i` fields are replaced with the qualified digest value. Validation of an inception event requires examining the `i` field's derivation code and if it is a digest-type then the `d` field must be identical otherwise the inception event is invalid.

When the AID is not self-addressing, i.e. the `i` field derivation code is not a digest. Then the `i` is given its value and the `d` field is replaced with dummy characters `#` of the correct length and then the digest is computed. This is the standard SAID algorithm.


## Inception Event Message Body


~~~json
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
~~~



## Rotation Event Message Body

~~~json
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
~~~


## Interaction Event Message Body

~~~json
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
~~~


# Delegated Key Event Messages


ToDo in delegation section below. Delegated custodial example with partial rotation and using 0 fraction signing weights on exposed pre-rotated keys



## Delegated Inception Event Message Body

~~~json
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
~~~




## Delegated Rotation Event Message Body

~~~json
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
~~~


# Receipt Messages

## Non-Transferable Prefix Signer Receipt Message Body
For receipts, the `d` field is the SAID of the associated event, not the receipt message itself.


~~~json
{
  "v": "KERI10JSON00011c_",
  "t": "rct",
  "d": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "i": "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
  "s": "1"
}
~~~

## Transferable Prefix Signer Receipt Message Body
For receipts, the `d` field is the SAID of the associated event, not the receipt message itself.

~~~json
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
~~~


# Other Messages

## Query Message Message Body

~~~json
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
~~~

~~~json
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
~~~

## Reply Message Body

~~~json
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
~~~

~~~json
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
~~~

## Prod Message Body

~~~json
{
  "v": "KERI10JSON00011c_",
  "t": "prd",
  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "r": "sealed/data",
  "rr": "process/sealed/data"
  "q":
  {
     d" : "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i" : "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "s" : "5",
    "ri": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "dd": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"
  }
}
~~~


## Bare Message Body

Reference to the anchoring seal is provided as an attachment to the bare, `bre` message.
A bare, 'bre', message is a SAD item with an associated derived SAID in its 'd' field.

~~~json
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
~~~


## Exchange Message Body

~~~json
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
~~~

# Notices Embedded in Reply Messages

## Key State Notice (KSN)

~~~json
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
~~~

## Embedded in Reply

~~~json
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
~~~

## Transaction State Notice (TSN)

~~~json
{
  "v": "KERI10JSON0001b0_",
  "d": "EpltHxeKueSR1a7e0_oSAhgO6U7VDnX7x4KqNCwBqbI0",
  "i": "EoN_Ln_JpgqsIys-jDOH8oWdxgWqs7hzkDGeLWHb9vSY",
  "s": "1",
  "ii": "EaKJ0FoLxO1TYmyuprguKO7kJ7Hbn0m0Wuk5aMtSrMtY",
  "dt": "2021-01-01T00:00:00.000000+00:00",
  "et": "vrt",
  "a": {
    "s": 2,
    "d": "Ef12IRHtb_gVo5ClaHHNV90b43adA0f8vRs3jeU-AstY"
  },
  "bt": "1",
  "br": [],
  "ba": [
    "BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"
  ],
  "b": [
    "BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"
  ],
  "c": []
}
~~~

## Embedded in Reply

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rpy",
  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r" : "/ksn/registry/BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU",
  "a" :
    {
      "v": "KERI10JSON0001b0_",
      "d": "EpltHxeKueSR1a7e0_oSAhgO6U7VDnX7x4KqNCwBqbI0",
      "i": "EoN_Ln_JpgqsIys-jDOH8oWdxgWqs7hzkDGeLWHb9vSY",
      "s": "1",
      "ii": "EaKJ0FoLxO1TYmyuprguKO7kJ7Hbn0m0Wuk5aMtSrMtY",
      "dt": "2021-01-01T00:00:00.000000+00:00",
      "et": "vrt",
      "a": {
        "s": 2,
        "d": "Ef12IRHtb_gVo5ClaHHNV90b43adA0f8vRs3jeU-AstY"
      },
      "bt": "1",
      "br": [],
      "ba": [
        "BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"
      ],
      "b": [
        "BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"
      ],
      "c": []
    }
}
~~~

# Transaction Event Log Messages

## Registry Inception Event Message Body

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "vcp",
  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "i" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "ii": "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
  "s" : "0",
  "bt": "1",
  "b" : ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],
  "c" : ["NB"]
}

~~~

## Registry Rotation Event Message Body

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "vrt",
  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "i" : "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
  "s" : "2",
  "p" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "bt": "1",
  "br" : ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],
  "ba" : []
}
~~~

## Backerless ACDC Issuance Message Body

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "iss",
  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "i" : "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
  "s" : "0",
  "ri" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "dt": "2020-08-01T12:20:05.123456+00:00"
}
~~~

## Backerless ACDC Revocation Message Body

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "rev",
  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "i" : "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
  "s" : "1",
  "p" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "ri" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "dt": "2020-08-01T12:20:05.123456+00:00"
}
~~~

## Backered ACDC Issuance Message Body

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "bis",
  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "i" : "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
  "s" : "0",
  "ri" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "ra" : {
      "d": "E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o",
      "i": "EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24",
      "s": 0
  }
  "dt": "2020-08-01T12:20:05.123456+00:00"
}
~~~

### Backered ACDC Revocation Message Body

~~~json
{
  "v" : "KERI10JSON00011c_",
  "t" : "brv",
  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "i" : "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
  "s" : "1",
  "p" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
  "ri" : "EvxMACzQxU2rDj-X5SPDZYtUn56i4fjjH8yDRFRzaMfI",
  "ra" : {
      "d": "E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o",
      "i": "EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24",
      "s": 0
  }
  "dt": "2020-08-01T12:20:05.123456+00:00"
}
~~~




# Appendix: Cryptographic Strength and Security

## Cryptographic Strength

For crypto-systems with *perfect-security*, the critical design parameter is the number of bits of entropy needed to resist any practical brute force attack. In other words, when a large random or pseudo-random number from a cryptographic strength pseudo-random number generator (CSPRNG) {{CSPRNG}} expressed as a string of characters is used as a seed or private key to a cryptosystem with *perfect-security*, the critical design parameter is determined by the amount of random entropy in that string needed to withstand a brute force attack. Any subsequent cryptographic operations must preserve that minimum level of cryptographic strength. In information theory {{IThry}}{{ITPS}} the entropy of a message or string of characters is measured in bits. Another way of saying this is that the degree of randomness of a string of characters can be measured by the number of bits of entropy in that string.  Assuming conventional non-quantum computers, the convention wisdom is that, for systems with information-theoretic or perfect security, the seed/key needs to have on the order of 128 bits (16 bytes, 32 hex characters) of entropy to practically withstand any brute force attack {{TMCrypto}}{{QCHC}}. A cryptographic quality random or pseudo-random number expressed as a string of characters will have essentially as many bits of entropy as the number of bits in the number. For other crypto-systems such as digital signatures that do not have perfect security, the size of the seed/key may need to be much larger than 128 bits in order to maintain 128 bits of cryptographic strength.

An N-bit long base-2 random number has 2<sup>N</sup> different possible values. Given that no other information is available to an attacker with perfect security, the attacker may need to try every possible value before finding the correct one. Thus the number of attempts that the attacker would have to try maybe as much as 2<sup>N-1</sup>.  Given available computing power, one can easily show that 128 is a large enough N to make brute force attack computationally infeasible.

Let's suppose that the adversary has access to supercomputers. Current supercomputers can perform on the order of one quadrillion operations per second. Individual CPU cores can only perform about 4 billion operations per second, but a supercomputer will parallelly employ many cores. A quadrillion is approximately 2<sup>50</sup> = 1,125,899,906,842,624. Suppose somehow an adversary had control over one million (2<sup>20</sup> = 1,048,576) supercomputers which could be employed in parallel when mounting a brute force attack. The adversary could then try 2<sup>50</sup> * 2<sup>20</sup> = 2<sup>70</sup> values per second (assuming very conservatively that each try only took one operation).
There are about 3600 * 24 * 365 = 313,536,000 = 2<sup>log<sub>2</sub>313536000</sup>=2<sup>24.91</sup> ~= 2<sup>25</sup> seconds in a year. Thus this set of a million super computers could try 2<sup>50+20+25</sup> = 2<sup>95</sup> values per year. For a 128-bit random number this means that the adversary would need on the order of 2<sup>128-95</sup> = 2<sup>33</sup> = 8,589,934,592 years to find the right value. This assumes that the value of breaking the cryptosystem is worth the expense of that much computing power. Consequently, a cryptosystem with perfect security and 128 bits of cryptographic strength is computationally infeasible to break via brute force attack.

## Information Theoretic Security and Perfect Security

The highest level of cryptographic security with respect to a cryptographic secret (seed, salt, or private key) is called  *information-theoretic security* {{ITPS}}. A cryptosystem that has this level of security cannot be broken algorithmically even if the adversary has nearly unlimited computing power including quantum computing. It must be broken by brute force if at all. Brute force means that in order to guarantee success the adversary must search for every combination of key or seed. A special case of *information-theoretic security* is called *perfect-security* {{ITPS}}.  *Perfect-security* means that the ciphertext provides no information about the key. There are two well-known cryptosystems that exhibit *perfect security*. The first is a *one-time-pad* (OTP) or Vernum Cipher {{OTP}}{{VCphr}}, the other is *secret splitting* {{SSplt}}, a type of secret sharing {{SShr}} that uses the same technique as a *one-time-pad*.





# Conventions and Definitions

{::boilerplate bcp14-tagged}


# Security Considerations

TODO Security


# IANA Considerations

This document has no IANA actions.


--- back

# Acknowledgments
{:numbered="false"}

KERI Community at the WebOfTrust Github project.
