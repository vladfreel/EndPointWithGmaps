class Ticket < ApplicationRecord
  has_one :excavator
  has_many :points
  accepts_nested_attributes_for :excavator

  def scan_point(point)
    point.scan(/\-*\d{2}[\.|\,]\d{6,16}/)
  end

  def set_points_lat(point)
    points = scan_point(point)
    lat = []
    points.each_with_index do |e,i|
      unless i%2 != 0
        lat.push(e)
      end
    end
    lat
  end

  def set_points_lng(point)
    points = scan_point(point)
    lng = []
    points.each_with_index do |e,i|
      unless i%2 == 0
        lng.push(e)
      end
    end
    lng
  end
end
