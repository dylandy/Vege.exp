#Vege.exp 蔬果交易查詢系統

氣候多變，蔬果價格也多變，多麼希望能夠有一個容易使用的蔬果價格查詢系統
目前政府的蔬果價格查詢系統，界面不容易使用，且不支援各種不同的裝置的顯示
面對行動裝置的大量崛起，我們需要一個能夠支援各種不同裝置，且界面友善的系統
Vege.exp 嘗試著解決這樣的問題，也期待能夠達成。

##System Requirment

* Ruby-2.0

* MySQL >= 5.5

* Unix-like System

* NetWork

##Deploy Information

* 修改 project_rails/config/database.yml 

* 在 project_rails/config/initialize/ 加入 secret_token 

* 安裝所需的 gem ( mysql2, will_paginate, nokogiri )

* Bundle Install

* 建立資料庫

* rake db:create

* rake db:migrate

* 將資料庫填入資料，執行 project_cron/vege.rb

* 之後每天執行一次 vege.rb，推薦使用 crontab 讓系統自動排程

* 使用 rails server 在 127.0.0.1:3000 進行開發

##資料來源
台北市農產運銷股份有限公司（台北市果菜市場）


##測試

目前此專案在 Ubuntu 13.10 (amd64) 環境下測試成功。

