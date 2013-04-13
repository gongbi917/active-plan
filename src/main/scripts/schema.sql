DROP DATABASE IF EXISTS `notification`;

CREATE TABLE user (
  id int(11) NOT NULL,
  username varchar(45) DEFAULT NULL,
  password varchar(45) DEFAULT NULL,
  email varchar(45) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE plan_item (
  id int(11) NOT NULL,
  title varchar(200) DEFAULT NULL,
  content varchar(500) DEFAULT NULL,
  target_time datetime DEFAULT NULL,
  actual_time datetime DEFAULT NULL,
  scope tinytext,
  status tinytext,
  tag_id int(11) NOT NULL,
  notification_id int(11),
  PRIMARY KEY (id,tag_id,notification_id),
  UNIQUE KEY plan_item_id_unique (id),
  KEY fk_plan_item_tag1_idx (tag_id),
  KEY fk_plan_item_notification1_idx (notification_id),
  CONSTRAINT fk_plan_item_notification1 FOREIGN KEY (notification_id) REFERENCES notification (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_plan_item_tag1 FOREIGN KEY (tag_id) REFERENCES tag (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE milestone (
  id int(11) NOT NULL,
  content varchar(500) DEFAULT NULL,
  target_time datetime DEFAULT NULL,
  actual_time datetime DEFAULT NULL,
  status tinyint(4) DEFAULT NULL,
  remark varchar(200) DEFAULT NULL,
  plan_item_id int(11) NOT NULL,
  notification_id int(11) NOT NULL,
  PRIMARY KEY (id,plan_item_id,notification_id),
  KEY fk_milestone_plan_item_idx (plan_item_id),
  KEY fk_milestone_notification1_idx (notification_id),
  CONSTRAINT fk_milestone_notification1 FOREIGN KEY (notification_id) REFERENCES notification (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_milestone_plan_item FOREIGN KEY (plan_item_id) REFERENCES plan_item (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE notification (
  id int(11) NOT NULL,
  reminder_time datetime DEFAULT NULL,
  reminder_way tinytext,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE resource (
  id int(11) NOT NULL,
  plan_item_id int(11) NOT NULL,
  milestone_id int(11) NOT NULL,
  content_type varchar(45) DEFAULT NULL,
  content_path varchar(45) DEFAULT NULL,
  PRIMARY KEY (id,plan_item_id,milestone_id),
  KEY fk_resource_plan_item1_idx (plan_item_id),
  KEY fk_resource_milestone1_idx (milestone_id),
  CONSTRAINT fk_resource_milestone1 FOREIGN KEY (milestone_id) REFERENCES milestone (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_resource_plan_item1 FOREIGN KEY (plan_item_id) REFERENCES plan_item (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE tag (
  id int(11) NOT NULL,
  name varchar(45) DEFAULT NULL,
  scope tinyint(4) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY name_unique (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE user_has_plan_item (
  user_id int(11) NOT NULL,
  plan_item_id int(11) NOT NULL,
  plan_item_tag_id int(11) NOT NULL,
  role tinyint(4) DEFAULT NULL,
  PRIMARY KEY (user_id,plan_item_id,plan_item_tag_id),
  KEY fk_user_has_plan_item_plan_item1_idx (plan_item_id,plan_item_tag_id),
  KEY fk_user_has_plan_item_user1_idx (user_id),
  CONSTRAINT fk_user_has_plan_item_plan_item1 FOREIGN KEY (plan_item_id, plan_item_tag_id) REFERENCES plan_item (id, tag_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_user_has_plan_item_user1 FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


