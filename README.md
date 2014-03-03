# FHIRbase

Relational storage for [FHIR](http://hl7.org/implement/standards/fhir/) with document API


### Why Relational
... we need describe problems and examples

### Why Document API
... we need describe problems and examples


## Synopsis

Open source Relational medical storage
based on FHIR standard & postgresql
suitable for health IT applications.

## FHIR

FHIR® is a next generation standards framework created by HL7.
FHIR combines the best features of HL7 Version 2,
Version 3 and CDA® product lines while leveraging the latest
web standards and applying a tight focus on implementability.

FHIR solutions are built from a set of modular components called Resources
These resources can easily be assembled into working systems that solve real world clinical and administrative problems at a fraction of the price of existing alternatives.
FHIR is suitable for use in a wide variety of contexts mobile phone apps, cloud communications,
EHR-based data sharing, server communication in large institutional healthcare providers, and much more.

## Motivation & Features

The most straightforward implementation of FHIR resources storage is document databases (like MongoDB, CouchDB, RethinkDB etc).

* Fine-Granularity of data control - Rich Query & Data Abstraction capabilities - power of Relational Algebra
* Storage Efficiency - calculate rate for document storages
* Enhanced Data Consistency - applying most of FHIR contstraints on database level

## Scope

The only current limitation is scalability,
postgresql. Possible solution - good sharding algorithm.

## Architecture

We parse machine-readable resource definitions and load it in relational form into meta schema.
For each resource we generate set of tables to save it's data in relations.
We use postgresql [inheritance](http://www.postgresql.org/docs/9.3/static/tutorial-inheritance.html)
for infrastructure management, that all data tables are inherited from two base tables

* resource
  * id
  * _type
  * _unknown_attributes
  * resource_type
  * language
  * container_id
  * contained_id
  * created_at
* resource_component
  * id
  * _type
  * _unknown_attributes
  * parent_id
  * resource_id
  * container_id
  * created_at

## API

* insert, update & delete procedures
* aggregated resources views
* querying

## Performance Notes

...

## Demo

You can try upload resources and query storage using simple demo site ...
http://try-fhirbase.hospital-systems.com


## Installation

* requirements:
  * postgresql 9.3
  * postgresql-contrib
  * plpython
* create databae
* execute fhirbase.sql script

## Contribution

* Star us on github
* Create issue - for bug report or enhancment
* Contribute to FHIRbase (see dev/README.md to prepare development environment)

## Plans

* Extensions
* FHIR server implementation
* FHIR version migrations
