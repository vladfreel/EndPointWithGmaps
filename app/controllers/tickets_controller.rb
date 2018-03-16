class TicketsController < ApplicationController
  protect_from_forgery with: :null_session
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

  def selection_nested_params(params)
    params['request_number'] = params.delete('RequestNumber')
    params['sequence_number'] = params.delete('SequenceNumber')
    params['request_type'] = params.delete('RequestType')
    params['response_due_date_time'] = params['DateTimes']&.delete('ResponseDueDateTime')
    params['primary_service_area_code'] = params.dig('ServiceArea', 'PrimaryServiceAreaCode')&.delete('SACode')
    params['additional_service_area_codes'] = params.dig('ServiceArea', 'AdditionalServiceAreaCodes')&.delete('SACode')
    params['dig_site_info'] = params.dig('ExcavationInfo', 'DigsiteInfo')&.delete('WellKnownText')
    params['excavator_attributes'] = {company_name: params['Excavator']&.delete('CompanyName'),
                                      address: params['Excavator']&.delete('Address'),
                                      city: params['Excavator']&.delete('City'),
                                      state: params['Excavator']&.delete('State'),
                                      zip: params['Excavator']&.delete('Zip'),
                                      type: params['Excavator']&.delete('Type'),
                                      crew_on_site: params['Excavator']&.delete('CrewOnsite')}
    params.delete('DateTimes')
    params.delete('ServiceArea')
    params.delete('ExcavationInfo')
    params.delete('Excavator')
    params
  end
end
