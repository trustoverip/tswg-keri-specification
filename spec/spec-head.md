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

**Participate:**

~ [GitHub repo](https://github.com/trustoverip/tswg-keri-specification)
~ [Commit history](https://github.com/trustoverip/tswg-keri-specification/commits/main)

[//]: # (\maketitle)

[//]: # (\newpage)

[//]: # (\toc)

[//]: # (\newpage)

[//]: # (::: introtitle)

## Introduction

[//]: # (:::)

The original design of the Internet Protocol (IP) has no security layer(s) [[spec: RFC0791]], providing no built-in mechanism for secure attribution to the source of an IP packet. Anyone can forge an IP packet, and a recipient may not be able to ascertain when or if the packet was sent by an imposter. This means that secure attribution mechanisms for the Internet must be overlaid. This documents presents an identifier system security overlay, called the Key Event Receipt Infrastructure (KERI) protocol, that serves as a trust spanning layer for the Internet. This overlay includes a primary root-of-trust in a Self-certifying identifier ([[ref: SCID]]) that provides a formalism for Autonomic identifiers (AIDs), Autonomic namespaces (ANs), and the basis for a universal Autonomic Identity System (AIS).

The KERI protocol provides verifiable authorship (authenticity) of any message or data item via secure cryptographically verifiable attribution to a SCID as a primary root-of-trust [[4]] [[16]] [[18]] [[19]] [[17]] [[15]]. This root-of-trust is cryptographic, not administrative, because it does not rely on any trusted third-party administrative process but may be established with cryptographically verifiable data structures. This cryptographic root-of-trust enables end verifiability where every data item may be cryptographically attributable to its source by any recipient verifier, without reliance on any infrastructure not under the verifier's ultimate control. Therefore, KERI has no security dependency on any other infrastructure and does not rely on security guarantees that may or may not be provided by the traditional internet infrastructure. This makes intervening operational infrastructure replaceable, enabling ambient verifiability (verification by anyone, anywhere, at any time). 

A SCID is strongly bound at inception to a cryptographic keypair that is self-contained unless control over the SCID needs to be transferred to a new keypair. The KERI protocol provides end-verifiable control provenance over a variant of SCID, called an Autonomic identifier (AID), via signed transfer statements in an append-only chained Key event log (KEL). The key management operation for tansferring control over an AID is implemented via a novel key [pre-rotation](#key-rotationpre-rotation) scheme [[6]]. With pre-rotation, control over an AID can be re-established by rotating to a one-time use set of unexposed but pre-committed rotation keypairs. This approach fixes the foundational flaw in traditional Public key infrastructure (PKI), which is insecure key rotation. KERI enables decentralized public key infrastructure (DPKI) that is more secure and more portable. KERI may be viewed as a viable reboot of the Web-of-Trust concept for DPKI because KERI fixes the hard problem of DPKI, which is key rotation. 

Two primary trust modalities motivated the design of the KERI protocol, namely a direct (one-to-one) mode and an indirect (one-to-any) mode. In the direct mode, two entities establish trust over AIDs via a direct exchange of their counterparts' verified signatures. In the indirect mode, trust over AIDs depends on witnessed Key event receipt logs (KERLs) as a secondary root-of-trust for validating key events. The security and accountability guarantees of indirect mode are provided by KERI’s Algorithm for Witness Agreement (KAWA) among a set of key event Witnesses. The KAWA approach may be much more performant and scalable than more complex approaches that depend on a total ordering distributed consensus ledger. Nevertheless, KERI may employ a distributed consensus ledger when other considerations make it the best choice. 

The KERI approach to Decentralized key management infrastructure (DKMI) allows for more granular composition. Moreover, because KERI is event streamed, it enables DKMI to operate in-stride with data events streaming applications such as web 3.0, IoT, and others where performance and scalability are more important. The core KERI engine is independent of identifier namespace. This makes KERI a candidate for a universal portable DKMI. This system uses the design principle of minimally sufficient means for appropriate levels of security, performance, and adoptability to be a viable candidate as the DKMI that underpins a trust-spanning layer for the Internet. 

[//]: # (\mainmatter)

[//]: # (\doctitle)

## Scope

Implementation design of a protocol-based decentralized key management infrastructure that enables secure attribution of data to a cryptographically derived identifier with strong (cryptographically verifiable) bindings between each of the identifier, a set of asymmetric signing key pairs that are the key state, a controlling entity that holds the private keys, and a cryptographically verifiable data structure that enables changes to that key state. Thus, security over secure attribution is reduced to key management. This key management includes, for the first time, a practical solution to the hard problem of public key rotation. There is no reliance on trusted third parties. The resulting secure attribution is fully end-to-end verifiable.

Because of the reliance on asymmetric (public, private) digital signing key pairs, this may be viewed as a type of decentralized public key infrastructure (DPKI). The protocol supports cryptographic agility for both pre- and post-quantum attack resistance. The application scope includes any electronically transmitted information. The implementation dependency scope assumes no more than cryptographic libraries that provide cryptographic strength pseudo-random number generators, cryptographic strength digest algorithms, and cryptographic strength digital signature algorithms.

## Normative references

The following documents are referred to in the text in such a way that some or all of their content constitutes requirements of this document. For dated references, only the edition cited applies. For undated references, the latest edition of the referenced document (including any amendments) applies.

* ISO/IEC 7498-1:1994 Information technology — Open Systems Interconnection — Basic Reference Model: The Basic Model. June 1999. Introduction. Retrieved 26 August 2022.

[//]: # (::: { #nrm:osi .normref label="ISO/IEC 7498-1:1994" })

[//]: # (ISO/IEC 7498-1:1994 Information technology — Open Systems Interconnection — Basic Reference Model: The Basic Model)

[//]: # (:::)

[a]. IETF RFC-2119 Key words for use in RFCs to Indicate Requirement Levels
[a]: https://www.rfc-editor.org/rfc/rfc2119.txt

[b]. IETF RFC-4648 Base64 
[b]: https://www.rfc-editor.org/rfc/rfc4648.txt

[c]. IETF RFC-3339 DateTime 
[c]: https://www.rfc-editor.org/rfc/rfc3339.txt
