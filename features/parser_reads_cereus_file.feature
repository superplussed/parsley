Feature: parser reads a Cereus file

	In order to insert properly formatted data in collection
	As a parser of hand history files
	I want to parse and format the values correctly
  
	@slow
  	Scenario Outline: read a baseile.  9max, NLHE
		Given a hand history file named "cer_9max"
		When it is parsed and formatted
		Then the <field> should be equal to <value>
		
		Examples:
			| field					| value					|
			| hand_id				| C446764591		|
			| site_id				| CER					|
			| table_name			| Lucille Ave			|
			| table_type			| normal				|
			| max_bb				| 100					|
			| table_max				| 9						|
			| seated				| 6						|
			| small_blind			| 0.01					|
			| big_blind				| 0.02					|
			| currency				| USD					|
			| button				| s4				|
			| game_type				| HE					|
			| limit_type			| NL					|
			| time_played			| 2011-04-13 16:32:54 -0400			|
			| hero_hole_cards		| Qd 7d					|
			| cards_flop			| 4c Qs 10d				|
			| cards_turn			| 8h					|
			| cards_river			| 3d					|
			| action_preflop		| [["MBUFF151", "r", 0.07], ["GOLFPRO_420", "ca", 0.07], ["LADYTRUCKER69", "f"], ["RAAV", "f"], ["DANGER91", "f"], ["JNAIS", "f"]] |
			| action_flop			| [["MBUFF151", "b", 0.08], ["GOLFPRO_420", "ca", 0.08]] |										
			| action_turn			| [["MBUFF151", "b", 0.16], ["GOLFPRO_420", "ca", 0.16]] |
			| action_river			| [["MBUFF151", "b", 0.32], ["GOLFPRO_420", "r", 0.64], ["MBUFF151", "ca", 0.32]] |
			| rake					| 0.09					|
			| s1					| ["MBUFF151", "2.28", "As Qh", nil, "1.84"]					|
			| s2					| ["GOLFPRO_420", "2.10", "Qd 7d"]					|
			| s3					| ["LADYTRUCKER69", "4.79"]					|
			| s4					| ["RAAV", "2"]					|
			| s5					| ["DANGER91", "0.96"]					|
			| s8					| ["JNAIS", "1.76"]						|

		@slow
		Scenario Outline: PLHE, post not in blinds
			Given a hand history file named "cer_9max_pl"
			When it is parsed and formatted
			Then the <field> should be equal to <value>
			
			Examples:
				| field				| value					|
				| game_type			| HE					|
				| limit_type		| PL					|
				| s8				| ["GOLFPRO_420", "2", nil, "0.07"]			|

		@slow
		Scenario Outline: 6max, PLO
			Given a hand history file named "cer_plo_6max"
			When it is parsed and formatted
			Then the <field> should be equal to <value>
			
			Examples:
				| field				| value					|
				| table_max			| 9						|
				| seated			| 3						|
				| game_type			| Omaha					|
				| limit_type		| PL					|
				| s3				| ["GOLFPRO_420", "25", nil, "0.35"]			|
		
		@slow
		Scenario Outline: fixed limit holdem
			Given a hand history file named "cer_limit"
			When it is parsed and formatted
			Then the <field> should be equal to <value>
		
			Examples:
				| field				| value					|
				| game_type			| HE					|
				| limit_type		| FL					|
				| s2				| ["GOLFPRO_420", "100", "7s 7d", nil, "39"]			|
		
		@slow
		Scenario Outline: HU
			Given a hand history file named "cer_winner_showdown"
			When it is parsed and formatted
			Then the <field> should be equal to <value>
		
			Examples:
				| field				| value					|
				| table_max			| 2						|
				| seated			| 2						|