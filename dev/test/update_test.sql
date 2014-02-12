--db:myfhir
--{{{
\ir 'spec_helper.sql'
\ir ../install.sql

\set pt_json `cat $FHIRBASE_HOME/test/fixtures/patient.json`
\set two_json `cat $FHIRBASE_HOME/test/fixtures/patient_two.json`

BEGIN;
SELECT plan(3);

\timing
select fhir.insert_resource(:'pt_json'::json) as resource_id \gset

SELECT is(text::varchar, 'Roel'::varchar, 'insert patient')
       FROM fhir.patient_name;

select fhir.update_resource(:'resource_id', :'two_json'::json);

SELECT is(text::varchar, 'Gavrila'::varchar, 'insert patient')
       FROM fhir.patient_name;

---
select uuid_generate_v4() as uuid \gset
PREPARE my_thrower AS select fhir.update_resource(:'uuid', :'two_json'::json);
SELECT throws_ok(
		'my_thrower',
 'Resource with id ' || :'uuid'::varchar || ' not found'
);

SELECT * FROM finish();
ROLLBACK;
--}}}
