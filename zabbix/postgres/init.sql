-- a zabbix-server adatbazisahoz kell
CREATE USER zabbix WITH PASSWORD 'zabbix';
GRANT CONNECT ON DATABASE postgres TO zabbix;
GRANT SELECT ON pg_stat_database TO zabbix;
GRANT SELECT ON pg_stat_replication TO zabbix;
GRANT SELECT ON pg_stat_activity TO zabbix;
GRANT SELECT ON pg_locks TO zabbix;
GRANT SELECT ON pg_stat_user_tables TO zabbix;
GRANT SELECT ON pg_stat_all_indexes TO zabbix;
GRANT EXECUTE ON FUNCTION pg_catalog.pg_database_size(name) TO zabbix;

CREATE DATABASE zabbix OWNER zabbix;

-- valamiert az agent PostgreSQL pluginja zbx_monitor userrel akar csatlakozni localhostra, nem talaltam meg hogy hova van beegetve
CREATE USER zbx_monitor WITH PASSWORD 'zabbix_password';
GRANT CONNECT ON DATABASE postgres TO zbx_monitor;
GRANT SELECT ON pg_stat_database TO zbx_monitor;
GRANT pg_monitor TO zbx_monitor;

