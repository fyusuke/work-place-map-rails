class Api::V1::PlacesController < ApplicationController

  # def distance(lat1, lng1, lat2, lng2)
  #   # ラジアン単位に変換
  #   x1 = lat1.to_f * Math::PI / 180
  #   y1 = lng1.to_f * Math::PI / 180
  #   x2 = lat2.to_f * Math::PI / 180
  #   y2 = lng2.to_f * Math::PI / 180
    
  #   # 地球の半径 (km)
  #   radius = 6378.137
    
  #   # 差の絶対値
  #   diff_y = (y1 - y2).abs
    
  #   calc1 = Math.cos(x2) * Math.sin(diff_y)
  #   calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)
    
  #   # 分子
  #   numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)
    
  #   # 分母
  #   denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)
    
  #   # 弧度
  #   degree = Math.atan2(numerator, denominator)

  #   # logger.debug(degree*radius*1000)
    
  #   # 大円距離 (m)
  #   degree * radius * 1000
  # end

  # def search
  #   center_lat = params[:latitude]
  #   center_lng = params[:longitude]
  #   lat_low = center_lat-0.003
  #   lat_high = center_lat+0.003
  #   lng_low = center_lng-0.005
  #   lng_high = center_lng+0.005
  #   places = Place.all.where(latitude: lat_low..lat_high) .where(longitude: lng_low..lng_high)
  #   # logger.debug(places)
    	
  #   places_final = places.select { |place|
  #     distance(center_lat, center_lng, place.latitude, place.longitude) < 300 # radius(m)
  #   }
  #   # logger.debug(places_final)

  #   render json: {places: places_final }, status: 200
  # end

  def get_reviews
    place = Place.find_by(gmap_place_id: params[:gmap_place_id])
    unless place.present?
      logger.debug(place.errors.full_messages)
      render status: 404
    end

    reviews = place.reviews.map{ |review|  
      { posterName: review.user.name,
         rating: review.rating,
         comment: review.comment,
         createdAt: review.created_at.strftime('%Y/%m/%d') }
     }
    logger.debug(reviews)
    if reviews.count != 0
      render json: {reviews: reviews}, status: 200
    else
      logger.debug("Error: #{reviews.errors.full_messages}")
      render status: 404
    end
  end

  private

end
