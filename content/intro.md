Open SACT Protocols is a demonstration project for an open specification for describing systemic anti-cancer therapy (SACT) protocols in a structured, machine-readable way.  The aim being that protocols can be exchanged between prescribing systems, a national protocol platform and rendered in a readable way to end users.

The project will attempt to create a first draft of such an open standard, assisted by LLMs as part of [BOPA](https://bopa.org.uk)'s 2nd Hackathon. This site has been created to provide a holding point to use during that hackathon.

Drugs are identified using **dm+d VTM** codes, and units and routes use
**SNOMED CT** concepts.

## How to use this site

- The **Schemas** section holds the XML Schema documentation, with diagrams.
- The **Documents** section holds any written standards.
- Source files live in the [GitHub repository](https://github.com/polc1410/Open-SACT-protocols) if you would like to contribute changes you can do so by submitting a pull request to that git repository.
- If you are able to provide some source data this would be *incredibly* useful. Further information is described below.

## Provision of Source Data

Ideally system vendors would all work together to create an open standard. However, there is an element of commercial competition which may make that difficult.  If you are able to export a protocol digitally please do so and upload it to the [GitHub repository](https://github.com/polc1410/Open-SACT-protocols) in the "example protocols" folder, creating a new sub folder for your example.  If you cannot provide a digital export, but can provide the SQL tables (or a suitable selection from them) then these tables can be provided as either a SQL database dump, CSV files, or potentially any other common format.  If you know how the files in the table relate this would be helpful. If not we hope the LLMs might figure it out. 

## Safety

This is a proof of concept.  No patient data is being used.  No live clinical system is being used. 

## What might the structure involve?

### XML Files

There are a couple of different file formats that could be used for information exchange.  FOr this pilot, we are proposing to use XML files.  For some this might be the very first time they've seen an XML file, although since the internet HTML format is effectively a form of XML it will not be the first time they've ever used XML based files!

A basic XML file is some information contained in a tag like this:

```xml
<information_label>
  The information
</information_label>
```

These tags can be combined to create some structure to the data for instance, a XML file describing drugs might contain the drug, its units of measure, the route it can be administered through.  Here is an example for 2 drugs - aspirin and digoxin following that approach:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<drugs>
  <drug>
    <name>Aspirin</name>
    <unitsOfMeasure>
      <unit>milligram</unit>
    </unitsOfMeasure>
    <routes>
      <route>Oral route</route>
      <route>Rectal route</route>
    </routes>
  </drug>
  <drug>
    <name>Digoxin</name>
    <unitsOfMeasure>
      <unit>microgram</unit>
      <unit>millilitre</unit>
    </unitsOfMeasure>
    <routes>
      <route>Oral</route>
      <route>Intravenous</route>
    </routes>
  </drug>
</drugs>
```
As you will see that is already quite hard to read and this covers a tiny amount of information compared to a SACT protocol.   We can apply something know as a XML Stylesheet to an XML file to make the content much more readable. Take a look at how that would appear [here](example_drugs.xml)  

In addition, there are potential opportunities for the same information to be recorded in different ways: Oral or Oral route? Should we dose digoxin in millilitres? Therefore any structured data sharing format needs a set of rules defining mandatory information, coding of data and data formats.  In XML this is known as a schema.  This project aims to define a schema for the protocol.  As an example we have created a [schema](example_drug) for the above XML describing drugs.
