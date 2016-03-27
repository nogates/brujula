# Raml 1.0 (rc2) Specification support

:white_check_mark: The feature should work as expected

:warning: The feature is not completed yet (see comments)

:x: The feature is not currently supported (PRs are welcome!)


- [Raml Root](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md/#the-root-of-the-document)

Property | Status | Comments
---|---|---
description | :white_check_mark: |
(annotationName)?	| :x: |
schemas? | :warning: | Basic support. See Types support
types? | :warning: | Basic support. See Types support
traits?	| :white_check_mark: :warning: | Definition and merging support. Not fully tested though
resourceTypes?	| :white_check_mark: :warning: | Definition and merging support. Not fully tested though
annotationTypes? | :x: |
securitySchemes? | :white_check_mark: :warning: | Definition and merging support. Not fully tested though
uses? | :x: |
title	| :white_check_mark: |
version	| :white_check_mark: |
baseUri?	| :white_check_mark: |  
baseUriParameters? | :white_check_mark: |  
protocols?	| :white_check_mark: |  
mediaType? | :white_check_mark: |  
securedBy? | :warning: | Definition and merging support. Not fully tested though
/resources?	| :white_check_mark: |

* [Raml Data Types](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md/#raml-data-types)

_TBC_

* [Base URI and Base URI Parameters](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#base-uri-and-base-uri-parameters)

:white_check_mark: Parsing Base Uri and Base parameters as collection should works as expected

:warning: Template validation.

:warning: These two properties should be mutually exclusive.


* [Protocols](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#protocols)

:white_check_mark: Parsing protocols strings should work as expected

:warning: Any protocol is currently accepted as long as they are strings.

* [Default Media Type](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#default-media-type)


:white_check_mark: Parsing Media type and using it as default body key

:warning: Media type validation

* [Default Security](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#default-security)

:x: Although parsing security schemes is supported, applying their properties to the resources and methods is not yet implemented

* [Resources and Nested Resources](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#resources-and-nested-resources)


Property | Status | Comments
---|---|---
displayName | :white_check_mark: |
description | :white_check_mark: |
(annotationName)?	| :x: |
get? | :white_check_mark: |
patch? | :white_check_mark: |
put? | :white_check_mark: |
post? | :white_check_mark: |
delete? | :white_check_mark: |
options? | :white_check_mark: |
head?	| :white_check_mark: |
is?	| :white_check_mark: |
type? | :white_check_mark: |
securedBy?	| :warning: | Merging of security scheme properties is not yet implemented
uriParameters?	| :white_check_mark: |
/relativeUri as resource | :white_check_mark: |


* [Template URIs and URI Parameters](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#template-uris-and-uri-parameters)

:warning: Parsing Uri Strings and Uri parameters as collection should works as expected

:warning: Template validation.

:warning: These two properties should be mutually exclusive.

* [Methods](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#methods)


Property | Status | Comments
---|---|---
displayName | :white_check_mark: |
description | :white_check_mark: |
(annotationName)?	| :x: |
queryParameters? | :white_check_mark: |
headers? | :white_check_mark: |
queryString? | :white_check_mark: |
responses? | :white_check_mark: |
body? | :warning: | Same Type limitations
protocols? | :warning: | Protocols limitations
is?	| :white_check_mark: |
securedBy?	| :warning: | Merging of security scheme properties is not yet implemented

* [Headers](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#headers)

:white_check_mark: Parsing Headers as a properties declaration should work as expected

:warning: Needs more testing, specially using headers of array type


* [Query Strings and Query Parameters](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#query-strings-and-query-parameters)

:white_check_mark: Parsing Query Strings and Query parameters as collection should works as expected

:warning: Template validation.

:warning: These two properties should be mutually exclusive.


* [Bodies](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#bodies)

:white_check_mark: Body declarations using both strings (and therefore, default media type) and objects

:warning: Same limitations as Raml Types

* [Responses](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#responses)

:white_check_mark: Responses should work as expected


* [Resource Types and Traits](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#resource-types-and-traits)

Feature | status | comments
---|---|---
Query Parameters, Responses, and Headers collection mergin | :white_check_mark: |
usage description | :white_check_mark: |
Optional properties (`/^?/`) | :white_check_mark: :warning: | Needs testing and real examples
Algorithm of Merging Traits With Methods | :white_check_mark: :warning: | Needs testing and real examples
Parameters (both custom and reserved parameters) | :white_check_mark: |
Modifier functions | :white_check_mark: |


* [Security Schemes](https://github.com/raml-org/raml-spec/blob/raml-10-rc2/versions/raml-10/raml-10.md#security-schemes)

Type | Status | Comments
---|---|---
OAuth 1.0 | :white_check_mark: |
OAuth 2.0	| :white_check_mark: |
Basic Authentication | :white_check_mark: |
Digest Authentication | :white_check_mark: |
Pass Through| :white_check_mark: |
x-{other}	| :white_check_mark: |
null |  :white_check_mark: |


:warning: Merging security schemes is not yet implemented. :warning:


* [Annotations](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#annotations)

:x: Not even started yet :x:

* [Modularization](https://github.com/raml-org/raml-spec/blob/raml-10-rc2/versions/raml-10/raml-10.md#modularization)

Type | Status | Comments
---|---|---
`!include <absolute or relative url>` as Type Fragments | :white_check_mark: |
`!include <absolute or relative url>#<reference>` as References to inner elements | :x: |


* [Libraries](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#libraries)


:x: Not even started yet :x:

* [Overlays and Extensions](https://github.com/raml-org/raml-spec/blob/raml-10/versions/raml-10/raml-10.md#overlays-and-extensions)

:x: Not even started yet :x:
