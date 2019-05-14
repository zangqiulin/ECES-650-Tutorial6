Tutorial 6  
(See how to use MetaPhlAn2 and STAMP in the wiki page.)  


Login to Proteus.  

`	$ git clone https://github.com/zangqiulin/Tutorial6`  
`	$ cd Tutorial6`  
 
Change e-mail address in 'submitter.sh'.  

`	$ newgrp rosenclassGrp`  
`	$ qsub submitter.sh`  

This submitter file downloads metaphlan, metaphlan database, the data, runs metaphlan2 and gets the results.It will take a long time to run. Run 'qstat' to check status.  
You can download the result **metaphlan_merged_all_new.spf**and the metadata **hmp_metagenimics/hmp_map.txt** and import them into STAMP.
