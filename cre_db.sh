!#/bin/ksh

set -v

sqlite3 myfirst.dat <<EOF

.changes on
.echo on

create table abc ( id interger, payload text );

insert into abc values ( 1, 'first' );
insert into abc values ( 2, 'second' );
insert into abc values ( 3, 'third' );

-- no commit needed, seems implicit
-- commit;

EOF

echo demo created with 1 table and 3 records
