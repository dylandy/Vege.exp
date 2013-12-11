class VegetableStat < ActiveRecord::Base
  belongs_to :vegetable
  KIND = [ ['月' , 0],['年' , 1]]

  def self.build_me!
	  ActiveRecord::Base.connection.execute('
INSERT INTO vegetable_stats (
  vegetable_id ,
  avg_price1 , avg_price2 , avg_price3 , max_price1 , max_price2 , max_price3 , min_price1 , min_price2 , min_price3 ,
	log_date , kind
	) 

SELECT
vegetable_id ,
AVG(price1) AS avg_price1 , AVG(price2) AS avg_price2 , AVG(price3) AS avg_price3 , 
MAX(price1) AS max_price1 , MAX(price2) AS max_price2 , MAX(price3) AS max_price3 , 
MIN(price1) AS min_price1 , MIN(price2) AS min_price2 , MIN(price3) AS min_price3 ,
DATE_FORMAT(log_date , "%Y-%m-01") AS log_date ,
0 AS kind
FROM vegetable_logs AS vl GROUP BY vegetable_id , DATE_FORMAT(log_date , "%Y-%m-01")

 ON DUPLICATE KEY UPDATE 
avg_price1 = VALUES(avg_price1) , avg_price2 = VALUES(avg_price2) , avg_price3 = VALUES(avg_price3) , max_price1 = VALUES(max_price1) , max_price2= VALUES(max_price2) , max_price3 = VALUES(max_price3) , min_price1 = VALUES(min_price1) , min_price2 = VALUES(min_price2) , min_price3 = VALUES(min_price3) 
		')
    ActiveRecord::Base.connection.execute('
INSERT INTO vegetable_stats (
  vegetable_id ,
  avg_price1 , avg_price2 , avg_price3 , max_price1 , max_price2 , max_price3 , min_price1 , min_price2 , min_price3 ,
  log_date , kind
  ) 

SELECT
vegetable_id ,
AVG(price1) AS avg_price1 , AVG(price2) AS avg_price2 , AVG(price3) AS avg_price3 , 
MAX(price1) AS max_price1 , MAX(price2) AS max_price2 , MAX(price3) AS max_price3 , 
MIN(price1) AS min_price1 , MIN(price2) AS min_price2 , MIN(price3) AS min_price3 ,
DATE_FORMAT(log_date , "%Y-01-01") AS log_date ,
1 AS kind
FROM vegetable_logs AS vl GROUP BY vegetable_id , DATE_FORMAT(log_date , "%Y-01-01")

 ON DUPLICATE KEY UPDATE 
avg_price1 = VALUES(avg_price1) , avg_price2 = VALUES(avg_price2) , avg_price3 = VALUES(avg_price3) , max_price1 = VALUES(max_price1) , max_price2= VALUES(max_price2) , max_price3 = VALUES(max_price3) , min_price1 = VALUES(min_price1) , min_price2 = VALUES(min_price2) , min_price3 = VALUES(min_price3) 
    ')
	end
end
