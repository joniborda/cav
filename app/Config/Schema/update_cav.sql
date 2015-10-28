-- Table: dias_vehiculos

-- DROP TABLE dias_vehiculos;

CREATE TABLE dias_vehiculos
(
  id serial NOT NULL,
  vehiculo_id integer,
  dia integer,
  CONSTRAINT dias_vehiculos_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dias_vehiculos
  OWNER TO postgres;
