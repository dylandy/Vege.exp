class Vegetable < ActiveRecord::Base
  default_scope { where(is_hidden: false) }
  has_many :vegetable_log
	KIND = [["蔬菜" , 0] , ["水果" , 1] , ["其他" , 2]]
	SEASON = [["春" , 0] , ["夏" , 1] , ["秋", 2] , ["冬", 3]]
	FORM = [["蕈類", 0] , ["葉菜類" , 1] , ["子實類" , 2] , ["根莖類" , 3 ]]


#產生選單的快取

  def self.rebuild_cache!
    dir_path = "public/vegetable_list"
    `rm -R #{dir_path}`
    `mkdir #{dir_path}`
    KIND.each_with_index do |kind , kind_index|
      source = nil
      is_form = false
      case(kind[1])
      when 0
        source = FORM
        is_form = true
      when 1
        source = SEASON
      else #none
        source = nil
      end
      if source
        source.each_with_index do |s , s_index|
          v = Vegetable.where("kind = ?" , kind_index)
          if(is_form)
            v = v.where('form = ?' , s_index)
          else
            v = v.where('season = ?' , s_index)
          end
          File.open("#{dir_path}/#{kind_index}_#{s_index}" , 'w') do |f|
            v.each do |temp_v|
              if temp_v.r_name != ""
                f.write("<li><a href='/index/#{temp_v.id}'>#{temp_v.name}(#{temp_v.r_name})</a></li>")
              else
                f.write("<li><a href='/index/#{temp_v.id}'>#{temp_v.name}</a></li>")
              end
            end
          end
        end
      else
        File.open("#{dir_path}/#{kind_index}" , 'w') do |f|
          Vegetable.where("kind = #{kind_index}").each do |temp_v|
            f.write("<li><a href='/index/#{temp_v.id}'>#{temp_v.r_name || temp_v.name}</a></li>")
          end
        end
      end
    end
  end
end
