conn system/java0420;
drop user team;
create user team identified by tiger;
grant connect, resource to team;
conn team/tiger;