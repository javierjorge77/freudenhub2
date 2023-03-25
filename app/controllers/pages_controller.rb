class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @tools= Tool.all
    @AvgCuautla= general(@tools, "Cuautla")
    @AvgUK= general(@tools, "UK")
    @AvgSpain= general(@tools, "Spain")
    @AvgIndia= general(@tools, "India")

    @SegmentsCuautla= averages(@tools, "Cuautla")
    @SegmentsUK= averages(@tools, "UK")
    @SegmentsSpain= averages(@tools, "Spain")
    @SegmentsIndia= averages(@tools, "India")

  end


private

def general(array, word)

  location = findlocation(array,word)

  sum = 0
  location.each do |tool|
    sum += tool.available
  end

  if location.length > 0
    avg= (sum/location.length)*100
    return avg.round(2)
  end

end

def findlocation(array,word)
  array.select { |element| element.plant == word }
end

def averages(array, word)
  location = findlocation(array,word)
  array= []
  array.push(segment_query(location, "HV"))
  array.push(segment_query(location, "MV"))
  array.push(segment_query(location, "LV"))

  return array
end


def segment_query(location, string)
  sum = 0
  count = 0
  location.each do |tool|
    if tool.segment == string
      sum += tool.available
      count = count +1
    end
  end

  if count > 0
    avg= (sum/count)*100
    return avg.round(2)
  end
end

end
