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

Where: A<sup>0</sup> is the zero element in this sequence; (A<sup>0</sup>, a<sup>0</sup>) is the tuple form.

#### Case in which both indexes are needed

Because `i != j`, the indexed keypair for AID, `A`, is denoted by A<sup>i,j</sup> or in tuple form by (A<sup>i,j</sup>, a<sup>i,j</sup>) where the keypair that is indexed is authoritative or potentially authoritative as the i<sup>th</sup> keypair from the sequence of all keypairs that is authoritative in the j<sup>th</sup> Key state.

Example of the keypair sequence – two indices using three keypairs at each key state where each keypair is represented only by its public key:
Expressed as the list, [A<sup>0,0</sup>, A<sup>1,0</sup>, A<sup>2,0</sup>, A<sup>3,1</sup>, A<sup>4,1</sup>, A<sup>5,1</sup>].

Where: the first two Key states will consume the first six keypairs of the list.

#### Labelling the digest of the public key

With pre-rotation, each public key from the set of pre-rotated keypairs may be hidden as a qualified cryptographic digest of that public key. The digest of the public key labeled `A` is represented using the functional notation `H(A)` for hash (digest).

Example of a singly indexed digest - A<sup>i</sup> is denoted by H(A<sup>i</sup>)

Example of a doubly indexed digest - A<sup>i,j</sup> is denoted by H(A<sup>i,j</sup>)

Where:

The digest of the public key labeled `A` is represented using the functional notation `H(A)` for hash (digest).

A pre-rotated keypair is potentially authoritative for the next or subsequent Establishment event after the Establishment event when the digest of the pre-rotated keypair first appears. Therefore, its j<sup>th</sup> index value is one greater than the j<sup>th</sup> index value of the Establishment event in which its digest first appears. Let `j` represent the index of the j<sup>th</sup> Establishment event, then the pre-rotated digests appearing in that Establishment event have index `j+1`. As explained in more detail for partial Rotation of a pre-rotated set, a pre-rotated keypair from a set of two or more pre-rotated keypairs is only potentially authoritative so that its actual authoritative j<sup>th</sup> index may change when it is actually rotated in, if ever.

Example of public key and the pre-rotated digest of the next public key - [A<sup>0,0</sup>], [H(A<sup>1,1</sup>)]

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

Each Establishment event involves two sets of keys that each play a role that together establishes complete control authority over the AID associated at the location of that event in the KEL. To clarify, control authority is split between keypairs that hold signing authority and keypairs that hold rotation authority. A Rotation revokes and replaces the keypairs that hold signing authority as well as replacing the keypairs that hold rotation authority. The two set sets of keys are labeled current and next. Each Establishment event designates both sets of keypairs. The first (current) set consists of the authoritative signing keypairs bound to the AID at the location in the KEL where the Establishment event occurs. The second (next) set consists of the pre-rotated authoritative rotation keypairs that will be actualized in the next (ensuing) Establishment event. Each public key in the set of next (ensuing) pre-rotated public keys is hidden in or blinded by a digest of that key. When the Establishment event is the Inception event then the current set is the initial set. The pre-rotated next set of Rotation keypairs are one-time use only rotation keypairs but may be repurposed as signing keypairs after their one time use to rotate.

In addition, each Establishment event designates two threshold expressions, one for each set of keypairs (current and next). The current threshold determines the needed satisficing subset of signatures from the associated current set of keypairs for signing authority to be considered valid. The next threshold determines the needed satisficing subset of signatures from the associated next set of hidden keypairs for rotation authority to be considered valid. The simplest type of threshold expression for either threshold is an integer that is no greater than nor no less than the number of members in the set. An integer threshold acts as an `M of N` threshold where `M` is the threshold and `N` is the total number of keypairs represented by the public keys in the key list. If any set of `M` of the `N` private keys belonging to the public keys in the key list verifiably signs the event, then the threshold is satisfied by the Controller exercising its control authority role (signing or rotating) associated with the given key list and threshold.

To clarify, each Establishment event must include a list (ordered) of the qualified public keys from each of the current (initial) set of keypairs, a threshold for the current set, a list (ordered) of the qualified cryptographic digests of the qualified public keys from the next set of keypairs, and a threshold for the next set. Each event must also include the AID itself as either a qualified public key or a qualified digest of the Inception event.

Each Non-establishment event must be signed by a threshold-satisficing subset of private keys from the current set of keypairs from the most recent Establishment event. The following sections detail the requirements for a valid set of signatures for each type of Establishment event.

### Inception event pre-rotation

The creator of the Inception event must create two sets of keypairs, the current (initial) set and the next set. The private keys from the current set are kept as secrets. The public keys from the current set are exposed via inclusion in the Inception event. Both the public and private keys from the next set are kept as secrets, and only the cryptographic digests of the public keys from the next set are exposed via inclusion in the event. The public keys from the next set are only exposed in a subsequent Establishment event, if any.  Both thresholds are exposed via inclusion in the event.

Upon emittance of the Inception event, the current (initial) set of keypairs becomes the current set of Verifiable authoritative signing keypairs for the AID. Emittance of the Inception event also issues the identifier. Moreover, to be verifiably authoritative, the Inception event must be signed by a threshold satisficing subset of the current (initial) set of private keys. The Inception event may be verified against the attached signatures using the included current (initial) list of public keys. When self-addressing, a digest of the serialization of the Inception event provides the AID itself as derived by the SAID protocol [[ref: SAID]].

There must be only one Establishment event that is an Inception event. All subsequent Establishment events must be Rotation events.

Inception event message example:

When the AID in the `i` field is SAID, the new Inception event has two qualified digest fields. In this case, both the `d` and `i` fields must have the same value. This means the digest suite's derivation code, used for the `i` field must be the same for the `d` field.
The derivation of the `d` and `i` fields is special. Both the `d` and `i` fields are replaced with dummy `#` characters of the length of the digest to be used. The digest of the Inception event is then computed and both the `d` and `i` fields are replaced with the qualified digest value. Validation of an Inception event requires examining the `i` field's derivation code and if it is a digest-type then the `d` field must be identical otherwise the Inception event is invalid.

When the AID is not self-addressing, i.e.., the `i` field derivation code is not a digest, then the `i` is given its value and the `d` field is replaced with dummy characters `#` of the correct length and then the digest is computed., which is the standard SAID algorithm.

::: note 
  Examples in this section are not cryptographically verifiable
:::

Inception event message body

```json
{
  "v": "KERI10JSON0001ac_",
  "t": "icp",
  "d": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "i": "EL1L56LyoKrIofnn0oPChS4EyzMHEEk75INJohDS_Bug",
  "s": "0",
  "kt": "2", // 2 of 3
  "k":
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3",  // 3 of 5
  "n":
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

Unlike Inception, the creator of a Rotation event must create only one set of keypairs, the newly next set. Both the public and private keys from the newly created next set are kept as secrets and only the cryptographic digests of the public keys from the newly next set are exposed via inclusion in the event. The list of newly current public keys must include the old next threshold satisficing subset of old next public keys from the most recent prior Establishment event.  For short, the next threshold from the most recent prior Establishment event is denoted as the prior next threshold, and the list of unblinded public keys taken from the blinded key digest list from the most recent prior Establishment event as the prior next key list. The subset of old prior next keys that are included in the newly current set of public keys must be unhidden or unblinded because they appear as the public keys themselves and no longer appear as digests of the public keys. Both thresholds are exposed via inclusion in the event.

Upon emittance of the Rotation event, the newly current keypairs become the current set of Verifiable authoritative signing keypairs for the identifier. The old current set of keypairs from the previous Establishment event has been revoked and replaced by the newly current set. Moreover, to be verifiably authoritative, the rotation event must be signed by a dual threshold satisficing subset of the newly current set of private keys., meaning that the set of signatures on a Rotation event must satisfy two thresholds. These are the newly current threshold and the old prior next threshold from the most recent prior Establishment event. Therefore, the newly current set of public keys must include a satisfiable subset with respect to the old prior next threshold of public keys from the old prior next key list. The included newly current list of public keys enables verification of the Rotation event against the attached signatures.

Including the digests of the new next set of public keys in each Establishment event performs a pre-rotation operation on that set by making a Verifiable forward blinded commitment to that set. Consequently, no other key set may be used to satisfy the threshold for the next Rotation operation. Because the next set of pre-rotated keys is blinded (i.e., has not been exposed i.e., used to sign or even published) an attacker cannot forge and sign a Verifiable Rotation operation without first unblinding the pre-rotated keys. Therefore, given sufficient cryptographic strength of the digests, the only attack surface available to the adversary is a side-channel attack on the private key store itself and not on signing infrastructure. But the Controller, as the creator of the pre-rotated private keys is free to make that key store as arbitrarily secure as needed because the pre-rotated keys are not used for signing until the next Rotation.  In other words, as long as the creator keeps secret the pre-rotated public keys themselves, an attacker must attack the key storage infrastructure because side-channel attacks on signing infrastructure are obviated.

As explained in the First seen policy section, for a Validator, the first seen rule applies, that is, the first seen Version of an event is the authoritative one for that Validator. The first seen wins. In other words, the first published Version becomes the first seen. Upon Rotation, the old prior next keys are exposed but only after a new next set has been created and stored. Thus, the creator is always able to stay one step ahead of an attacker. By the time a new Rotation event is published, it is too late for an attacker to create a Verifiable Rotation event to supplant it because the original Version has already been published and may be first seen by the Validator. The window for an attacker is the network latency for the first published event to be first seen by the network of Validators. Any later, key compromise is too late.

In essence, each key set follows a Rotation lifecycle where it changes its role with each Rotation event. A pre-rotated keypair set starts as the member of the next key set holding one-time rotation control authority. On the ensuing Rotation, that keypair becomes part of the current key set holding signing control authority. Finally on the following Rotation, that keypair is discarded. The lifecycle for the initial key set in an Inception event is slightly different. The initial key set starts as the current set holding signing authority and is discarded on the ensuing Rotation event, if any.

Pre-Rotation example:

Recall that the keypairs for a given AID may be represented by the indexed letter label such as A<sup>i,j</sup><sub>k</sub> where 'i' denotes the i<sup>th</sup> keypair from the sequence of all keypairs, 'j’ denotes the j<sup>th</sup> Establishment event in which the keypair is authoritative, and 'k’ represents the k<sup>th</sup> Key event in which the keypair is authoritative. When a KEL has only Establishment events, then j = k. When only one keypair is authoritative at any given Key state then i = j.

Also, recall that a pre-rotated keypair is designated by the digest of its public key appearing in an Establishment event. The digest is denoted as H(A) or H(A<sup>i,j</sup><sub>k</sub>) in indexed form. The appearance of the digest makes a forward Verifiable cryptographic commitment that may be realized in the future when and if that public key is exposed and listed as a current authoritative signing key in a subsequent Establishment event.

The following example illustrates the lifecycle roles of the key sets drawn from a sequence of keys used for three Establishment events; one Inception followed by two Rotations. The initial number of authoritative keypairs is three and then changes to two and then changes back to three.

|Event| Current Keypairs | CT | Next Keypairs| NT |
|:-:|--:|--:|--:|--:|
|0| [A<sup>0,0</sup>, A<sup>1,0</sup>, A<sup>2,0</sup>] | 2 | [H(A<sup>3,1</sup>), H(A<sup>4,1</sup>)] | 1 |
|1| [A<sup>3,1</sup>, A<sup>4,1</sup>] | 1 | [H(A<sup>5,2</sup>), H(A<sup>6,2</sup>), H(A<sup>7,2</sup>)] | 2 |
|2| [A<sup>5,2</sup>, A<sup>6,2</sup>, A<sup>7,2</sup>]| 2 | [H(A<sup>8,3</sup>), H(A<sup>9,3</sup>), H(A<sup>10,3</sup>]| 2 |

Where:

CT means Current threshold.
NT means Next threshold.


### Fractionally weighted threshold

A simple fractionally weighted threshold consists of a list of one or more clauses where each clause is a list of rational fractions (i.e., ratios of non-negative integers expressed as fractions, where zero is not allowed in the denominator). Each entry in each clause in the fractional weight list corresponds one-to-one to a public key appearing in a key list in an Establishment event. Key lists order a key set. A list of clauses acts to order the set of rational fraction weights that appear in the list of clauses. Satisfaction of a fractionally weighted threshold requires satisfaction of every clause in the list. In other words, the clauses are logically ANDed together. Satisfaction of any clause requires that the sum of the weights in that clause that corresponds to verified signatures on that event must sum to at least a weight of one. Using rational fractions and rational fraction summation avoids the problem of floating-point rounding errors and ensures the exactness and universality of threshold satisfaction computations. In a complex fractionally weighted threshold, each weight in a clause may be either a simple weight or a weighted list of weights. This provides an additional layer of nesting of weights.

For example, consider the following simple single clause fractionally weighted threshold, [1/2, 1/2, 1/2].  Three weights mean there must be exactly three corresponding key pairs. Let the three keypairs in one-to-one order be denoted by the list of indexed public keys, [A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>]. The threshold is satisfied if any two of the public keys sign because 1/2 + 1/2 = 1. This is exactly equivalent to an integer-valued ‘2 of 3’ threshold.

The public key's appearance order in a given key list and its associated threshold weight list must be the same.

Fractionally weighted thresholds become more interesting when the weights are not all equal or include multiple clauses. Consider the following five-element single clause fractionally weighted threshold list, [1/2, 1/2, 1/2, 1/4, 1/4] and its corresponding public key list, [A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, A<sup>3</sup>, A<sup>4</sup>].  Satisfaction would be met given signatures from any two or more of A<sup>0</sup>, A<sup>1</sup>, or A<sup>2</sup> because each of these keys has a weight of 1/2 and the combination of any two or more sums to 1 or more. Alternatively, satisfaction would be met with signatures from any one or more of A<sup>0</sup>, A<sup>1</sup>, or A<sup>2</sup> and both of A<sup>3</sup>, and A<sup>4</sup> because any of those combinations would sum to 1 or more. Because participation of A<sup>3</sup> and A<sup>4</sup> is not required as long as at least two of A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> are available then A<sup>3</sup> and A<sup>4</sup> may be treated as reserve members of the controlling set of keys. These reserve members only need to participate if only one of the other three is available. The flexibility of a fractionally weighted threshold enables redundancy in the combinations of keys needed to satisfy both day-to-day and reserve contingency use cases.

As a complex example, consider the following threshold with some weights as nested weighted lists of weights.

```json
[[{"1/2": ["1/2", "1/2", "1/2"]}, "1/2", {"1/2": ["1", "1"]}], ["1/2", {"1/2": ["1", "1"]}]]
```

The corresponding public key list has 9 entries, as follows:

[A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, A<sup>3</sup>, A<sup>4</sup>,  A<sup>5</sup>, A<sup>6</sup>, A<sup>7</sup>, A<sup>0</sup>].

There are two clauses in the threshold. 

The first clause is as follows:

```json
[{"1/2": ["1/2", "1/2", "1/2"]}, "1/2", {"1/2": ["1", "1"]}]
```

The first element is a nested weighted list of three weights expressed as a field map or JSON object block with only one field. The key or label for this field is the weight on the list of weights, and the value of this field is the list of three weights as a nested fractionally weighted threshold. Therefore, this first element corresponds to the three entries A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> in the key list. Because each entry in this list has the same weight, 1/2, valid signatures for any two of A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> will satisfy the nested threshold. Satisfaction of the nested threshold contributes the weight, 1/2 that the field label provides to the satisfaction of the enclosing clause.  

The second element is a simple weight of 1/2, corresponding to A<sup>3</sup> in the key list.

The third element is a nested weighted list of two weights that correspond to A<sup>4</sup> and A<sup>5</sup> in the key list. Because each of the nested weights is 1, signatures from only one of A<sup>4</sup> and A<sup>5</sup> need to be valid to satisfy the nested threshold. Satisfaction contributes the field key weight of 1/2 to the clause.

Suppose that for the first clause, valid signatures from the following keys are provided: A<sup>0</sup>, A<sup>3</sup>, and A<sup>5</sup>. Then, the following weights are contributed for the clause: 1/2 and 1/2. These sum to 1, so the clause threshold is satisfied. Note that because only one of the three weights for the first element was satisfied, the first element did not contribute any weight to the clause satisfaction.

The second clause is as follows:

```json
["1/2", {"1/2": ["1", "1"]}]
```
The first element is a simple weight of 1/2, which corresponds to A<sup>6</sup> in the key list.

The second element is a nested weighted list of two weights that correspond to A<sup>7</sup> and A<sup>8</sup> in the key list. Because each of the nested weights is 1, signatures from only one of A<sup>7</sup> and A<sup>8</sup> need to be valid to satisfy the nested threshold. Such satisfaction contributes the field key weight of 1/2 to the clause.

Suppose that for the first clause, valid signatures from the following keys are provided: A<sup>6</sup>, and A<sup>8</sup>. Then, the following weights are contributed for the clause: 1/2 and 1/2. These sum to 1, so the clause threshold is satisfied. 

Given that signature from A<sup>0</sup>, A<sup>3</sup>, A<sup>5</sup>, A<sup>6</sup>, and A<sup>8</sup> are valid then both clauses will be satisfied so that the whole threshold is satisfied.

A use case for complex nested weighted lists of weights is when a given contributor to a fractionally weighted threshold manages its keys across multiple devices such that each device contributes a key. The total weight from the given contributor needs to be normalized to a single weight, but the satisfaction of its contribution is itself a fractionally weighted threshold across that contributor's devices.

### Partial pre-rotation

The KERI protocol includes support for Partial pre-rotation i.e., a Rotation operation on a set of pre-rotated keys that may hold back some as unexposed while exposing others as needed.

As described above, a valid Rotation operation requires the satisfaction of two different thresholds - the current threshold of the given Rotation event concerning its associated current public key list and the next threshold from the given Rotation event's most recent prior Establishment event concerning its associated blinded next key digest list. For short, the next threshold from the most recent prior Establishment event is denoted as the prior next threshold and the list of unblinded public keys taken from the blinded key digest list from the most recent prior Establishment event is the prior next key list. Explicating the elements of the prior next key list requires exposing or unblinding the underlying public keys committed to by their corresponding digests appearing in the next key digest list of the most recent prior Establishment event. The unexposed (blinded) public keys may be held in reserve.

More precisely, any Rotation event's current public key list must include a satisfiable subset of the prior next key list concerning the prior next threshold. In addition, any Rotation event's current public key list must include a satisfiable set of public keys concerning its current threshold. In other words, the current public key list must be satisfiable concerning both the current and prior next thresholds.

To reiterate, to make Verifiable the maintenance of the integrity of the forward commitment to the pre-rotated list of keys made by the prior next event, i.e., provide Verifiable rotation control authority, the current key list must include a satisfiable subset of exposed (unblinded) pre-rotated next keys from the most recent prior Establishment event where satisfiable is concerning the prior next threshold. To establish Verifiable signing control authority, the current key list must also include a satisfiable subset of public keys where satisfiable concerns the current threshold.

These two conditions are satisfied trivially whenever the current and prior next key lists and thresholds are equivalent. When both the current and the prior next key lists and thresholds are identical, the validation can be simplified by comparing the two lists and thresholds to confirm that they are identical and then confirming that the signatures satisfy the one threshold concerning the one key list. When not identical, the Validator must perform the appropriate set math to confirm compliance.

Recall that the public key's appearance order in a given key list and its associated threshold weight list must be the same. The order of appearance, however, of any public keys that appear in both the current and prior next key lists may be different between the two key lists and, hence, the two associated threshold weight lists.  A Validator, therefore, must confirm that the set of keys in the current key list truly includes a satisfiable subset of the prior next key list and that the current key list is satisfiable with respect to both the current and prior next thresholds. Actual satisfaction means that the set of attached signatures must satisfy both the current and prior next thresholds as applied to their respective key lists.

Suppose the current public key list does not include a proper subset of the prior next key list. This means that no keys were held in reserve. This also means that the current key list is either identical to the prior next key list or is a superset of the prior next key list.  Nonetheless, such a Rotation may change the current key list and or threshold with respect to the prior next key list and/or threshold as long as it meets the satisfiability constraints defined above.

If the current key list includes the full set of keys from the prior next key list, then a full Rotation has occurred, not a Partial rotation because no keys were held in reserve or omitted. A full Rotation may add new keys to the current key list and/or change the current threshold with respect to the prior next key list and threshold.


#### Reserve rotation

As described above, the pre-rotation mechanism supports partial pre-rotation or, more exactly, partial Rotation of pre-rotated keypairs. One important use case for partial Rotation is to enable pre-rotated keypairs designated in one Establishment event to be held in reserve and not exposed at the next (immediately subsequent) Establishment event. This reserve feature enables keypairs held by Controllers as members of a set of pre-rotated keypairs to be used for fault tolerance in the case of non-availability by other Controllers while at the same time minimizing the burden of participation by the reserve members. In other words, a reserved pre-rotated keypair contributes to the potential availability and fault tolerance of control authority over the AID without necessarily requiring the participation of the reserve key-pair in a Rotation until and unless it is needed to provide continuity of control authority in the event of a fault (non-availability of a non-reserved member). This reserve feature enables different classes of key Controllers to contribute to the control authority over an AID. This enables provisional key control authority. For example, a key custodial service or key escrow service could hold a keypair in reserve to be used only upon satisfaction of the terms of the escrow agreement. This could be used to provide continuity of service in the case of some failure event. Provisional control authority may be used to prevent types of common-mode failures without burdening the provisional participants in the normal non-failure use cases.

Reserve rotation example:

Provided here is an illustrative example to help to clarify the pre-rotation protocol, especially with regard to and threshold satisfaction for Reserve rotation.

| SN | Role | Keys | Threshold |
|:-:|:-:|--:|--:|
| 0 | Crnt | [A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>, A<sup>3</sup>, A<sup>4</sup>] | [1/2, 1/2, 1/2, 1/4, 1/4] |
| 0 | Next | [H(A<sup>5</sup>), H(A<sup>6</sup>), H(A<sup>7</sup>), H(A<sup>8</sup>), H(A<sup>9</sup>)] | [1/2, 1/2, 1/2, 1/4, 1/4] |
| 1 | Crnt | [A<sup>5</sup>, A<sup>6</sup>, A<sup>7</sup>] | [1/2, 1/2, 1/2] |
| 1 | Next | [H(A<sup>10</sup>), H(A<sup>11</sup>), H(A<sup>12</sup>), H(A<sup>8</sup>),H(A<sup>9</sup>)] | [1/2, 1/2, 1/2, 1/4, 1/4]  |
| 2 | Crnt | [A<sup>10</sup>, A<sup>8</sup>, A<sup>9</sup>] | [1/2, 1/2, 1/2] |
| 2 | Next | [H(A<sup>13</sup>), H(A<sup>14</sup>), H(A<sup>15</sup>), H(A<sup>16</sup>),H(A<sup>17</sup>)] | [1/2, 1/2, 1/2, 1/4, 1/4]  |
| 3 | Crnt | [A<sup>13</sup>, A<sup>14</sup>, A<sup>15</sup>] | [1/2, 1/2, 1/2] |
| 3 | Next | [H(A<sup>18</sup>), H(A<sup>19</sup>), H(A<sup>20</sup>), H(A<sup>16</sup>),H(A<sup>17</sup>)] | [1/2, 1/2, 1/2, 1/4, 1/4]  |
| 4 | Crnt | [A<sup>18</sup>, A<sup>20</sup>, A<sup>21</sup>] |[1/2, 1/2, 1/2] |
| 4 | Next | [H(A<sup>22</sup>), H(A<sup>23</sup>), H(A<sup>24</sup>), H(A<sup>16</sup>),H(A<sup>17</sup>)] | [1/2, 1/2, 1/2, 1/4, 1/4]  |
| 5 | Crnt | [A<sup>22</sup>, A<sup>25</sup>, A<sup>26</sup>, A<sup>16</sup>, A<sup>17</sup>] | [1/2, 1/2, 1/2, 0, 0] |
| 5 | Next | [H(A<sup>27</sup>), H(A<sup>28</sup>), H(A<sup>29</sup>), H(A<sup>30</sup>),H(A<sup>31</sup>)] | [1/2, 1/2, 1/2, 1/4, 1/4]  |

Where, in the column labels:

SN is the sequence number of the event. Each event uses two rows in the table.
Role is either Current (Crnt) or Next and indicates the role of the key list and threshold on that row.
Keys is the list of public keys denoted with indexed label of the keypair sequence.
Threshold is the threshold of signatures that must be satisfied for validity.

Commentary of each event:

(0) Inception: Five keypairs have signing authority and five other keypairs have rotation authority. Any two of the first three or any one of the first three and both the last two are sufficient. This anticipates holding the last two in reserve.

(1) Rotation: The first three keypairs from the prior next, A<sup>5</sup>, A<sup>6</sup>, and A<sup>7</sup>, are rotated at the new current signing keypairs. This exposes the keypairs. The last two from the prior next, A<sup>8</sup> and A<sup>9</sup>, are held in reserve. They have not been exposed are included in the next key list.

(2) Rotation: The prior next keypairs, A<sup>11</sup> and A<sup>12</sup> are unavailable to sign the Rotation and participate as the part of the newly current signing keys. Therefore, A<sup>8</sup> and A<sup>9</sup> must be activated (pulled out of reserve) and included and exposed as both one-time rotation keys and newly current signing keys. The signing authority (weight) of each of A<sup>8</sup> and A<sup>9</sup> has been increased to 1/2 from 1/4. This means that any two of the three of A<sup>10</sup>, A<sup>8</sup>, and A<sup>9</sup> may satisfy the signing threshold. Nonetheless, the Rotation event \#2 MUST be signed by all three of A<sup>10</sup>, A<sup>8</sup>, and A<sup>9</sup> in order to satisfy the prior next threshold because in that threshold A<sup>8</sup>, and A<sup>9</sup>  only have a weight of 1/4.

(3) Rotation: The keypairs H(A<sup>16</sup>), H(A<sup>17</sup>) have been held in reserve from event \#2

(4) Rotation: The keypairs H(A<sup>16</sup>), H(A<sup>17</sup>) continue to be held in reserve.

(5) Rotation: The keypairs A<sup>16</sup>, and A<sup>17</sup> are pulled out of reserved and exposed in order to perform the Rotation because A<sup>23</sup>, and A<sup>24</sup> are unavailable. Two new keypairs, A<sup>25</sup>, A<sup>26</sup>, are added to the current signing key list. The current signing authority of A<sup>16</sup>, and A<sup>17</sup> is none because they are assigned a weight of 0 in the new current signing threshold. For the Rotation event to be valid, it must be signed by A<sup>22</sup>, A<sup>16</sup>, and A<sup>17</sup> in order to satisfy the prior next threshold for rotation authority and also must be signed by any two of A<sup>22</sup>, A<sup>25</sup>, and A<sup>26</sup> in order to satisfy the new current signing authority for the event itself. This illustrates how reserved keypairs may be used exclusively for rotation authority and not for signing authority.

#### Custodial rotation

Partial pre-rotation supports another important use case that of Custodial key rotation. Because control authority is split between two key sets, the first for signing authority and the second (pre-rotated) for rotation authority, the associated thresholds and key list can be structured in such a way that a designated custodial agent can hold signing authority while the original Controller can hold exclusive rotation authority. The holder of the rotation authority can then, at any time, without the cooperation of the custodial agent, if needed,  revoke the agent's signing authority and assign it to some other agent or return that authority to itself.

Custodial rotation example:

Provided here is an illustrative example to help to clarify the pre-rotation protocol, especially about threshold satisfaction for Custodial rotation.

| SN | Role | Keys | Threshold |
|:-:|:-:|--:|--:|
| 0 | Crnt | [A<sup>0</sup>, A<sup>1</sup>, A<sup>2</sup>]| [1/2, 1/2, 1/2] |
| 0 | Next | [H(A<sup>3</sup>), H(A<sup>4</sup>), H(A<sup>5</sup>)] | [1/2, 1/2, 1/2] |
| 1 | Crnt | [A<sup>3</sup>, A<sup>4</sup>, A<sup>5</sup>, A<sup>6</sup>, A<sup>7</sup>, A<sup>8</sup>] | [0, 0, 0, 1/2, 1/2, 1/2] |
| 1 | Next | [H(A<sup>9</sup>), H(A<sup>10</sup>), H(A<sup>11</sup>)] | [1/2, 1/2, 1/2] |
| 2 | Crnt | [A<sup>9</sup>, A<sup>10</sup>, A<sup>11</sup>, A<sup>12</sup>, A<sup>13</sup>, A<sup>14</sup>] | [0, 0, 0, 1/2, 1/2, 1/2] |
| 2 | Next | [H(A<sup>15</sup>), H(A<sup>16</sup>), H(A<sup>17</sup>)] | [1/2, 1/2, 1/2]  |

Where for the column labels:

SN is the sequence number of the event. Each event uses two rows in the table.
Role is either Current (Crnt) or Next and indicates the role of the key list and threshold on that row.
Keys is the list of public keys denoted with indexed label of the keypair sequence.
Threshold is the threshold of signatures that must be satisfied for validity.


Commentary of each event:

(0) Inception: The private keys from current signing keypairs A<sup>0</sup>, A<sup>1</sup>, and A<sup>2</sup> are held by the custodian of the identifier. The owner of the identifier provides the digests of the next rotation keypairs, H(A<sup>3</sup>), H(A<sup>4</sup>), and H(A<sup>5</sup>) to the custodian in order that the custodian may include them in the event and then sign the event. The owner holds the private keys from the next rotation keypairs A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup>. A self-addressing AID would then be created by the formulation of the Inception event. Once formed, the custodian controls the signing authority over the identifier by virtue of holding the associated private keys for the current key list. But the Controller exercises the rotation authority by virtue of holding the associated private keys for the next key list. Because the Controller of the rotation authority may at their sole discretion revoke and replace the keys that hold signing authority, the owner, holder of the next private keys, is ultimately in control of the identifier so constituted by this Inception event.

(1) Rotation: The owner changes custodians with this event. The new custodian creates new current signing keypairs, A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> and holds the associated private keys. The new custodian provides the public keys A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> to the owner so that the owner can formulate and sign the Rotation event that transfers signing authority to the new custodian. The owner exposes its rotation public keys, A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup> by including them in the new current key list. But the weights of those rotation keys in the new current signing threshold are all 0 so they have no signing authority.  The owner creates a new set of next keypairs and includes their public key digests, H(A<sup>9</sup>), H(A<sup>10</sup>), H(A<sup>11</sup>) in the new next key list. The owner holds the associated private keys and thereby retains rotation authority. This event must be signed by any two of A<sup>3</sup>, A<sup>4</sup>, and A<sup>5</sup> in order to satisfy the prior next threshold and also must be signed by any two A<sup>6</sup>, A<sup>7</sup>, and A<sup>8</sup> in order to satisfy the new current signing threshold. The new current threshold and new next threshold clearly delineate that the new custodian now holds exclusive signing authority and owner continues to retain exclusive rotation authority.

 (2) Rotation: Change to yet another custodian following the same pattern as event \#1.


### Cooperative Delegation

A delegation or identifier delegation operation is provided by a pair of events. One event is the delegating event in the KEL of the Delegator and the other event is the delegated event in the KEL of the Delegatee. This pairing of events is a somewhat novel approach to delegation in that the resultant delegation requires cooperation between the Delegator and Delegatee. This is called cooperative delegation.  In a cooperative delegation, a delegating identifier approves the establishment operation (inception or rotation) of a delegated identifier. A delegating event is a type of event that includes in its data payload an event seal of the delegated event that is the target the delegation operation. This delegated event seal includes a digest of the delegated event. This verifiably seals or anchors or binds the delegated event to the KEL of the Delegator.

Likewise, the inception event of the Delegatee’s KEL includes the delegator’s AID. This binds the inception and any later establishment events in the Delegatee’s KEL to a unique delegator. A validator must be given or find the delegating seal in the delegator’s KEL before the event may be accepted as valid. The pair of bindings (delegation seal in delegator's KEL and delegator's AID in Delegatee's inception event) make the delegation cooperative. Both must participate. As will be seen later, this cooperation adds an additional layer of security to the Delegatee's KEL and provides a way to recover from pre-rotated key compromise.

Because the delegating event payload is a list, a single delegating event may perform multiple delegation operations, one per each delegation seal.

A delegation operation directly delegates an establishment event. Either an inception or rotation. Thus, a delegation operation may either delegate an inception or delegate a rotation that respectively may create and rotate the authoritative keys for delegated AID. The AID for a Delegatee (delegated identifier prefix) must be a fully qualified digest of its inception event. This cryptographically binds the Delegatee's AID to the delegator's AID.

The Delegator (controller) retains establishment control authority over the delegated identifier in that the new delegated identifier may only authorize non-establishment events with respect to itself. Delegation, therefore, authorizes revokable signing authority to some other AID. The delegated identifier has a delegated key event sequence where the inception event is a delegated inception, and any rotation events are delegated rotation events. Control authority for the delegated identifier, therefore, requires verification of a given delegated establishment event, which in turn requires verification of the delegating identifier’s establishment event.

To reiterate, because the delegating event seal includes a digest of the full delegated event, it thereby provides a cryptographic commitment to the delegated event and all of its configuration data.

A common use case of delegation would be to delegate signing authority to a new identifier prefix. The signing authority may be exercised by a sequence of revokable signing keys distinct from the keys used for the delegating identifier. This enables horizontal scalability of signing operations. The other major benefit of a cooperative delegation is that any exploiter that merely compromises only the delegate’s authoritative keys may not capture the control authority of the delegate. A successful exploiter must also compromise the delegator’s authoritative keys. Any exploit of the Delegatee is recoverable by the delegator. Conversely, merely compromising the delegator’s signing keys may not enable a delegated rotation without also compromising the Delegatee's pre-rotated keys. Both sets of keys must be compromised simultaneously. This joint compromise requirement is a distinctive security feature of cooperative delegation. Likewise, as explained later, this cooperative feature also enables recovery of a joint compromise of a delegation at any set of delegation levels by a recovery at the next higher delegation level.

### Security Properties of Pre-rotation

For many exploits, the likelihood of success is a function of exposure to continued monitoring or probing. Narrowly restricting the exposure opportunities for exploitation in terms of time, place, and method, especially if the time and place happen only once, makes exploitation extremely difficult. The exploiter has to either predict the one-time and place of that exposure or has to have continuous universal monitoring of all exposures. By declaring the very first pre-rotation in the inception event, the window for its exploit is as narrow as possible. Likewise, each subsequent rotation event is a one-time and place signing exposure of the former next (pre-rotated) rotation key.

Because each pre-rotation makes a cryptographic future commitment to a set of one-time first-time rotation keys, later exploit of the current authoritative signing key(s) may not capture key rotation authority as it has already been transferred via the pre-commitment to a new unexposed set of keys. To elaborate, the next (ensuing) pre-rotated keypairs in an inception event serve as first-time, one-time, and only-time rotation keys in the next rotation operation. Thereafter, those keypairs may be activated as the new current (root) authoritative signing key(s) but no longer have rotation authority. Likewise, the next (ensuing) pre-rotated keypairs in each rotation event serve as first-time, one-time, and only-time rotation keys in the next rotation operation. Thereafter, those keypairs may be activated as the new current (root) authoritative signing key(s) but likewise no longer have rotation authority.

In administrative identity (identifier) systems, the binding between keys, controller, and identifier may be established by administrative fiat. As a result, administrative fiat may be used as a recovery mechanism for compromised administrative keys. This may make those administrative keys relatively more exposed through multiple use of each key. In contrast, when the binding between keys, controller, and identifier is purely cryptographic (decentralized), such as is the case with this (KERI) protocol, there is no recovery mechanism once the keys for the root control authority have been fully captured. Therefore, security over those keys is more critical. As a result, in this protocol, administrative (establishment operation) keys are first-time, one-time, and only-time use as administrative keys.

#### Dead-Attacks

By definition, a Dead-attack on a given establishment event occurs after the Key state for that event has become stale because a later establishment event has rotated the sets of signing and pre-rotated keys to new sets. There are two types of Dead-attacks. The first is a compromise of the stale signing keys from a stale establishment event needed to sign non-establishment events, such as an interaction event. This is denoted as a non-establishment Dead-Attack. The second is a compromise of the stale pre-rotated keys from a stale establishment event needed to sign a subsequent establishment event, such as a rotation event. This is denoted as an establishment Dead-attack.

##### Non-establishment Dead-attack

A successful non-establishment Dead-Attack first must compromise the set of signing keys for some past but stale interaction (non-establishment) event; second, create an alternate verifiable version of that stale interaction event; and third, propagate this alternate event to a given validator before the original event has had time to propagate to that validator or any other component the validator may access as First-Seen. This looks like what is commonly known as an [[24]] on a validator. To protect against such an attack, a controller must propagate the event sufficiently widely enough that the attacker cannot eclipse all components, such as Watchers, that the validator may consult. The more distant the stale event is in the past the more difficult it becomes to mount a successful eclipse attack because the event would have more time to be universally propagated to the full network of watchers. Otherwise, the Validator would have already First-seen the original event and the compromised event would be dropped i.e., cannot be accepted as First-seen by the Validator. Network propagation times are, at most, seconds and may be as little as milliseconds, which only opens a very short time window of how stale a stale event may be before it is sufficiently protected from any such eclipse attack. Should the event also be protected with a witness pool, then the attacker must compromise not only the stale signing keys but also a threshold satisficing number of witnesses protecting that event. This could make a non-establishment attack practically infeasible.

The one exception would be the case where the event's key state has only a single signing key and a single prior pre-rotated key that has been repurposed as the single signing key, which the signing key has been compromised. In this case, the attacker could then attempt an establishment Dead-attack by creating a compromised state rotation event using the stale compromised signing key as a compromised rotation key in order to compromise the immediately prior establishment event. The attacker can then rotate in a set of witnesses under its control so that witness compromise is not needed. Notwithstanding this exploit, as the next paragraphs explain, the controller is still protected against an establishment Dead-attack as long as the original event has had time to propagate as First-seen to any component, such as a watcher the Validator chooses to consult.

##### Establishment Dead-attack

A successful establishment Dead-attack must first compromise the set of current signing keys for some past stale rotation event, second, create an alternate verifiable version of that stale rotation event, and third, propagate this alternate event to a given validator before the original event has had time to propagate to that validator or any other component the validator may access as First-Seen. The pre-rotation's pre-commitment to the next set of keys means that no other successful establishment Dead-Attack-based exploit is possible. A subsequent rotation event that was not signed with the pre-committed next keys from the prior rotation would not be verifiable.  Unlike a non-establishment dead attack, the attacker could rotate in a set of witnesses under its control so that witness compromise is not needed, i.e., the witness pool provides no additional protection. One way to better protect against this exploit is to use partial rotation so that pre-rotated keys are not repurposed as singing keys for interaction events but are first-time, one-time, only-time exposed for signing a rotation. This minimizes the exposure of pre-rotated keys as signing keys and, therefore, minimizes the ability of an attacker to mount an establishment Dead-attack, which requires compromising rotation keys.

To elaborate, compromising a set of keys after the first use, given best practices for key storage and key signing, may be very difficult, but it is still possible. One way to minimize the potential of exploit is to only use rotation keys once using partial rotation. Nonetheless, sometime later, should an attack succeed in compromising a set of stale set of pre-rotated keys and thereby creating an alternate but verifiable event. This may be an eventuality for all non-quantum safe, stale signing and rotation keys.

In any case, a validator or other component may still be protected as long as the original version of the event has had time to propagate as First-Seen to that validator or other component (such as witness, watcher, juror, judge) that the validator may access. Therefore, in order to successfully detect duplicity and thereby be protected, any validator needs merely to compare any later copy of the event with any copy of the original event as propagated to any component it may consult. The attacker, therefore, must get ahead of the propagation of a past rotation event. A later surprise quantum attack provides no advantage in this case since the event has already propagated and is already First-seen. The compromised event would be detectable as duplicitous and dropped.

To restate, as already described above, this type of attack looks like what is commonly known as an [[24]] on a validator. To protect against such an attack, a controller must propagate the event sufficiently widely enough that the attacker cannot eclipse all components, such as Watchers, that the validator may consult. The more distant the stale event is in the past the more difficult it becomes to mount a successful eclipse attack because the event would have more time to be universally propagated to the full network of watchers. Otherwise, the Validator would have already First-seen the original event and the compromised event would be dropped i.e., cannot be accepted as First-seen by the Validator. Network propagation times are, at most, seconds and may be as little as milliseconds, which only opens a very short time window of how stale a stale event may be before it is sufficiently protected from any such eclipse attack.

To further elaborate, recall that the original version of the event is the one that first exposes the keys to potential compromise. This may only allow a very narrow window of time for an attacker to get ahead of that event’s propagation. In other words, in order for a Dead-Attack to be successful, it must completely avoid detection as duplicitous. To do this, it must either prevent the validator from gaining access to any original copy of the key event history, i.e., an eclipse attack or, equivalently, must first destroy all extant copies of the original key event history accessible to the validator, i.e., some type of deletion attack. This may be very difficult given a sufficiently widespread watcher network.

Moreover, a controller merely needs to receive confirmation via a signed receipt by a validator of its last rotation event to ensure that that validator is protected from future exploitation via deletion Dead Attack. In this case, the controller can replay back to the Validator the Validator's non-reputable signed receipt to recover the Validator from a deletion attack. Likewise, if the controller itself keeps redundant copies of its events, then a deletion attack must completely delete every single copy, otherwise the deletion attack is detectable. A partial deletion attack will always be detectable.

To summarize, an alternate but verifiable version of a rotation event would be detectably inconsistent, i.e., duplicitous with the original version of the event stored in any copy of the original key event history (KEL/KERL). Consequently, any validator (or other component or entity) that has access to the original key event history is protected from harm due to a later successful compromise of the keys of any event already in that history i.e., any form of Dead-attack.

As a special case, to even better protect the initial keypairs in an inception event from a Dead-attack, a controller may coincidently create both the inception event and an immediately following rotation event and then emit them together as one. The initial (original incepting) keypairs may be discarded (including removing all traces from signing infrastructure) after creation but before emission of the coincident events, thereby minimizing the exposure to Dead Attack of these initial keypairs.

![Establishment Dead-Attack](https://raw.githubusercontent.com/trustoverip/tswg-keri-specification/revised-format/images/ExploitDead.png)

**Figure:** *Establishment Dead-Attack*

#### Live-Attacks

There are two types of Live-Attacks. The first is a compromise of the current signing keys used to sign non-establishment events, such as an interaction event. This is denoted as a non-establishment Live-Attack. The second is a compromise of the current pre-rotated keys needed to sign a subsequent establishment event, such as a rotation event. This is denoted as an establishment Live-Attack.

##### Non-establishment Live-attack

A successful non-establishment Live-Attack means that the attacker is able to verifiably sign and propagate a new interaction event. When the interaction event is also protected by a witness pool with a threshold, then the attacker must also compromise a threshold satisficing number of witnesses, or else the event is not verifiable by any validator. If the witness pool is setup to accept events when merely signed by the controller then the witness pool provides no additional protection from Live-attack. The witness pool merely provides reliable fault tolerant high availability. However, when the members of the witness pool are set up to only accept local (i.e., protected) sourced events from their controller using some unique (per-witness) secondary authentication mechanism, then merely compromising the signing keys is not enough.  The attacker must also compromise a threshold satisficing number of unique secondary authentication factors of the witnesses. A combined primary set of multi-sig controller authentication factors and secondary multi-factor witness authentication factors can make a successful non-establishment Live-attack exploit practically infeasible. Notwithstanding this difficulty, even in the case where a successful non-establishment Live-attack succeeds, control over the identifier can be recovered using a recovery rotation. For more detail see the Annex or Recovery and Reconciliation.

#### Establishment Live-attack

A successful establishment Live-Attack means that the attacker somehow compromises the unexposed next (pre-rotated) set of keys from the latest rotation event before that event has been propagated. This means compromise must occur at or before the time of the first use of the keys to sign the establishment event itself. Such a compromise is extremely difficult and the primary reason for pre-rotation is to mitigate the possibility of an establishment Live-attack in the first place.  In an establishment live attack, the witness pool provides no additional security because the compromised rotation event can rotate in new witnesses under the control of the attacker. One way to mitigate establishment Live-attack is to use a thresholded multi-sig set of pre-rotated keys.

Notwithstanding any mitigations, assuming a successful compromise of the pre-rotated keys, duplicity detection with or without witness protection may not protect against a resulting establishment live attack. This is because such a Live-attack would be able to create a new verifiable rotation event with next keys and new witnesses under the attacker's control and propagate that event in advance of a new rotation event created by the original controller. Such a successful Live-attack exploit may effectively and irreversibly capture control of the identifier. Moreover, in the case of a successful Live-attack exploit, new rotation events from the original controller would appear as duplicitous to any validator or other component that already received the exploited rotation event and accepted it as the First-seen version of that event. Consequently, protection from establishment Live-attack exploits comes exclusively from the difficulty of compromising a set of pre-rotated keys before or at the time of their first use (exposure).

To elaborate, a successful live exploit must compromise the unexposed next set of private keys from the public-keys declared in the latest rotation. Assuming the private keys remain secret, a compromise must come either by brute force inversion of the one-way digest function protecting the public keys and then by brute force inversion of the one-way scalar multiplication function that generates the public key from the private keys or by a side-channel attack at the first-use of the private keys to sign the rotation event. By construction, no earlier signing side-channel attack is possible. This makes successful Live-attack exploits from such side-channel attacks extremely difficult.

Given the cryptographic strength of the key generation algorithm, a successful brute force live attack may be computationally infeasible.  Hiding the unexposed next (pre-rotated) public keys behind cryptographic strength digests provides an additional layer of protection not merely from pre-quantum brute force attacks but also from surprise post-quantum brute force attacks. In this case, a brute force attack would first have to invert the post-quantum resistant one-way hashing function used to create the digest before it may attempt to invert the one-way public key generation algorithm. Moreover, as computation capability increases, the controller can merely rotate to correspondingly strong quantum-safe cryptographic one-way functions for key generation. This makes brute force live attack computationally infeasible indefinitely. For more detail see the Annex on Cryptographic Strength.

![Establishment Live-Attack](https://raw.githubusercontent.com/trustoverip/tswg-keri-specification/revised-format/images/ExploitLive.png)

**Figure:** *Establishment Live-Attack*

#### Delegated Event Live-attacks

Notwithstanding the foregoing section, delegated events are provided with an additional layer of protection against and an additional means of recovery from establishment Live-attack exploits.  As described previously, a delegated event is only valid if the validator finds an anchored delegation seal of the delegated establishment event in the delegator's KEL. This means that notwithstanding a successful compromise of the Delegatee's current set of pre-rotated keys, the attacker is not able to issue a valid compromised rotation event. The attacker must also issue a delegation seal of the compromised rotation event in the delegator's KEL. This means the attacker must either induce the delegator to issue a seal or must also compromise the delegator's signing keys. This provides an additional layer of protection from establishment Live-attack for delegated events.

Moreover, anytime the sealing (anchoring) event in the delegator's KEL may be superseded by another event, then the delegator and Delegatee may execute a superseding recovery of an establishment event in the Delegatee's KEL and thereby recover from the establishment Live-attack. This is not possible with an establishment Live-attack on a non-delegated event.


[//]: # (\backmatter)

[//]: # (# Cryptographic strength and security {#sec:annexA .informative})