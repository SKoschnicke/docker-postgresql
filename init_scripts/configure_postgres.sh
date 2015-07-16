postgres_config_path=/var/lib/postgresql/data/postgresql.conf
function set_postgres_config {
    config_identifier=$1
    config_value=$2
    echo "setting $config_identifier to $config_value..."
    sed -ri "s/^#?($config_identifier\s*=\s*)\w+(\s+.*)$/\\1$config_value\\2/" "$postgres_config_path"
}
function add_postgres_config {
    config_identifier=$1
    config_value=$2
    echo "setting $config_identifier to $config_value..."
    echo "$config_identifier = $config_value" >> "$postgres_config_path"
}
set_postgres_config shared_buffers 8GB
add_postgres_config shared_preload_libraries "'pg_stat_statements'"
add_postgres_config pg_stat_statements.max 25000
add_postgres_config pg_stat_statements.track all
# pg_partman is shared lib since version 2.0. As long as we use the old version, it doesn't need to be loaded here
#add_postgres_config shared_preload_libraries "'pg_stat_statements,pg_partman_bgw'"
#add_postgres_config pg_partman_bgw.dbname "'put_database_name_here'"
