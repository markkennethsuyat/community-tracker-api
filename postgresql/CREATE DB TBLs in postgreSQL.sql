-- public.community definition

-- Drop table

-- DROP TABLE public.community;

CREATE TABLE public.community (
	communityid int4 NOT NULL,
	communityname varchar(50) NOT NULL,
	communitymgrpeopleid int4 NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT community_pkey PRIMARY KEY (communityid),
	CONSTRAINT communitymgr_fkey FOREIGN KEY (communitymgrpeopleid) REFERENCES public.people(peopleid)
);


-- public.joblevel definition

-- Drop table

-- DROP TABLE public.joblevel;

CREATE TABLE public.joblevel (
	joblevelid int4 NOT NULL,
	joblevelname varchar(40) NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT joblevel_pkey PRIMARY KEY (joblevelid)
);


-- public.peopleotherdetails definition

-- Drop table

-- DROP TABLE public.peopleotherdetails;

CREATE TABLE public.peopleotherdetails (
	"peopleotherdetailsID" int4 NOT NULL,
	peopleotherdetailsdesc varchar(150) NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT peopleotherdetailsdef_pkey PRIMARY KEY ("peopleotherdetailsID")
);


-- public.peopleotherdetailsdesc definition

-- Drop table

-- DROP TABLE public.peopleotherdetailsdesc;

CREATE TABLE public.peopleotherdetailsdesc (
	peopleotherdetailsdescid int4 NOT NULL,
	peopleotherdetailsdesc varchar(100) NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT peopleotherdetailsdesc_pkey PRIMARY KEY (peopleotherdetailsdescid)
);


-- public.skillset definition

-- Drop table

-- DROP TABLE public.skillset;

CREATE TABLE public.skillset (
	skillsetid int4 NOT NULL,
	skillname varchar(100) NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT skillset_pkey PRIMARY KEY (skillsetid)
);

CREATE TABLE public.technologyinterest(
	technologyinterestID int4 NOT NULL,
	technologyinterestskillname varchar(100) NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT skillset_pkey PRIMARY KEY (technologyinterestID)
);



-- public.workstate definition

-- Drop table

-- DROP TABLE public.workstate;

CREATE TABLE public.workstate (
	workstateid int4 NOT NULL,
	workstatedescription varchar(100) NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT workstate_pkey PRIMARY KEY (workstateid)
);


-- public.people definition

-- Drop table

-- DROP TABLE public.people;

CREATE TABLE public.people (
	peopleid int4 NOT NULL,
	cognizantid int4 NOT NULL,
	lastname varchar(50) NOT NULL,
	firstname varchar(40) NOT NULL,
	middlename varchar(40) NOT NULL,
	fullname (130) NOT NULL, 
	csvemail VARCHAR(50) not null
	hireddate date NOT NULL,
	joblevelid int4 NULL,
	workstateid int4 NULL,
	isactive bool NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT people_pkey PRIMARY KEY (peopleid),
	CONSTRAINT people_joblevelid_fkey FOREIGN KEY (joblevelid) REFERENCES public.joblevel(joblevelid),
	CONSTRAINT people_workstateid_fkey FOREIGN KEY (workstateid) REFERENCES public.workstate(workstateid)
);


-- public.peoplecommunity definition

-- Drop table

-- DROP TABLE public.peoplecommunity;

CREATE TABLE public.peoplecommunity (
	peoplecommunityid int4 NOT NULL,
	peopleid int4 NULL,
	communityid int4 NULL,
	isactive bool NOT NULL,
	CONSTRAINT peoplecommunity_pkey PRIMARY KEY (peoplecommunityid),
	CONSTRAINT peoplecommunity_communityid_fkey FOREIGN KEY (communityid) REFERENCES public.community(communityid),
	CONSTRAINT peoplecommunity_peopleid_fkey FOREIGN KEY (peopleid) REFERENCES public.people(peopleid)
);


-- public.peopleskillset definition

-- Drop table

-- DROP TABLE public.peopleskillset;

CREATE TABLE public.peopleskillset (
	peopleskillsetid int4 NOT NULL,
	popleid int4 NULL,
	skillsetid int4 NULL,
	isactive bool NOT NULL,
	CONSTRAINT peopleskillset_pkey PRIMARY KEY (peopleskillsetid),
	CONSTRAINT peopleskillset_popleid_fkey FOREIGN KEY (popleid) REFERENCES public.people(peopleid),
	CONSTRAINT peopleskillset_skillsetid_fkey FOREIGN KEY (skillsetid) REFERENCES public.skillset(skillsetid)
);


-- public.project definition

-- Drop table

-- DROP TABLE public.project;

CREATE TABLE public.project (
	projectid int4 NOT NULL,
	projectname varchar(150) NOT NULL,
	projectleadid int4 NULL,
	contractstartdate date NOT NULL,
	contractenddate date NOT NULL,
	isactive bool NOT NULL,
	CONSTRAINT project_pkey PRIMARY KEY (projectid),
	CONSTRAINT project_projectleadid_fkey FOREIGN KEY (projectleadid) REFERENCES public.people(peopleid)
);


-- public.peopleproject definition

-- Drop table

-- DROP TABLE public.peopleproject;

CREATE TABLE public.peopleproject (
	peopleprojectid int4 NOT NULL,
	popleid int4 NULL,
	projectid int4 NULL,
	isactive bool NOT NULL,
	CONSTRAINT peopleproject_pkey PRIMARY KEY (peopleprojectid),
	CONSTRAINT peopleproject_popleid_fkey FOREIGN KEY (popleid) REFERENCES public.people(peopleid),
	CONSTRAINT peopleproject_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.project(projectid)
);