[![ubuntu](https://github.com/polc1410/Open-SACT-protocols/actions/workflows/ubuntu.yml/badge.svg)](https://github.com/polc1410/Open-SACT-protocols/actions/workflows/ubuntu.yml)

# Open SACT Protocols 

Open SACT Protocols is a demonstration project for an open specification for describing systemic anti-cancer therapy (SACT) protocols in a structured, machine-readable way.  The aim being that protocols can be exchanged between prescribing systems, a national protocol platform and rendered in a readable way to end users.

The project will attempt to create a first draft of such an open standard, assisted by LLMs as part of [BOPA](https://bopa.org.uk)'s 2nd Hackathon. This site has been created to provide a holding point to use during that hackathon.

Documentation is automatically built and the pages are rendered at:  [https://polc1410.github.io/Open-SACT-protocols/](https://polc1410.github.io/Open-SACT-protocols/).  

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


