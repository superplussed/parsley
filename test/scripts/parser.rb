require './hand_history_parser'
$redis.flushall
#HandHistoryParser.new("cer_9max")
HandHistoryParser.new("pst_bulk_hands")
#HandHistoryParser.new("pst_10k")
p Time.new