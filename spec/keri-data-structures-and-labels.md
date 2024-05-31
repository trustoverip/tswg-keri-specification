## KERI data structures and labels

### KERI data structure format

A KERI data structure, such as a Key event Message body, may be abstractly modeled as a nested key: value mapping. To avoid confusion with the cryptographic use of the term key, the term field is used instead herein to refer to a mapping pair, with the terms field label and field value used to refer to each pair member. Two tuples can represent these pairs, e.g., (label, value). When necessary, this terminology is qualified by using the term field map to reference such a mapping. Field maps may be nested where a given field value is itself a reference to another field map and are referred to as a nested field map or simply a nested map for short.

A field may be represented by a framing code or block delimited serialization.  In a block delimited serialization, such as JSON, each field map is represented by an object block with block delimiters such as `{}`. Given this equivalence, the term block or nested block can be used as synonymous with field map or nested field map. In many programming languages, a field map is implemented as a dictionary or hash table. This enables performant asynchronous lookup of a field value from its field label. Reproducible serialization of field maps requires a canonical ordering of those fields. One such canonical ordering is called insertion or field creation order. A list of (field, value) pairs provides an ordered representation of any field map.

Most programming languages now support ordered dictionaries or ordered hash tables that provide reproducible iteration over a list of ordered field (label, value) pairs where the ordering is the insertion or field creation order. This enables reproducible round-trip serialization/deserialization of field maps. Serialized KERI data structures depend on insertion-ordered field maps for their canonical serialization/deserialization. KERI data structures support multiple serialization types, namely JSON, CBOR, MGPK, and CESR but for the sake of simplicity, JSON only will be used for examples. The basic set of normative field labels in KERI field maps is defined by the table below (see the next section).

#### KERI field labels for data structures

[//]: # (: KERI field labels for messages {#tbl:field-lables})

Reserved field labels in Keri messages:

|Label|Title|Description|
|---|---|---|
|`v`| Version String | enables regex parsing of field map in CESR stream |
|`t`| Message Type | three character string|
|`d`| Digest SAID | fully qualified digest of block in which it appears|
|`i`| Identifier Prefix (AID) | fully qualified primitive, Controller AID|
|`s`| Sequence Number | strictly monotonically increasing integer encoded in hex |
|`p`| Prior SAID | fully qualified digest, prior message SAID |
|`kt`| Keys Signing Threshold | hex encoded integer or fractional weight list |
|`k`| List of Signing Keys (ordered key set) | list of fully qualified primitives|
|`nt`| Next Keys Signing Threshold | hex encoded integer or fractional weight list  | 
|`n`| List of Next Key Digests (ordered key digest set) | list of fully qualified primitives digests |
|`bt`| Backer Threshold | hex encoded integer | 
|`b`| List of Backers (ordered backer set of AIDs) | list of fully qualified primitives |
|`br`| List of Backers to Remove (ordered backer set of AIDS) | list of fully qualified primitives | 
|`ba`| List of Backers to Add (ordered backer set of AIDs) | list of fully qualified primitives | 
|`c`| List of Configuration Traits/Modes | list of strings | 
|`a`| List of Anchors (seals) | list of field maps |
|`di`| Delegator Identifier Prefix (AID) | fully qualified primitive, Delegator AID| 


A field label may have different values in different contexts but must not have a different field value type. This requirement makes it easier to implement in strongly typed languages with rigid data structures. Notwithstanding the former, some field value types may be a union of elemental value types.

Because the order of appearance of fields is enforced in all KERI data structures, whenever a field appears (in a given Message or block in a Message) the message in which a label appears must provide the necessary context to determine the meaning of that field fully and hence the field value type and associated semantics.

#### Compact KERI field labels

The primary field labels are compact in that they use only one or two characters. KERI is meant to support resource-constrained applications such as supply chain or IoT (Internet of Things) applications. Compact labels better support resource-constrained applications in general. With compact labels, the over-the-wire verifiable signed serialization consumes a minimum amount of bandwidth. Nevertheless, without loss of generality, a one-to-one normative semantic overlay using more verbose expressive field labels may be applied to the normative compact labels after verification of the over-the-wire serialization. This approach better supports bandwidth and storage constraints on transmission while not precluding any later semantic post-processing. This is a well-known design pattern for resource-constrained applications.

#### Special label ordering requirements

The top-level fields of each message type shall appear in a specific order. All top-level fields are required. These are defined for each message type below.

##### Version string field

The version string, `v`, field shall be the first field in any top-level KERI field map encoded in JSON, CBOR, or MGPK as a message body [[spec: RFC4627]] [[spec: RFC4627]] [[2]] [[ref: RFC8949]] [[3]]. It provides a regular expression target for determining a serialized field map's serialization format and size (character count) constituting an KERI message body. A stream parser may use the version string to extract and deserialize (deterministically) any serialized stream of KERI message bodies. Each KERI message body in a stream may use a different serialization type. The format for the version string field value is defined in the CESR specification [[1]].

The protocol field, `PPPP` value in the version string shall be `KERI` for the KERI protocol. The version field, `VVV`, shall encode the current version of the KERI protocol [[1]].

##### Legacy version string field format

Compliant KERI version 2.XX implementations shall support the old KERI version 1.x version string format to properly verify message bodies created with 1.x format events. The old version 1.x version string format is defined in the CESR specification [[1]]. The protocol field, `PPPP` value in the version string shall be `KERI` for the KERI protocol. The version field, `vv`, shall encode the old version of the KERI protocol [[1]].

##### Message type  field

The message type, `t` field value shall be a three-character string that provides the message type. There are three classes of message types in KERI. The first class consists of key event messages. These are part of the KEL for an AID. A subclass of key event messages are Establishment Event messages, these determine the current key state. Non-establishment event messages are key event messages that do not change the key state. The second class of messages consists of Receipt messages. These are not themselves part of a KEL but convey proofs such as signatures or seals as attachments to a key event. The third class of messages consists of various message types not part of a KEL but are useful for managing the information associated with an AID.  

The message types in KERI are detailed in the table below:

| Type | Title | Class| Description |
|---|---|---|
|     |  **Key Event Messages** | |
|`icp`| Inception | Establishment Key Event | Incepts an AID and initializes its keystate |
|`rot`| Rotation | Establishment Key Event | Rotates the AID's key state |
|`ixn`| Interaction | Non-Establishment Key Event | Seals interaction data to the current key state|
|`dip`| Delegated Inception | Establishment Event | Incepts a Delegated AID and initializes its keystate  |
|`drt`| Delegated Rotation | Establishment Key Event | Rotates the Delegated AID's key state |
|     |  **Receipt Messages** | |
|`rct`| Receipt | Receipt Message | Associates a proof such as signature or seal to a key event |
|     |  **Routed Messages** | |
|`qry`| Query | Other Message | Query information associated with an AID |
|`rpy`| Reply | Other Message | Reply with information associated with an AID either solicited by Query or unsolicited |
|`pro`| Prod | Other Message | Prod (request) information associated with a Seal |
|`bar`| Bare | Other Event | Bare (response) with information associate with a Seal either solicted by Prod or unsolicited |
|`xip`| Exchange Inception | Other Message | Incepts multi-exchange message transaction, the first exchange message in a transaction set |
|`exn`| Exchange | Other Message | Generic exchange of information, may be a member of a multi-message transaction set |


#####  SAID fields

Some fields in KERI data structures may have a SAID (self-referential content addressable), as a field value. In this context, `d` is short for digest, which is short for SAID. A SAID follows the SAID protocol. A SAID is a special type of cryptographic digest of its encapsulating field map (block). The encapsulating block of a SAID is called a SAD (Self-Addressed Data). Using a SAID as a field value enables a more compact but secure representation of the associated block (SAD) from which the SAID is derived. Any nested field map that includes a SAID field (i.e., is, therefore, a SAD) may be compacted into its SAID. The uncompacted blocks for each associated SAID may be attached or cached to optimize bandwidth and availability without decreasing security.

Each SAID provides a stable universal cryptographically verifiable and agile reference to its encapsulating block (serialized field map).

A cryptographic commitment (such as a digital signature or cryptographic digest) on a given digest with sufficient cryptographic strength including collision resistance is equivalent to a commitment to the block from which the given digest was derived. Specifically, a digital signature on a SAID makes a Verifiable cryptographic non-repudiable commitment that is equivalent to a commitment on the full serialization of the associated block from which the SAID was derived. This enables reasoning about KERI data structures in whole or in part via their SAIDS in a fully interoperable, Verifiable, compact, and secure manner. This also supports the well-known bow-tie model of Ricardian Contracts [[22]]. This includes reasoning about the whole KERI data structure given by its top-level SAID, `d`, field as well as reasoning about any nested or attached data structures using their SAIDS.

The SAID, `d` field is the SAID of its enclosing block (field map); when it appears at the top level of the message, it is the SAID of the message itself.

The prior, `p` field is the SAID of a prior event message. When the prior `p` field appears in a key event message, then its value shall be the SAID of the key event message whose sequence number is one less than the sequence number of its own key event message. Only key event messages have sequence numbers. Routed messages do not. When the prior, `p` field appears in an Exchange, `exn` message then its value is the SAID of the prior exchange message in the associated exchange transaction.



##### AID fields

Some fields, such as the `i` and `di` fields, must each have an AID as its value. An AID is a fully qualified primitive as described above [[ref: KERI]] [[4]]. 
In this context, `i` is short for `ai`, which is short for the Autonomic identifier (AID). The AID given by the `i` field may also be thought of as a securely attributable identifier, authoritative identifier, authenticatable identifier, authorizing identifier, or authoring identifier. Another way of thinking about an `i` field is that it is the identifier of the authoritative entity to which a statement may be securely attributed, thereby making the statement verifiably authentic via a non-repudiable signature made by that authoritative entity as the Controller of the private key(s).

The Controller AID, `i` field value is an AID that controls its associated KEL. When the Controller Identifier AID, `i` field appears at the top-level of a key event, `[icp, rot, ixn, dip, drt]` or a receipt, `rct` message it refers to the Controller of the associated KEL. When the Controller Identifier AID, `i` field appears at the top-level of an Exchange Transaction Inception, `xip` or Exchange, `exn` message it refers Controller AID of the sender of that message. A Controller AID, `i` field may appear in other places in messages. In those cases, its meaning is determined by the context of its appearance.
The Delegator identifier AID, `di` field in a Delegated Inception, `dip` event is the AID of the Delegator.


##### Sequence number field

The Sequence Number, `s` field value is a hex encoded (no leading zeros) non-negative strictly monotonically increasing integer.  The Sequence Number, `s` field value in Inceptions, `icp` and Delegated Inception, `dip` events shall be `0` (hex encoded 0). The Sequence number value of all subsequent key events in a KEL shall be 1 greater than the previous event. The maximum value of a sequence number shall be `ffffffffffffffffffffffffffffffff` which is the hex encoding of `2^128 - 1 = 340282366920938463463374607431768211455'. This is large enough to be deemed computationally infeasible for a KEL ever to reach the maximum.


##### Key and key digest threshold fields

The Key Threshold, `kt` and Next Key Digest Threshold, `nt` field values each provide signing and rotation thresholds, respectively, for the key and next key digest lists. The threshold value may be either the simple case of a hex-encoded non-negative integer or the complex case of a list of clauses of fractional weights. The latter is called a fractionally weighted threshold.

In the simple case, given a threshold value `M` together with a total of `N` values in a key or key digest list, then the satisfaction threshold is an `M of N` threshold. This means that any set of `M` valid signatures from the keys in the list satisfies such a threshold. 

In the complex case, the field value is a list of weights that are strict decimal-encoded rational fractions. Fractionally weight thresholds are best suited for Partial, Reserve, or Custodial rotation applications. The exact syntax and satisfaction properties of fractionally weighted threshold values are described below in the section on Partial, Reserve, and Custodial rotations.

##### Key list field

The Key, `k` field value is a list of strings that are each a fully qualified public key. These provide the current signing keys for the AID associated with a KEL. The Key, `k` field value shall not be empty.


##### Next key digest list field

The Next Key Digest, `n` field value is a list of strings that are each a fully qualified digest of a public key. These provide the next rotation keys for the AID associated with a KEL. When the Next, `n` field value in an Inception or Delegated Inception event is an empty list, then the associated AID shall be deemed non-transferable, and no more key events shall be allowed in that KEL. When the Next, `n` field value in a Rotation or Delegated Rotation Event event is an empty list, then the associated AID shall be deemed abandoned, and no more key events shall be allowed in its KEL.


##### Backer threshold field

The Backer threshold, `bt` field value is a hex-encoded non-negative integer. This is the number of backers in the backer list that must support a key event for it to be valid. Witness Backers express support via a signature (endorsement) of the key event that may be conveyed via a Receipt message.  Ledger Registrar backers may express support by anchoring the key event or the SAID of the key event on the associated ledger.

Given a threshold value `M` together with a total of `N` values in the Backer list, then the satisfaction threshold is an `M of N` threshold. This means that any set of `M` valid endorsements (signatures or other) from the `N` Backers in the Backer list satisfies the threshold. The KAWA (Keri Algorithm of Witness Agreement) section provides a formula for determining a sufficient `M` to ensure agreement in spite of a number of `F` faulty backers.

When the Backer, `b` field value is an empty list, then the Backer Threshold, bt, field value shall be `0` (hex-encoded 0).

##### Backer list

The Backer, `b` field value is a list of strings that each is the fully qualified AID of a Backer. A given AID shall not appear more than once in any Backer list. These provide the current AIDs of the backers of a KEL. The list may be empty. When the Backers are Witnesses, then the AIDs themselves shall be non-transferable, fully qualified public keys. As a result, a Validator can verify a witness signature given the Witness AID as public key. Consequently, the Witness does not need a KEL because its key state is fixed and is given by its AID. Although a Witness does not need a KEL, it may have one that consists of a trivial Inception event with an empty Next, `n` field list (making it non-transferable). 


##### Backer remove list

The Backer Remove, `br` field value is a list of strings that each is the fully qualified AID of a Backer to be removed from the current Backer list. This allows Backer lists to be changed in an incremental fashion. A given AID shall not appear more than once in any Backer Remove list. The Backer Remove, `br` list appears in Rotation and Delegated Rotation events. Given such an event, the current backer list is updated by removing the AIDs in the Backer Remove, `br` list. The AIDs in the Backer Remove, `br` list shall be removed before any AIDs in the Backer Add, `ba` list are appended.

##### Backer add list

The Backer Add, `ba` field value is a list of strings that each is the fully qualified AID of a Backer to be appended to the current Backer list. This allows Backer lists to be changed in an incremental fashion. A given AID shall not appear more than once in any Backer Add list. The Backer Add, `ba` list appears in Rotation and Delegated Rotation events. Given such an event, the current backer list is updated by appending in order the AIDs from the Backer Add, `ba` list except for any AIDs that already appear in the current Backer list. The AIDs in the Backer Add, `ba` list shall not be appended until all AIDs in the Backer Add, `ba` list have been removed. 


##### Configuration traits field

The Configuration Traits, `c` field value is a list of strings. These are specially defined strings. Each string represents a configuration trait for the KEL. The following table defines the configuration traits. Some configuration traits may only appear in the Inception (delegated or not) for the KEL. Others may appear in either the inception event or rotation events (delegated or not). This is indicated in the third column. A Validator of an event shall invalidate, i.e., drop any events that do not satisfy the constraints imposed by their configuration traits. If two conflicting configuration traits appear in the same list, then the latter trait supersedes the earlier one.

|Trait|Title|Inception Only|Description|
|:---:|:---|:---:|:---|
|`EO`| Establishment Only | True |Only establishment events shall appear in this KEL |
|`DND`| Do Not Delegate | True | This KEL shall not act as a delegator of delegated AIDs|
|`NRB`| No Registrar Backers | True | This KEL shall not allow any registrar backers |
|`RB`| Registrar Backers | False | The backer list provides registrar backer AIDs |

The Establishment Only, `EO` config trait enables the Controller to increase its KELs security by not allowing interaction (non-establishment) events. This means all events must be signed by first-time, one-time pre-rotated keys. Key compromise is not possible due to repeated exposure of signing keys on interaction events. A Validator shall invalidate, i.e., drop any non-establishment events.

The Do Not Delegate, `DND` config trait enables the Controller to limit delegations entirely or limit the depth to which a given AID can delegate. This prevents spurious delegations. A delegation seal may appear in an Interaction event.  Interaction events are less secure than rotation events so this configuration trait prevents delegations.  In addition, a Delegatee holds its own private keys. Therefore, a given delegate could delegate other AIDS via interaction events that do not require the approval of its delegate. A Validator shall invalidate, i.e., drop any delegated events whose Delegator has this configuration trait.

The No Registrar Backer, `NRB` config trait enables the Controller to protect itself from an attempt to change from a witnessed secondary root of trust to a ledger secondary root of trust via a ledger registrar backer.  A Validator shall invalidate, i.e., drop any rotation events that attempt to use the Registrar Backer, `RB` configuration trait.

The Registrar Backer, `RB` config trait indicates that the backer (witness) list in the establishment event in which this trait appears provides the AIDs of ledger registrar backers. The event must also include Registrar Backer Seal for each registrar backer in the list.  A Validator shall invalidate, i.e., drop any rotation events that attempt to use this Registrar Backer, `RB` configuration trait if the inception event includes an active "No Registrar Backer", `NRB` config trait. In the event that the inception event includes both an `NRB` and `RB` configuration trait in its list, then the latter is enforced, i.e., activated, and the former is ignored.

##### Seal list field

The Seal, `a` (anchor) field value is a list of field maps representing Seals. These are defined in detail in the Seal Section below.

### Seals

The dictionary definition of the seal is "evidence of authenticity". Seals make a verifiable, nonrepudiable commitment to an external serialized data item without disclosing the item and also enable that commitment to the external data to be bound to the key state of a KEL at the location of the seal. This provides evidence of authenticity while maintaining confidentiality. This also enables the validity of the commitment to persist in spite of later changes to the key state. This is an essential feature for unbounded term but verifiable issuances. This also enables an endorsed issuance using one key state with later revocation of that issuance using a different key state. The order of appearance of seals in a KEL provides a verifiable ordering of the associated endorsements of that data, which can be used as a foundation for ordered verifiable transactions. Seals enable authenticatable transactions that happen externally to the KEL.

The collision resistance of a cryptographic strength digest makes it computationally infeasible for any other serialized data to have the same digest. Thus, a non-repudiable signature on a digest of serialized data is equivalent to such a signature on the serialized data itself. Because all key events in a KEL are signed by the controller of that KEL, the inclusion of a seal in a key event is equivalent to signing the external data but without revealing that data. When given the external data, a Validator can verify that the seal is a digest of that data and hence verify the equivalent nonrepudiable commitment. A seal, at a minimum, includes a cryptographic digest of the serialized external data, usually its SAID. The external data may itself be composed of digests of other data.

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

::: note 
  Examples in this section are not cryptographically verifiable
:::

```json
{

  "i": "Ebietyi8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM.",
  "s": "3",
  "d": "Eabcde8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}
```

#### Latest establishment event seal

The latest establishment event seal's function is similar to the event seal above except that it does not designate a specific event but merely designates that latest establishment event in the external KEL for the AID given as its `i` field value. This seal endorses or approves or commits to the key state of the latest establishment event of the external KEL. This is useful for endorsing a message.

The JSON version is shown. There is also a native CESR version of the seal.

::: note 
  Examples in this section are not cryptographically verifiable
:::

```json
{
  "i": "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
}
```

#### Registrar backer seal

When a ledger backer or backers are used as a secondary root-of-trust instead of a Witness pool, then a backer seal is required. The backer registrar is responsible for anchoring key events as transactions on the ledger. In addition to the backer seal, the establishment event that designates the backer must also include a configuration trait (see below) of `RB` for registrar backers. This indicates that the KEL is ledger registrar-backed instead of witness pool-backed.

The `bi` field value in the seal is the non-transferable identifier of the registrar backer (backer identifier). The first seal appearing in the seal list containing the event whose `bi` field matches that registrar backer identifier is the authoritative one for that registrar (in the event that there are multiple registrar seals for the same `bi` value).
The `d` field value in the seal shall be the SAID of the associated metadata SAD that provides the backer registrar metadata. The SAD may appear as the value of the seal data, `sd` field is an associated bare, `bar` message (defined later). The nested `d` said of this `sd` block in the bare message shall be the `d` field in the associated seal. This metadata could include the address used to source events onto the ledger, a service endpoint for the ledger registrar, and a corresponding ledger oracle.

To reiterate, the seal must appear in the same establishment event that designates the registrar backer identifier as a backer identifier in the event's backer's list along with the config trait `RB`.

The JSON version is shown. There is also a native CESR version of the seal.

::: note 
  Examples in this section are not cryptographically verifiable
:::

```json
{
  "bi": "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "d": "EFGKDDA8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM"
}
```

Attached bare, `bar` message.

::: note 
  Examples in this section are not cryptographically verifiable
:::

```json
{
  "v": "KERI10JSON00011c_",
  "t": "bar",
  "d": "EFGKDDA8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "r": "process/registrar/bitcoin",
  "a":
  {
    "d": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "s": "5",
    "bi", "BACDEFG8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
    "sd":
    {
       "d": "EaAoTNZH3ULvYAfSVPzhzS6b5CMaU6JR2nmwyZ-i0d8J",
       "stuff": "meta data field"
     }
  }
}
```


### Key event messages

The Key Event Message types shall be as follows `[icp, rot, ixn, dip, drt]`. 

The convention for field ordering is to put the fields that are common to all Message types first followed by fields that are not common. The common fields are `v`, `t`, and `d` in that order. A Validator may drop any provided key event message body that does not have at least one attached signature from the current controlling key state of the AID of the associated KEL.

#### Inception Event Message Body

The top-level fields of an Inception, `icp`, event message body shall appear in the following order: `[ v, t, d, i, s, kt, k, nt, n, bt, b, c, a]`. All are required. No other top-level fields are allowed. Signatures and other information may be attached to the Message body using CESR attachment codes.

::: note 
  Examples in this section are not cryptographically verifiable
:::

Inception event example:

```json
{
  "v": "KERICAAJSONAACd.",
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
  "nt": "3", // 3 of 5
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

#### Rotation Event Message Body

The top-level fields of a Rotation, `rot` event message body shall appear in the following order: `[ v, t, d, i, s, p, kt, k, nt, n, bt, br, ba, c, a]`. All are required. No other top-level fields are allowed. Signatures and other information may be attached to the Message body using CESR attachment codes.

::: note 
  Examples in this section are not cryptographically verifiable
:::

Rotation event example:

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "rot",
  "d": "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
  "i" : "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
  "s":  "1",
  "p": "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
  "kt": "2", // 2 of 3
  "k":
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3", // 3 of 5
  "n":
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
  "c": [],
  "a : []
}
```

#### Interaction Event Message Body

The top-level fields of an Interaction, `ixn` event message body shall appear in the following order: `[ v, t, d, i, s, p, a]`. All are required. No other top-level fields are allowed. Signatures and other information may be attached to the Message body using CESR attachment codes.

::: note 
  Examples in this section are not cryptographically verifiable
:::

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "ixn",
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


#### Delegated Inception Event Message Body

The top-level fields of a Delegated Inception, `dip` event message body shall appear in the following order: `[ v, t, d, i, s, kt, k, nt, n, bt, b, c, a, di]`. All are required. No other top-level fields are allowed. Signatures and other information may be attached to the Message body using CESR attachment codes. 

::: note 
  Examples in this section are not cryptographically verifiable
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

The top-level fields of a Delegated Rotation, `drt` event message body shall appear in the following order: `[ v, t, d, i, s, p, kt, k, nt, n, bt, br, ba, c, a]`. All are required. No other top-level fields are allowed. Signatures and other information may be attached to the Message body using CESR attachment codes . Notice that the Delegated Rotation event does not have a Delgator AID, `di` field. It uses the Delegator AID provided by the associated Delegated Inception event's Delegator AID, `di` field.

::: note 
  Examples in this section are not cryptographically verifiable
:::

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "drt",
  "d" : "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
  "i": "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
  "s": "1",
  "p": "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
  "kt": "2", // 2 of 3
  "k":
    [
      "DnmwyZ-i0H3ULvad8JZAoTNZaU6JR2YAfSVPzh5CMzS6b",
      "DZaU6JR2nmwyZ-VPzhzSslkie8c8TNZaU6J6bVPzhzS6b",
      "Dd8JZAoTNnmwyZ-i0H3U3ZaU6JR2LvYAfSVPzhzS6b5CM"
    ],
  "nt": "3", // 3 of 5
  "n":
    [
      "ETNZH3ULvYawyZ-i0d8JZU6JR2nmAoAfSVPzhzS6b5CM",
      "EYAfSVPzhzaU6JR2nmoTNZH3ULvwyZb6b5CMi0d8JZAS",
      "EnmwyZdi0d8JZAoTNZYAfSVPzhzaU6JR2H3ULvS6b5CM",
      "ETNZH3ULvS6bYAfSVPzhzaU6JR2nmwyZfi0d8JZ5s8bk",
      "EJR2nmwyZ2i0dzaU6ULvS6b5CM8JZAoTNZH3YAfSVPzh",
    ],
  "bt": "1",
  "br": ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],
  "ba":  ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
  "c":[],
  "a":[]
}
```


### Receipt Messages

#### Receipt Message Body

The Receipt Message types shall be as follows `[rct]`. 

The top-level fields of a Receipt, `rct` message body shall appear in the following order: `[ v, t, d, i, s]`. All are required. No other top-level fields are allowed. Signatures and Seals shall be attached to the Message body using CESR attachment codes. The Signatures or Seals are on the key event indicated by the top-level fields of the Receipt, not the Receipt message body itself.

The SAID, `d` field value is the SAID of a key event from a KEL, i.e., the key event being receipted, not the receipt message itself. 

The Identifier AID, `i` field value is the Controller AID of the KEL for the key event being receipted. 

The Sequence Number, `s` field value is the Sequence Number (hex-encoded) of the key event being receipted.

::: note 
  Examples in this section are not cryptographically verifiable
:::

Receipt example:

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "rct",
  "d": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
  "i": "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
  "s": "1"
}
```

### Routed Messages

The Routed Messages MUST include a route, `r` field, and MAY include a return route, `rr` field. The value of the route and return route fields are hierarchical. The Routed Message types shall be as follows `[qry, rpy, pro, bar, xip, exn]`. 

#### Routed Services
Routed messages enable a backend to employ routed services in support of KELs, KERLs, service endpoints, and supporting data for KERI. Using hierarchical routes to manage services is a powerful paradigm for both externally and internally facing APIs. By abstracting the route concept so that it is not tied to the narrow confines of ReST URL-based APIs and combining that abstraction with OOBIs that map transport schemes to AIDs, a KERI implementation can use routing across its distributed infrastructure as a unifying architectural property.  

For example, once a message has been received at a transport-specific port and the appropriate authentication (secure attribution) policy has been applied, it can be forwarded to a service router that distributes the message to the process that handles it. One way to effect that distribution is to prefix the external route provided in the message with an internal route that redirects the message appropriately. Thus, routing can affiliate the external-facing API with any internal-facing API. A return route enables the response to be returned despite asynchronous internal processing of the request. With this approach, no artificial synchronous state must be maintained to match outgoing and incoming messages. The internal routes can reflect different types of routing, such as intra-process, inter-process, inter-host, inter-protocol, and inter-database. 

A given implementation could have multiple types of routers, each with different properties, including security properties.

#### Routing Security

Suppose that some information needs to be protected as sealed-confidential where sealed means the information is bound to the KEL via a Seal and confidential means that the information is sensitive and must be protected. A KEL conveys two types of information:

- information that is public to the KEL, namely key state. In general, key state includes not just the current signing keys but all the associated information including thresholds for both signing keys, next pre-rotated key digests, witness pool identifiers and threshold and configuration data. Any viewer of a KEL can view this key state. Thus, the publicity of the KEL itself determines the publicity of its key state data. Other public information may be sealed to a KEL. The seal itself is a cryptographic digest that does not disclose the data. Still, if the associated data is provided elsewhere in a public manner, then the seal provides no confidentiality protection but merely a verifiable binding. An example of this type of data is a transaction event log used for a revocation registry for an ACDC.

- information that is hidden but sealed to the key state in the KEL. A seal includes a cryptographic digest of information. The presence of the seal in an event in the KEL binds that data to the key state at that event but without disclosing the information. Thus the binding is public but the information is not. When the information includes sufficient cryptographic entropy, such as through the inclusion of a salty-nonce (UUID) then an attacker can not discover that data even with a rainbow table attack. The digest effectively hides or blinds the data. This enables the data to be protected or treated as sensitive or confidential. Access to the KEL does not disclose the data. Some other exchange process is required to disclose or un-blind the data. This type is appropriate for sealed confidential information.

One security vulnerability of routed architectures is attacks on the routers themselves (especially router configuration, both static and dynamic). This vulnerability is most acute when a single router must handle information with different security properties. One solution to this problem is to use a pre-router that can redirect messages to different post-routers with different security properties.  For example, a pre-router would route sensitive data to a sensitive data post-router and non-sensitive data to a non-sensitive data post-router. This ensures that sensitive and non-sensitive data are never mixed. This enables tighter, more secure configuration control over data flows within an infrastructure. The best pre-routers act early in the routing process.

In KERI, the earliest possible place for a pre-router is at the stream parser. The stream parser does not look at routes but does look at message types. Therefore, a stream parser as a pre-router needs the sensitive data to be segregated by message type. As a result, the KERI protocol supports two classes of routed messages distinguished by message types. The first class is denoted by query-reply-exchange messages, and the second by prod-bare messages. The first class, query-reply-exchange may used for the first type of information above, namely information public to a KEL. The second class, prod-bare may be used for the second type of information, namely hidden but sealed to a KEL (sealed confidential). When a given implementation chooses to use one router for both classes of information, it must take appropriate measures to protect the router.  

Notable is that the exchange message types are only associated with the first class of data. This is because exchange messages are signed by the participating peers but not sealed. Once an exchange transaction is completed successfully, the set of messages in that transaction may be aggregated and then sealed to the participating peer's KELs. The transaction set may then be treated as sealed-confidential information, and its subsequent disclosure is managed with prod-bare messages. An exchange message may reference a data item that is sealed but the disclosure of that seal may happen with a bare, `bar` message. Often, the point of an exchange is to negotiate a chain-link confidential disclosure of information. The detailed disclosure may happen out-of-band to the exchange that negotiates the contractual commitments to that data. Those commitments use cryptographic digests that maintain confidentiality. Later disclosure of the information may be facilitated with a prod-bare pair.

#### Reserved field labels in routed messages

Reserved field labels in other KERI message body types:

|Label|Title|Description|
|---|---|---|
|`v`| Version String | enables regex parsing of field map in CESR stream |
|`t`| Message Type | three character string|
|`d`| Digest SAID | fully qualified digest of block in which it appears|
|`i`| Identifier Prefix (AID) | fully qualified primitive, Controller AID |
|`x`| Exchange Identifier (SAID) | fully qualified unique identifier for an exchange transaction |
|`p`| Prior SAID | fully qualified digest, prior message SAID |
|`dt`| Issuer relative ISO date/time string |
|`r`| Route | delimited path string for routing message|
|`rr`| Return Route | delimited path string for routing a response (reply or bare) message |
|`q`| Query Map | field map of query parameters |
|`a`| Attribute Map  | field map of message attributes | 

Unless otherwise clarified below, the definitions of the `[v, t, d, i]' field values are the same as found above in the Key Event message body section. 

##### AID fields

The Controller AID, `i` field value is an AID that controls its associated KEL. When the Controller Identifier AID, `i` field appears at the top-level of an Other Message, it refers to the Controller AID of the sender of that message. A Controller AID, `i` field may appear in other places in messages. In those cases, its meaning is determined by the context of its appearance.

##### Prior event SAID field

The prior, `p` field is the SAID of the prior exchange message in a transaction. When the prior `p` field appears in an exchange message, its value shall be the SAID of the immediately preceding exchange message in that transaction. When an exchange message is not part of a transaction, then the prior `p` field value shall be the empty string. 

##### Exchange identifier field

The Exchange Identifier SAID, `x` field value shall be the SAID, `d` field value of the first message in the set of exchange messages that constitute a transaction. The first message shall be an Exchange Inception message with type `xip`.  The SAID, `d` field value of the Exchange Inception message is strongly bound to the details of that message. As a cryptographic strength digest, it is a universally unique identifier. Therefore, the appearance of that value as the Exchange identifier, the `x` field in each subsequent exchange message in a transaction set, universally uniquely associates them with that set. Furthermore, the prior `p` field value in each subsequent exchange message verifiably orders the transaction set in a duplicity-evident way. When an exchange message is not part of a transaction, the Exchange Identifier, `x` field value, shall be the empty string. 


##### Datetime, `dt` field
The datetime, `dt` field value, if any, shall be the ISO-8601 datetime string with microseconds and UTC offset as per IETF RFC-3339.  In a given field map (block) the primary datetime will use the label, `dt`. The usage context of the message and the block where a given DateTime, `dt` field appears determines which clock (sender or receiver) the datetime is relative to.

 An example datetime string in this format is as follows:

`2020-08-22T17:50:09.988921+00:00`


##### Route field

The Route, `r` field value is a '/' delimited string that forms a path. This indicates the target of a given message that includes this field. This enables the message to replicate the function of the path in a ReST resource. When used in an Exchange Transaction Inception, `xip` or Exchange, `exn` message, the Route, `r` field value defines both the type of transaction and a step within that transaction. For example, suppose that the route path head value, `/ipex/` means that the transaction type is an issuance and presentation exchange transaction and the full route path value, `/ipex/offer` means that the message is the `offer` step in such a transaction.

##### Return Route field

The Return Route, `rr` field value is a '/' delimited string that forms a path. This allows a message to indicate how to target the associated response to the message. This enables messages on asynchronous transports to associate a given response with the message that triggered the response.

##### Query field

The Query, `q` field value is a field map (block). Its fields provide the equivalent of query parameters in a ReST resource.

##### Attribute field

The Attribute, `a` field value is a field map (block). Its fields provide the attributes conveyed by the message.



#### Query Message Body

The top-level fields of a Query, `qry` message body shall appear in the following order: `[ v, t, d, dt, r, rr, q]`. All are required. No other top-level fields are allowed. Signatures and Seals shall be attached to the Message body using CESR attachment codes. 

::: note 
  Examples in this section are not cryptographically verifiable
:::

Example Query Message

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "qry",
  "d" : "EH3ULaU6JR2nmwyvYAfSVPzhzS6b5CMZ-i0d8JZAoTNZ",
  "i" : "EAfSVPzhzS6b5CMZ-i0d8JZAoTNZH3ULaU6JR2nmwyvY",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r": "/logs",
  "rr": "/log/processor",
  "q":
  {
    "d": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i" : "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "s": "5",
    "dt": "2020-08-01T12:20:05.123456+00:00",
  }
}
```

#### Reply Message Body

The top-level fields of a Reply, `rpy` message body shall appear in the following order: `[ v, t, d, dt, r, a]`. All are required. No other top-level fields are allowed. Signatures and Seals shall be attached to the Message body using CESR attachment codes. 

::: note 
  Examples in this section are not cryptographically verifiable
:::

Reply message example:

```json
{
  "v": "KERI10JSON00011c_",
  "t": "rpy",
  "d": "EH3ULaU6JR2nmwyvYAfSVPzhzS6b5CMZ-i0d8JZAoTNZ",
  "i" : "EAfSVPzhzS6b5CMZ-i0d8JZAoTNZH3ULaU6JR2nmwyvY",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r":  "/logs/processor",
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

The top-level fields of a Prod, `pro` message body shall appear in the following order: `[ v, t, d, dt, r, rr, q]`. All are required. No other top-level fields are allowed. Signatures and Seals shall be attached to the Message body using CESR attachment codes. The fundamental difference between the Prod, `pro` and the identically structured Query, `qry` messages is that the data targeted by Prod messages is Sealed data. Whereas the data targeted by Query, `qry` messages is unconstrained.

::: note 
  Examples in this section are not cryptographically verifiable
:::

Prod message example:

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "pro",
  "d": "EH3ULaU6JR2nmwyvYAfSVPzhzS6b5CMZ-i0d8JZAoTNZ",
  "i" : "EAfSVPzhzS6b5CMZ-i0d8JZAoTNZH3ULaU6JR2nmwyvY",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r": "/sealed/data",
  "rr": "/process/sealed/data",
  "q":
  {
    "d": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
    "i": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "s": "5",
    "ri": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
    "dd": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"
  }
}
```

#### Bare Message Body

The top-level fields of a Reply, `bar` message body shall appear in the following order: `[ v, t, d, dt, r, a]`. All are required. No other top-level fields are allowed. Signatures and Seals shall be attached to the Message body using CESR attachment codes. 
The fundamental difference between the Bare, `bar` and the identically structured Reply, `rpy` messages is that the data returned by Bare messages is Sealed data. Whereas the data returned by Reply, `rpy` messages is unconstrained.

::: note 
  Examples in this section are not cryptographically verifiable
:::

Bare message example:

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "bre",
  "d": "EH3ULaU6JR2nmwyvYAfSVPzhzS6b5CMZ-i0d8JZAoTNZ",
  "i" : "EAfSVPzhzS6b5CMZ-i0d8JZAoTNZH3ULaU6JR2nmwyvY",
  "dt": "2020-08-22T17:50:12.988921+00:00",
  "r": "/process/sealed/data",
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

#### Exchange Transaction Inception Message Body

The top-level fields of an Exchange Transaction Inceipt, `xip` message body shall appear in the following order: `[ v, t, d, i, dt, r, q, a]`. All are required. No other top-level fields are allowed. Signatures and Seals shall be attached to the Message body using CESR attachment codes. 

::: note 
  Examples in this section are not cryptographically verifiable
:::

Exchange transaction inception message example:

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "xip",
  "d": "EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM",
  "i": "EBBwuFAWx3_8s5XSt_0jeyCRXq_bMF3Dd96ATbbMIZgU",
  "dt": "2021-11-12T19:11:19.342132+00:00",
  "r": "/echo/out",
  "q": {},
  "a": 
  {
    "msg": "test echo"
  }
}
```


#### Exchange Message Body

The top-level fields of an Exchange, `exn` message body shall appear in the following order: `[ v, t, d, i, x, p, dt, r, q, a]`. All are required. No other top-level fields are allowed. Signatures and Seals shall be attached to the Message body using CESR attachment codes. 

::: note 
  Examples in this section are not cryptographically verifiable
:::

Exchange message example:

```json
{
  "v": "KERICAAJSONAACd.",
  "t": "exn",
  "d": "EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM",
  "i": "EMF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_b",
  "x": "EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM",
  "p": "EDd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bMF3",
  "dt": "2021-11-12T19:11:19.342132+00:00",
  "r": "/echo/back",
  "q": {},
  "a": 
  {
    "msg": "test echo"
  }
}
```

### Signing and sealing KERI data structures

#### Indexed Signatures

Cryptographic signatures are computed on the serialization of a KERI data structure. The serializations use CESR. The signatures are also encoded in CESR and may be attached to the KERI data structure as part of a CESR stream. CESR provides special indexed signature codes for signatures that index the signature to the public key inside a key list inside a KERI establishment event message data structure. This way, only the indexed signature must be attached, not the public key needed to verify the signature. The public key is looked up from the index into the key list in the appropriate establishment event in the KEL. CESR also supports group codes that differentiate the type of indexed signatures in the group and enable pipelined extraction of the whole group for processing when attached [[1]]. Indexed signatures may be attached to both key event messages and non-key event messages. In the case, information about the associated key state for the signature may also need to be attached. This is typically a reference to the AID, sequence number, and SAID (digest), of the establishment event that determines the key state. In other cases, that latest key state is assumed and only the AID of the signer is required. In the former case, where the signature is attached to a key event, the AID may be inferred.

There are two types of attached indexed signatures: controller-indexed and witnessed-indexed. Other information may be required with the attachment the type the type of event to which the signature is attached to which AID the indexed signature belongs.

Controller-indexed signatures index into either or both the signing key list from the latest Establishment event (inception, delegated inception, rotation, delegated rotation) and the rotating key digest list from the Establishment event immediately prior to the latest Establishment event (prior next key digest list) if any. Both of these lists are strictly ordered so that only the index is needed to determine the public key. Depending on the event and the key lists, a controller-indexed signature may require one or two indices.  Controller-indexed signatures attached to Interaction events and non-key-event messages need only one index into the current signing key list from the most recent prior establishment event. Controller-indexed signatures attached to Inception events (delegated or not) need only one index into the current signing key list in the Inception event. Controller-indexed signatures attached to Rotation events (delegated or not) may need two indices, one into the signing key list of the rotation event itself and the other into the rotation key digest list from the immediately prior Establishment Event (Inception or Rotation), i.e., the prior next key digest list.

Witness-indexed signatures index into the effective witness list as established by the latest Establishment event (interaction or rotation). To clarify, witness-indexed signatures attached to any type of key event (inception, rotation, interaction, delegated inception, delegated rotation) need only one index into the current list of witnesses that is in effect as of the latest establishment event, which may or may not be the event to which the witness signature is attached. Witnesses shall use only nontransferable identifiers, which include the controlling public key. Consequently, the public key needed for witness signature verification can be extracted from the witness identifier given by the effective witness list.

CESR codes for indexed signatures support up to two indices so that, at most, one copy of an indexed signature needs to be attached. The first index is into the signing list when it's controller-indexed or into the witness list when it is witness-indexed. The second index is into the prior next key digest list when it is controller-indexed.  The CESR group code used to attach the indexed signature may vary depending on the type of event, key-event or not, and type of key event,

Recall that a prior next key digest shall be exposed as a public key in the succeeding rotation event signing key list when used to sign. Therefore, when the second index is present, it is used to look up the public key digest from the prior next key digest list, then the first index is used to look up the exposed public key from the signing key list, then the digest is verified against the exposed public key, and finally, the doubly indexed signature is verified using the exposed public key.  Verification of the digest means digesting the exposed public key using the same digest type as the prior next key digest and comparing the digests.

A set of controller-indexed signatures on an interaction or inception event (delegated or not) shall at least satisfy the current signing threshold in order for that event to be accepted as valid.

A set of controller-indexed signatures on a non-key event message (see below) shall at least satisfy the signing threshold for the establishment event indicated by the event reference in the attachment group (which may or may not be the current signing threshold) to be accepted as valid.

A set of controller-indexed signatures on a rotation event (delegated or not) shall at least satisfy both the current signing threshold and the prior next rotation threshold in order for that event to be accepted as valid.

A set of witness-indexed signatures on an interaction, inception, or rotation (delegated or not) for which the effective witness list is not empty may need to satisfy the current witness threshold (of accountable duplicity) for that event to be accepted as valid.

Events that have a non-empty set of attached signatures which set does not satisfy the required thresholds may escrow the event while waiting for other signatures to arrive either as attachments to the same version of the event or to a receipt of that event (see next section). A Validator that receives a key event or non-key-event message that does not have attached at least one verifiable Controller signature shall drop that message (i.e., not escrow or otherwise accept it). This protects the Validator from a DDoS attack with spurious unsigned messages.

Indexed signatures minimize the space requirements for signatures. The indexed signatures codes are provided in the CESR code table for indexed signatures [[1]]. Given an indexed signature, a Validator looks up the associate public key from the index into the appropriate table.

#### Non-indexed signatures

CESR also supports codes for signatures that are not indexed. In this case, additional information must be attached, such as the associated public key, in order for a validator to verify the signature. This additional information may be in the form of a CESR group defined by a CESR group code. [[1]]

#### Endorsements

Other entities, as identified by their AIDs, may wish to attach signatures on key events for a KEL where the signer's AID is neither the controlling AID of that KEL nor a witness AID of that event in that KEL. These non-controller, non-witness signatures may be called Endorsements. For example, a Watcher, when replaying events from a KEL its watches may choose to attach its own signature to the event in order to endorse or otherwise commit to that version of the event as the one the Watcher has seen. In this case, the attachment shall include at least the AID of the endorser as well as any other information needed by the Validator to securely attribute the signature to its source and key state. CESR provides group codes for attaching signature Endorsements for both transferable and non-transferable AIDs with indexed and non-indexed signatures as applicable (see CESR table).

#### Sealing

Any serialized data may be sealed in a KEL and thereby bound to the associated key state by including the associated seal in a key event. Seals shall include a cryptographic digest or digest proof of the serialized data. This may be the SAID of the data when that data follows the SAID protocol, i.e., is a SAD [[1]]. This enables later verification of the sealing when given the data. Because all events in a KEL are signed by the KEL's controller, a seal, once bound or anchored via inclusion in an event, represents an indirect signature on the sealed data. One property of cryptographic strength digests is cryptographic strength collision resistance. Such resistance makes it computationally infeasible for any two distinct (non-identical) data items to have the same digest. Therefore, a commitment via a nonrepudiable signature on a cryptographic strength digest of a data item is equivalent to a signature on the data item itself. Sealing, therefore, provides a type of indirect endorsement. The notable advantage of a seal as an indirect endorsement over a direct endorsement signature is that the seal is also bound to the key state of the endorser at the location in the KEL where the seal appears. This enables the validity of the endorsement to persist in spite of later changes to the key state. This is an essential feature for unbounded term but verifiable issuances. This also enables an endorsed issuance using one key state with later revocation of that issuance using a different key state. The order of appearance of seals in a KEL provides a verifiable ordering of the associated endorsements of that data, which can be used as a foundation for ordered verifiable transactions.

One primary use case for sealing in KERI is delegated AIDs. The Delegator (AID) approves (endorses) the associated delegation of a delegated event in the Delegatee's KEL by sealing the SAID of that delegated event in the Delegator's KEL. Because the Delegator signs the sealing event, the presence of the delegated event's SAID (cryptographic digest) in the Delegator's KEL is equivalent cryptographically to a signed endorsement by the Delegator of the delegated event itself but with the added advantage that the validity of that delegation persists in spite of changes to the key state of the Delegator.  A validator need only receive an attached reference to the delegating event that includes the seal in order to look up the seal and verify its presence. CESR provides codes for attached event seal references as well as codes for event seals.

#### Receipt Signatures

Receipt message data structures are not key events but merely reference key events (see below). A signature attached to a Receipt is not a signature on the serialized receipt data structure but is a signature on a serialization of the referenced key event. This enables the asynchronous receipt and processing of any type of signature, including controller-indexed and witness-indexed signatures. The Validator first looks up an already received copy of the referenced serialized key event and then verifies the signatures as if they had been attached to the event. Because Receipts may be more compact than the full event, they allow more efficient asynchronous distribution of signatures for events. A Validator that receives a Receipt for an event that the Validator has not yet received may escrow the Receipt and its attached signatures. This escrow, however, may be vulnerable to a DDoS attack due to spurious event references.

#### Receipt Seals

Similar to attached signatures, a Receipt message can convey an attached seal reference that allows a validator to associate the sealing event in the sealer's KEL with the reference to the sealed event given by the Receipt body. CESR provides codes for attached seal source references to receipts. [[1]]