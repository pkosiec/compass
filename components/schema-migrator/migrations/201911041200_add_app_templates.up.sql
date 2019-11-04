
CREATE TYPE app_templates_access_level AS ENUM (
    'GLOBAL'
);

CREATE TABLE app_templates (
    id uuid PRIMARY KEY CHECK (id <> '00000000-0000-0000-0000-000000000000'),
    name varchar(256) NOT NULL,
    description text,
    application_input JSONB NOT NULL,
    placeholders JSONB,
    access_level app_templates_access_level NOT NULL,
);

ALTER TABLE labels
    ADD COLUMN app_template_id uuid;
ALTER TABLE labels
    ALTER COLUMN tenant_id uuid;    
ALTER TABLE labels
    ADD CONSTRAINT app_template_id_fk FOREIGN KEY (app_template_id) REFERENCES app_templates (id);
ALTER TABLE labels
    DROP CONSTRAINT valid_refs;
ALTER TABLE labels
    ADD CONSTRAINT valid_refs CHECK (app_id IS NOT NULL OR runtime_id IS NOT NULL OR app_template_id IS NOT NULL);

CREATE UNIQUE INDEX ON labels (coalesce(tenant_id, '00000000-0000-0000-0000-000000000000'), key, coalesce(app_id, '00000000-0000-0000-0000-000000000000'), coalesce(runtime_id, '00000000-0000-0000-0000-000000000000'));