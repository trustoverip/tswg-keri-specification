::: introtitle
Introduction
:::

This document presents identity system-based secure overlay for the Internet.  This system is based on a Key Event Receipt Infrastructure (KERI) or the KERI protocol {{KERI}}{{KERI-ID}}{{RFC0791}}.   The primary key management operation is key Rotation (transference) via a novel key pre-rotation scheme as the background for the acronym KERI {{DAD}}{{KERI}}.

The main motivation for this work is to provide a secure decentralized foundation of attributional trust for the Internet as a trustable spanning layer in the form of an identifier system security overlay. This identifier system security overlay provides verifiable authorship (authenticity) of any message or data item via secure (cryptographically verifiable) attribution to a cryptonymous (cryptographic strength pseudonymous self-certifying identifier (SCID){{KERI}}{{UIT}}{{SCPK}}{{SFS}}{{SCPN}}{{SCURL}}{{PKI}}.

Thus, KERI addresses a major flaw in the original design of the Internet Protocol (IP) which is that the Internet has no security layer(s) (i.e., Session or Presentation layers) to provide interoperable verifiable authenticity {{RFC0791}}. There was no built-in mechanism for secure attribution to the source of a packet. Specifically, the IP packet header includes a source address field that indicates the IP address of the device that sent the packet. Anyone (including any intermediary) can forge an IP packet. Because the source address of such a packet can be undetectably forged, a recipient may not be able to ascertain when or if the packet was sent by an imposter.  This means that secure attribution mechanisms for the Internet must be overlaid (bolted-on). KERI provides such a security overlay, specifically an identifier system security overlay.
