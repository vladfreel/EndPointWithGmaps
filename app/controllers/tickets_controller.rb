class TicketsController < ApplicationController
  protect_from_forgery with: :null_session
  after_action :set_points, only: [:create]
  def create
    @ticket = Ticket.create(selection_nested_params(ticket_params))
    if @ticket.save!
      redirect_to @ticket
    end
  end

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
    @hash = Gmaps4rails.build_markers(@ticket.points) do |p, marker|
      marker.lat p.latitude
      marker.lng p.longitude
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:RequestNumber,
                                   :SequenceNumber,
                                   :RequestType,
                                   DateTimes: [ :ResponseDueDateTime ],
                                   ServiceArea: [ PrimaryServiceAreaCode: [ :SACode ],
                                                  AdditionalServiceAreaCodes: [ SACode: [] ] ],
                                   ExcavationInfo: [ DigsiteInfo: [ :WellKnownText ] ],
                                   Excavator: [ :CompanyName,
                                                :Address,
                                                :City,
                                                :State,
                                                :Zip,
                                                :Type,
                                                :CrewOnsite ])
  end

  def set_points
    lats = @ticket.set_points_lat(@ticket.DigsiteInfo)
    lngs = @ticket.set_points_lng(@ticket.DigsiteInfo)
    for i in 0..lats.count
      @ticket.points.create(latitude: lats[i], longitude: lngs[i])
    end
  end
  def selection_nested_params(params)
    params['ResponseDueDateTime'] = params['DateTimes']&.delete('ResponseDueDateTime')
    params['PrimaryServiceAreaCode'] = params.dig('ServiceArea', 'PrimaryServiceAreaCode')&.delete('SACode')
    params['AdditionalServiceAreaCodes'] = params.dig('ServiceArea', 'AdditionalServiceAreaCodes')&.delete('SACode')
    params['DigsiteInfo'] = params.dig('ExcavationInfo', 'DigsiteInfo')&.delete('WellKnownText')
    params['excavator_attributes'] = params['Excavator']
    params.delete('DateTimes')
    params.delete('ServiceArea')
    params.delete('ExcavationInfo')
    params.delete('Excavator')
    params
  end
end
