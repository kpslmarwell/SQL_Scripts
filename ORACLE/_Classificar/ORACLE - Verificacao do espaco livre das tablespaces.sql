
/**************************************************************/
/* VERIFICA A QUANTIDADE DE ESPA�O LIVRE DAS TABLESPACES      */
/*                                                            */
/* cRIADO POR: S�RGIO QUEIROZ                                 */
/* DATA:       25/03/2009                                     */
/**************************************************************/
/* INICIO */
SELECT TABLESPACE_NAME, TO_CHAR(SUM(BYTES)/1024/1024,'999G999G999G999G999','nls_numeric_characters='',.''')|| ' Mb'
  FROM DBA_FREE_SPACE 
 WHERE TABLESPACE_NAME IN (SELECT DISTINCT TABLESPACE_NAME FROM USER_TABLES
                           UNION
                           SELECT DISTINCT TABLESPACE_NAME FROM USER_INDEXES)
GROUP BY TABLESPACE_NAME
ORDER BY 2 DESC
/* FIM */
/**************************************************************/