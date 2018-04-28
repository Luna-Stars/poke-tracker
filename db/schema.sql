CREATE TABLE accounts (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(25) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  pass_hash TEXT NOT NULL,
  reset_key TEXT,
  key_created DATETIME
);

CREATE TABLE active_logging (
  account_id INT NOT NULL,
  pokemon INT NOT NULL,
  UNIQUE KEY(account_id, pokemon)
) PARTITION BY KEY(account_id) PARTITIONS 5;

CREATE TABLE encounter_log (
  account_id INT NOT NULL,
  pokemon INT NOT NULL,
  shiny BOOLEAN NOT NULL,
  encounter_time DATETIME NOT NULL
  UNIQUE KEY(account_id, encounter_time)
) PARTITION BY KEY(account_id) PARTITIONS 5;
