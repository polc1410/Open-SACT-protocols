[![ubuntu](https://github.com/polc1410/Open-SACT-protocols/actions/workflows/ubuntu.yml/badge.svg)](https://github.com/polc1410/Open-SACT-protocols/actions/workflows/ubuntu.yml)

# Open SACT Protocols 

Documentation is entered into the XSD file using the
`<xsd:annotation>` and `<xsd:documentation>` tags.

e.g.

[source,xml]
```xml
<schema
  xmlns="http://www.w3.org/2001/XMLSchema"
  xmlns:cit="http://standards.iso.org/iso/19115/-3/cit/1.0"
  targetNamespace="http://standards.iso.org/iso/19110/gfc/1.1" version="1.1">
	<!-- =========================== Annotation ============================== -->
	<xs:annotation>
		<xs:documentation>
      ### Description

      GFC 1.1 is an XML Schema implementation derived from ISO ISO 19110,
      Geographic information -- Methodology for feature cataloguing. It includes
      ...
		<xs:documentation>
	<xs:annotation>
```


