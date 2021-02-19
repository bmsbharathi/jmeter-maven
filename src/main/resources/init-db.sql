CREATE TABLE todo
(
    id int NOT NULL DEFAULT nextval('todo_id_seq') primary key,
    data varchar(255),
    created_on timestamp with time zone
)

INSERT INTO public.todo ("data",created_on) VALUES
	 ('First Todo',NULL),
	 ('Add JMX script',NULL),
	 ('Add Result tree',NULL),
	 ('Start Jenkins server',NULL),
	 ('Install Performance plugin',NULL),
	 ('Create a new pipeline',NULL),
	 ('add verify stage in pipeline',NULL),
	 ('add script execution stage in pipeline',NULL),
	 ('add artefact archiving stage',NULL),
	 ('publish results',NULL);
INSERT INTO public.todo ("data",created_on) VALUES
	 ('add assertions in JMX',NULL),
	 ('collect metrics',NULL),
	 ('improve the pipeline',NULL);
commit;