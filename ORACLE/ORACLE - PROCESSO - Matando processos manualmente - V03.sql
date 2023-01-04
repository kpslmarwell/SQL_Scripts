-- Derrumanto a sess�o espec�fica do banco
-- alter system kill session '<sid>,<serial#>' immediate;

-- Derrumanto as sess�es de um usu�rio espec�fico do banco
select p.spid,
       s.sid,
       s.serial#,
       s.osuser,
       s.username,
       s.machine,
       s.module,
       s.program,
       s.process,
       'alter system kill session ''' || s.sid || ', ' || s.serial# || ''' immediate;' comando
  from v$session s, v$process p
 where p.addr = s.paddr
--   and s.machine = 'CORP55'
   and upper(s.osuser) = 'RECEIVABLESUBR';
 order by s.username,
          s.machine,
          s.module,
          s.program;

select s.sid,
       s.serial#,
       s.osuser,
       s.username,
       s.machine,
       s.logon_time,
       s.seconds_in_wait,
       s.last_call_et,
       'alter system kill session ''' || s.sid || ', ' || s.serial# || ''' immediate;' comando
  from v$session s
 where s.username is not null
--   and upper(s.osuser) = 'ONF00'
--   and upper(s.osuser) = 'ANA.PAULA'
   and upper(s.osuser) = 'RECEIVABLESUBR'
--   and upper(s.action) like 'TEST%'
 order by s.logon_time,
          s.sid,
          s.serial#;


select s.sid,
       s.serial#,
       s.username,
       s.machine,
       s.logon_time,
       s.seconds_in_wait,
       s.last_call_et,
       'alter system kill session ''' || s.sid || ', ' || s.serial# || ''' immediate;' session_kill,
       'alter system disconnect session ''' || s.sid || ', ' || s.serial# || ''' immediate;' session_disconnect
  from v$session s
 where s.username = 'RECEIVABLESUBR'
   and s.status = 'INACTIVE'
 order by 1, 2;


alter system kill session '8381,37884,@1' immediate;
server tb-dbmx8bdbadm01 - instance cdm1tb1