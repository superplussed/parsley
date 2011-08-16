Feature: parser reads a PokerStars file

	In order to insert properly formatted data in collection
	As a parser of hand history files
	I want to parse and format the values correctly
  
	@slow
  	Scenario Outline: read a baseline file.  9max, NLHE
		Given a hand history file named "pst_9max"
		When it is parsed and formatted
		Then the <field> should be equal to <value>
		
		Examples:
					| field					| value					|
					| hand_id				| 60832472342		|
					| site_id				| PST					|
					| table_name			| Wurm V				|
					| table_type			| normal				|
					| max_bb				| 100					|
					| table_max				| 9						|
					| seated				| 9						|
					| small_blind			| 0.01					|
					| big_blind				| 0.02					|
					| currency				| USD					|
					| button				| s5						|
					| game_type				| HE					|
					| limit_type			| NL					|
					| time_played			| 2011-04-14 17:13:04 -0400			|
					| hero_hole_cards		| 9h 4d					|
					| cards_flop			| 5h 7h Ac				|
					| cards_turn			| As					|
					| cards_river			| Jh					|
					| action_preflop		| [["Asya Selina", "f"], ["illussion1", "f"], ["ajfa11", "f"], ["doggit49", "f"], ["nashe9", "f"], ["fightingnuns", "r", 0.06], ["Nr_Wolf", "f"], ["Proprietor_8", "r", 0.18], ["ku12", "f"], ["fightingnuns", "ca", 0.12]]|
					| action_flop			| [["Proprietor_8", "ch"], ["fightingnuns", "ch"]]					|
					| action_turn			| [["Proprietor_8", "b", 0.08], ["fightingnuns", "ca", 0.08]] |
					| action_river			| [["Proprietor_8", "b", 0.12], ["fightingnuns", "r", 0.52], ["Proprietor_8", "ca", 0.4]] |
					| rake					| 0.07					|
					| s1					| ["ajfa11", "2.50"] |
					| s2                    | ["doggit49", "0.48"] | 
					| s3                    | ["nashe9", "2.86"] | 
					| s4                    | ["fightingnuns", "1.60", "9h 4d"] |
					| s5					| ["Nr_Wolf", "2.93"] | 
					| s6					| ["Proprietor_8", "1.51", "Ks Ah", "1.51"] | 
					| s7					| ["ku12", "2"] | 
					| s8					| ["Asya Selina", "4.91"] | 
					| s9					| ["illussion1", "1.96"] | 
 
	@slow
	Scenario Outline: HU, observed
		Given a hand history file named "pst_limit"
		When it is parsed and formatted
		Then the <field> should be equal to <value>

		Examples:
			| field					| value					|
			| table_max				| 2						|
			| seated				| 2						|

	@slow
	Scenario Outline: 6max
		Given a hand history file named "pst_plo"
		When it is parsed and formatted
		Then the <field> should be equal to <value>

		Examples:
			| field					| value					|
			| table_max				| 6						|
			| seated				| 3						|

	@slow
	Scenario Outline: fixed limit
		Given a hand history file named "pst_limit"
		When it is parsed and formatted
		Then the <field> should be equal to <value>

		Examples:
			| field					| value					|
			| game_type				| HE					|
			| limit_type			| FL					|

	@slow
	Scenario Outline: pot Limit holdem, sits out
		Given a hand history file named "pst_plhe"
		When it is parsed and formatted
		Then the <field> should be equal to <value>

		Examples:
			| field					| value					|
			| game_type				| HE					|
			| limit_type			| PL					|

	@slow
	Scenario Outline: pot Limit omaha
		Given a hand history file named "pst_plo"
		When it is parsed and formatted
		Then the <field> should be equal to <value>

		Examples:
			| field					| value					|
			| game_type				| Omaha					|
			| limit_type			| PL					|
			| hero_hole_cards		| Ts Qs 5s 5h			|