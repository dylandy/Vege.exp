require 'csv'
class IndexController < ApplicationController
  def index
  end
  def show
    @id=params[:id]
    @vegetable = Vegetable.find(@id)
    today = Date.today
    @vegetable = VegetableLog.where(:vegetable_id => @id , :log_date => today ).order('log_date DESC').first
  end

  def week_csv
    @id = params[:id]
    today = Date.today
    before_day = today -7
    @target = Vegetable.find(@id)
    name = "#{@target.name} - #{@target.r_name}"
    
    csv_body = CSV.generate(:col_sep => "\t") do |csv|
     csv << [ "date", "#{name}高價", "#{name}均價","#{name}低價" ]
     vegetable = VegetableLog.where(:vegetable_id => @id ).limit(7).where('log_date BETWEEN ? AND ?' , before_day , today)

     if vegetable.count == 1
      temp = []
      vegetable = vegetable.first
      temp << vegetable
      vegetable = Marshal.load( Marshal.dump(vegetable))
      vegetable.log_date = vegetable.log_date.next
      temp << vegetable
      vegetable = temp 
    elsif vegetable.count == 0
      raise ActionController::RoutingError.new('Not Found')
      #it is too difficult to get full of the week
    end
    vegetable.each do |vs|
     csv << [vs.log_date.strftime('%Y%m%d'), vs.price1, vs.price2, vs.price3]
     end
    end
    render :text => csv_body
  end
  
  def csv
      @id = params[:id]
      @target = Vegetable.find(@id)
      name = "#{@target.name} - #{@target.r_name}"
        csv_body = CSV.generate(:col_sep => "\t") do |csv|
             csv << ["date" ,
               "#{name}高價" , 
              "#{name}均價" , 
             "#{name}低價" ]
             vegetable = VegetableStat.where("vegetable_id = #{@id} AND kind = 0").order('log_date')
             if  vegetable.count == 1
                temp = []
                vegetable = vegetable.first
                temp << vegetable
                vegetable = Marshal.load( Marshal.dump(vegetable) )
                vegetable.log_date = vegetable.log_date.next
                temp << vegetable
                vegetable = temp
             end

          vegetable.each do |vs|
            csv << [vs.log_date.strftime('%Y%m%d'),
              vs.avg_price1 , #vs.min_price1 , vs.max_price1,
             vs.avg_price2 , #vs.min_price2 , vs.max_price2,
            vs.avg_price3 ]# vs.min_price3 , vs.max_price3]
    	  end
      end
        render :text => csv_body
  end

  def csv2
      @id = params[:id]
      @target = Vegetable.find(@id)
      name = "#{@target.name} - #{@target.r_name}"
        csv_body = CSV.generate(:col_sep => "\t") do |csv|
             csv << ["date" ,
               "#{name}高價" ,
              "#{name}均價" , 
             "#{name}低價" ]
             vegetable = VegetableStat.where("vegetable_id = #{@id} AND kind = 1").order('log_date')
             if  vegetable.count == 1
                temp = []
                vegetable = vegetable.first
                temp << vegetable
                vegetable = Marshal.load( Marshal.dump(vegetable) )
                vegetable.log_date = vegetable.log_date.next
                temp << vegetable
                vegetable = temp
             end

          vegetable.each do |vs|
            csv << [vs.log_date.strftime('%Y%m%d'),
              vs.avg_price1 , #vs.min_price1 , vs.max_price1,
             vs.avg_price2 , #vs.min_price2 , vs.max_price2,
            vs.avg_price3 ]# vs.min_price3 , vs.max_price3]
        end
      end
        render :text => csv_body
  end

  def item
    @vegetable = Vegetable.find(params[:id])
  end

  def search
    if params[:s]
      @vegetable = Vegetable.paginate(:page => params[:page] , :per_page => 15)
      sql = []
      sql_source = []

      params[:s].split(/ ,./).each do |keyword|
 #       next unless keyword.to_s.match(/\w+/)
        sql << 'name LIKE ? OR r_name LIKE ?' 
        sql_source << "%#{keyword}%"
        sql_source << "%#{keyword}%"
      end
      @vegetable = @vegetable.where(sql.join(' OR ') , *sql_source)
    else
      #no input
    end
  end
end
