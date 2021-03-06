//MOSHIX4 JOB (MOSHIX),'REPORT 66',MSGCLASS=H,
// NOTIFY=MOSHIX,REGION=35M,CLASS=A
/*JOBPARM LINES=9999
//*
//STEP0010 EXEC PGM=ICETOOL
//SYMNAMES DD DISP=SHR,DSN=MOSHIX.WORK.SMF(SMFHDR)
//         DD DISP=SHR,DSN=MOSHIX.WORK.SMF(SMF65)
//         DD DISP=SHR,DSN=MOSHIX.WORK.SMF(SMF66)
//INPUT    DD DISP=SHR,DSN=MOSHIX.SMFDUMP2
//SAVEFILE DD DISP=(NEW,DELETE),DSN=&&SAVEFILE,
// UNIT=SYSDA,SPACE=(CYL,(50,10)),
// DSORG=PS,RECFM=VBS,BLKSIZE=0
//TOOLMSG  DD SYSOUT=*                    ICETOOL MESSAGES
//DFSMSG   DD SYSOUT=*                    DFSORT MESSAGES
//SYMNOUT  DD SYSOUT=*
//REPORT65 DD SYSOUT=*
//REPORT66 DD SYSOUT=*
//TOOLIN DD *
  SORT FROM(INPUT) USING(SRT1)
/*
//SRT1CNTL DD *
   OPTION SPANINC=RC4,VLSHRT
   SORT FIELDS=(SMFXDTE,A,SMFXTME,A)
   OUTFIL FNAMES=REPORT66,CONVERT,
   INCLUDE=(SMFXRTY,EQ,SMF065,OR,SMFXRTY,EQ,SMF066),
   OUTREC=(1:SMFXRTY,EDIT=(TT),
           5:SMFXDTE_DT1,EDIT=(TTTT/TT/TT),16:SMFXTME,TM1,
   EDIT=(TT:TT:TT),26:SMF65JNM,
   38:SMF65SUB,CHANGE=(6,C'IN',C'INSERT',
                         C'DE',C'DELETE',
                         C'UP',C'UPDATE'),
                     NOMATCH=(C'??????'),
   47:SMF65ENM,93:SMF65TYP,
    CHANGE=(37,C'A',C'NON-VSAM DATA SET                  ',
             C'B',C'GENERATION DATA GROUP BASE           ',
             C'C',C'CLUSTER                              ',
             C'D',C'DATA SET                             ',
             C'E',C'VSAM EXTENSION RECORD                ',
             C'F',C'FREE SPACE                           ',
             C'G',C'ALTERNATE INDEX                      ',
             C'H',C'ACTIVE GENERATION DATA SET (GDS)     ',
             C'I',C'INDEX                                ',
             C'J',C'GDG EXTENSION RECORD                 ',
             C'K',C'VSAM VOLUME RECORD (VVR)             ',
             C'L',C'LIBRARY CONTROL SYSTEM LIBRARY RECORD',
             C'M',C'MASTER CATALOG                       ',
             C'N',C'NON-VSAM HEADER RECORD               ',
             C'O',C'OBJECT ACCESS METHOD (OAM) NON-VSAM  ',
             C'P',C'PAGE SPACE                           ',
             C'Q',C'VVR HEADER                           ',
             C'R',C'PATH                                 ',
             C'T',C'TRUE NAME RECORD                     ',
             C'U',C'USER CATALOG                         ',
             C'V',C'VOLUME                               ',
             C'W',C'LIBRARY CONTROL SYSTEM VOLUME        ',
             C'X',C'ALIAS                                ',
             C'Y',C'UPGRADE                              ',
             C'Z',C'VVR HEADER PRIMARY                   ',
             X'00',C'NORMAL NON-VSAM RECORD              ',
             X'01',C'JES3 RECORD                         '),
            NOMATCH=(C'?????? UNKNOWN RECORD TYPE ??????')),
   HEADER2=(1:DATE,45:'MOSHIX YOUTUBE CHANNEL    ',90:TIME,/,
   39:'ICF CATALOG ACTVITY RPT',/,/,
   1:'RT',9:'DATE',18:'TIME',26:'JOBNAME',38:'ACTION',
   52:'DATA SET NAME',93:'TYPE OF DATA ENTITY')
/*
//

