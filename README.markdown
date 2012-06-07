# Parsley

This gem will take a poker hand history that looks like:  

    PokerStars Game #59890863015:  Hold'em No Limit ($3/$6 USD) -   2011/03/27 12:34:31 ET  
    Table 'Griseldis XI' 2-max Seat #2 is the button  
    Seat 1: fightingnuns ($351.50 in chips)  
    Seat 2: mascom ($247.50 in chips)  
    mascom: posts small blind $3  
    fightingnuns: posts big blind $6  
    *** HOLE CARDS ***  
    Dealt to fightingnuns [Qs 6s]  
    mascom: raises $6 to $12  
    fightingnuns: folds  
    Uncalled bet ($6) returned to mascom  
    mascom collected $12 from pot  
    *** SUMMARY ***  
    Total pot $12 | Rake $0  
    Seat 1: fightingnuns (big blind) folded before Flop  
    Seat 2: mascom (button) (small blind) collected ($12)  

And convert it into the key/value pairs that can then be used to create statistics.   

---

Most of the testing is functional since so most of the logic is stateful, and would be duplicating the coverage provided in the functional tests.

JSON files for setting the rules of how to parse a site-specific hand history file are found in the *files/regex* folder.

If you are uploading hand histories to S3, a file should be added at *config/initializers/auth.rb* in the format:

    $s3_access_key_id = ID;
    $s3_secret_access_key = KEY;
    $s3_bucket = BUCKET;