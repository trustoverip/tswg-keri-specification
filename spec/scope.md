## Scope

Implementation design of a protocol-based decentralized key management infrastructure. The infrastructure enables secure attribution of data to a cryptographically derived identifier with strong (cryptographically verifiable) bindings between each vital component of the identifier:

- a set of asymmetric signing key pairs that are the key state
- a controlling entity that holds the private keys
- a cryptographically verifiable data structure that enables changes to that key state.

Thus, security over secure attribution is reduced to key management. This key management includes, for the first time, a practical solution to the hard problem of public key rotation. There is no reliance on trusted third parties. The resulting secure attribution is fully end-to-end verifiable.
Because of the reliance on asymmetric (public, private) digital signing key pairs, this may be viewed as a type of decentralized public key infrastructure (DPKI). The protocol supports cryptographic agility for both pre and post-quantum attack resistance. The application scope includes any electronically transmitted information. The implementation dependency scope assumes no more than cryptographic libraries that provide cryptographic strength pseudo-random number generators, cryptographic strength digest algorithms, and cryptographic strength digital signature algorithms.