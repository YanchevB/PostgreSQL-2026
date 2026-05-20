ALTER TABLE minions_info
ADD CONSTRAINT unique_containt
	UNIQUE (id, email);
	
ALTER TABLE minions_info
ADD CONSTRAINT banana_check
	CHECK (banana > 0);