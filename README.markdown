# Parsley

This gem will take a poker hand history as listed below, and converts it into a series of key/value pairs.

# Before: 

    Stage #C446764591: Holdem No Limit $0.02  - 2011-04-13 16:32:54 (ET)  
    Table: Lucille Ave (Real Money) Seat #4 is the dealer  
    Seat 4 - RAAV ($2 in chips)  
    Seat 5 - DANGER91 ($0.96 in chips)  
    Seat 8 - JNAIS ($1.76 in chips)  
    Seat 1 - MBUFF151 ($2.28 in chips)  
    Seat 2 - GOLFPRO_420 ($2.10 in chips)  
    Seat 3 - LADYTRUCKER69 ($4.79 in chips)  
    DANGER91 - Posts small blind $0.01  
    JNAIS - Posts big blind $0.02  
    *** POCKET CARDS ***  
    Dealt to GOLFPRO_420 [Qd 7d]  
    MBUFF151 - Raises $0.07 to $0.07  
    GOLFPRO_420 - Calls $0.07  
    LADYTRUCKER69 - Folds  
    RAAV - Folds  
    DANGER91 - Folds  
    JNAIS - Folds  
    *** FLOP *** [4c Qs 10d]   
    MBUFF151 - Bets $0.08  
    GOLFPRO_420 - Calls $0.08  
    *** TURN *** [4c Qs 10d] [8h]  
    MBUFF151 - Bets $0.16  
    GOLFPRO_420 - Calls $0.16  
    *** RIVER *** [4c Qs 10d 8h] [3d]  
    MBUFF151 - Bets $0.32  
    GOLFPRO_420 - Raises $0.64 to $0.64  
    MBUFF151 - Calls $0.32  
    *** SHOW DOWN ***  
    GOLFPRO_420 - Shows [Qd 7d] (One pair, queens)   
    MBUFF151 - Shows [As Qh] (One pair, queens)   
    MBUFF151 Collects $1.84 from main pot  
    *** SUMMARY ***  
    Total Pot($1.93) | Rake ($0.09)  
    Board [4c Qs 10d 8h 3d]  
    Seat 1: MBUFF151 won Total ($1.84) HI:($1.84) with One pair, queens(ace kicker) [As Qh - B:Qs,P:Qh,P:As,B:10d,B:8h]  
    Seat 2: GOLFPRO_420 HI:lost with One pair, queens [Qd 7d - B:Qs,P:Qd,B:10d,B:8h,P:7d]  
    Seat 3: LADYTRUCKER69 Folded on the POCKET CARDS  
    Seat 4: RAAV (dealer) Folded on the POCKET CARDS  
    Seat 5: DANGER91 (small blind) Folded on the POCKET CARDS  
    Seat 8: JNAIS (big blind) Folded on the POCKET CARDS    

# After:
      
    hand_id, C446764591    
    site_id, CER         
    table_name, Lucille Ave     
    table_type, normal        
    max_bb, 100         
    table_max, 9           
    seated, 6           
    small_blind, 0.01          
    big_blind, 0.02          
    currency, USD         
    button, s4        
    game_type, HE          
    limit_type, NL          
    time_played, 2011-04-13 16:32:54 -0400     
    hero_hole_cards, Qd 7d         
    cards_flop, 4c Qs 10d       
    cards_turn, 8h          
    cards_river, 3d          
    action_preflop, ["MBUFF151", "r", 0.07], ["GOLFPRO_420", "ca", 0.07], ["LADYTRUCKER69", "f"], ["RAAV", "f"], ["DANGER9,",f"], ["JNAIS", "f"]]
    action_flop, ["MBUFF151", "b", 0.08], ["GOLFPRO_42,",ca", 0.08]]                    
    action_turn, ["MBUFF151", "b", 0.16], ["GOLFPRO_42,",ca", 0.16]]
    action_river,  ["MBUFF151", "b", 0.32], ["GOLFPRO_42,",r", 0.64], ["MBUFF151", "ca", 0.32]]
    rake, 0.09          
    s1, ["MBUFF151", "2.28", "As Qh", nil, "1.84]
    s2, ["GOLFPRO_420", "2.10", "Qd 7d"]          
    s3, ["LADYTRUCKER69", "4.79"]         
    s4, ["RAAV", "2"]         
    s5, ["DANGER91", "0.96"]          
    s8, ["JNAIS", "1.76"]           

---

Most of the testing is functional since so most of the logic is stateful, and unit tests would be duplicating the coverage provided in the functional tests.

JSON files for setting the rules of how to parse a site-specific hand history file are found in the *files/regex* folder.

If you are uploading hand histories to S3, a file should be added at *config/initializers/auth.rb* in the format:

    $s3_access_key_id = ID;
    $s3_secret_access_key = KEY;
    $s3_bucket = BUCKET;