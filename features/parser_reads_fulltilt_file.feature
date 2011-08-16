Feature: parser reads a Full Tilt file

	In order to insert properly formatted data in collection
	As a parser of hand history files
	I want to parse and format the values correctly

	@slow
  	Scenario Outline: read a baseline file.  9max, NLHE
		Given a hand history file named "ftp_9max"
		When it is parsed and formatted
		Then the <field> should be equal to <value>
		
		Examples:
			| field					| value					|
			| hand_id				| 29581935867			|
			| site_id				| FTP					|
			| table_name			| Burn					|
			| table_type			| normal				|
			| max_bb				| 100					|
			| table_max				| 9						|
			| seated				| 9						|
			| small_blind			| 1					|
			| big_blind				| 2					|
			| currency				| USD					|
			| button				| s9				|
			| game_type				| HE					|
			| limit_type			| NL					|
			| time_played			| 2011-04-03 05:21:25 -0400	|
			| hero_hole_cards		| Qc Ad					|
			| cards_flop			| 5s 4c 5d				|
			| cards_turn			| 2c					|
			| cards_river			| Qh					|
			| action_preflop		| [["Zmii_rk", "f"], ["smartwolfone", "f"], ["turbotin", "f"], ["x-sebi-x", "f"], ["aklovelove123", "f"], ["fightingnuns", "r", 6.0], ["misterdanilo", "f"], ["MacTekNY", "ca", 5.0], ["Bigkawik", "ca", 4.0]] |
			| action_flop			| [["MacTekNY", "b", 10.0], ["Bigkawik", "f"], ["fightingnuns", "ca", 10.0]] |										
			| action_turn			| [["MacTekNY", "b", 16.0], ["fightingnuns", "ca", 16.0]] |
			| action_river			| [["MacTekNY", "b", 30.0], ["fightingnuns", "ca", 30.0]] |
			| rake					| 3					|		

		@slow
		Scenario Outline: HU, PLHE
			Given a hand history file named "ftp_plhe"
			When it is parsed and formatted
			Then the <field> should be equal to <value>

			Examples:
				| field					| value				|
				| table_max				| 2					|
				| seated				| 2					|
				| game_type				| HE				|
				| limit_type			| PL				|
				| s1					| ["Kr3pstukas", "56.40", nil, "1"]		|

		@slow
		Scenario Outline: 6max, PLO, post not in blinds
			Given a hand history file named "ftp_plo"
			When it is parsed and formatted
			Then the <field> should be equal to <value>
			
			Examples:
				| field					| value				|
				| table_max				| 6					|
				| seated				| 4					|
				| game_type				| Omaha				|
				| limit_type			| PL				|
				| s2					| ["fightingnuns", "25", nil, "1.48"]	|

		@quick
		Scenario Outline: HU, PLHE
			Given a hand history file named "ftp_limit"
			When it is parsed and formatted
			Then the <field> should be equal to <value>

			Examples:
				| field					| value				|
				| game_type				| HE				|
				| limit_type			| FL				|
				| s9					| ["Roast_Toast", "7.15", nil, "2.15"]	|

		@slow
		Scenario Outline: shallow
			Given a hand history file named "ftp_shallow"
			When it is parsed and formatted
			Then the <field> should be equal to <value>
			
			Examples:
				| field					| value				|
				| table_type			| shallow			|
				| max_bb	 			| 40				|
				| s5					| ["fightingnuns", "0.80", nil, "0.10"]		|