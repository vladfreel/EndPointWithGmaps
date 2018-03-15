require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

    params = {
        "ContactCenter": "UPCA",
        "RequestNumber": "09252012-00001",
        "ReferenceRequestNumber": "",
        "VersionNumber": "0",
        "SequenceNumber": "2421",
        "RequestType": "Normal",
        "RequestAction": "Restake",
        "DateTimes": {
            "RequestTakenDateTime": "2011/07/02 23:09:38",
            "TransmissionDateTime": "",
            "LegalDateTime": "2011/07/08 07:00:00",
            "ResponseDueDateTime": "2011/07/13 23:59:59",
            "RestakeDate": "2011/07/21 00:00:00",
            "ExpirationDate": "2011/07/26 00:00:00",
            "LPMeetingAcceptDueDate": "",
            "OverheadBeginDate": "",
            "OverheadEndDate": ""
        },
        "ServiceArea": {
            "PrimaryServiceAreaCode": {
                "SACode": "ZZGL103"
            },
            "AdditionalServiceAreaCodes": {
                "SACode": ["ZZL01", "ZZL02", "ZZL03"]
            }
        },
        "Excavator": {
            "CompanyName": "John Doe CONSTRUCTION",
            "Address": "555 Some RD",
            "City": "SOME PARK",
            "State": "ZZ",
            "Zip": "55555",
            "Type": "Excavator",
            "Contact": {
                "Name": "Johnny Doe",
                "Phone": "1115552345",
                "Email": "example@example.com"
            },
            "FieldContact": {
                "Name": "Field Contact",
                "Phone": "1235557924",
                "Email": "example@example.com"
            },
            "CrewOnsite": "true"
        },
        "ExcavationInfo": {
            "TypeOfWork": "rpr man hole tops",
            "WorkDoneFor": "gpc",
            "ProjectDuration": "60 days",
            "ProjectStartDate": "2011/07/08 07:00:00",
            "Explosives": "No",
            "UndergroundOverhead": "Underground",
            "HorizontalBoring": "Road, Driveway, and Sidewalk",
            "Whitelined": "No",
            "LocateInstructions": "locate along the r/o/w on both sides of the rd - including the rd itself - from inter to inter ",
            "Remarks": "Previous Request Number:05161-120-011\n\n\t\t\tPrevious Request Number:06044-254-020\n\n\t\t\tPrevious Request Number:06171-300-030",
            "DigsiteInfo": {
                "LookupBy": "MANUAL",
                "LocationType": "Multiple Address",
                "Subdivision": "",
                "AddressInfo": {
                    "State": "ST",
                    "County": "COUNTY",
                    "Place": "PLACE",
                    "Zip": "",
                    "Address": {
                        "AddressNum": [
                            "Address 1",
                            "Address 2"
                        ]
                    },
                    "Street": {
                        "Prefix": "",
                        "Name": "Trinity",
                        "Type": "Ave",
                        "Suffix": "SW"
                    }
                },
                "NearStreet": {
                    "State": "XX",
                    "County": "SomeCounty",
                    "Place": "City",
                    "Prefix": "",
                    "Name": "",
                    "Type": "",
                    "Suffix": ""
                },
                "Intersection": {
                    "ItoI": [{
                                 "State": "XX",
                                 "County": "FULERTON",
                                 "Place": "NORCROSS",
                                 "Prefix": "",
                                 "Name": "London",
                                 "Type": "St",
                                 "Suffix": "SW"
                             },
                             {
                                 "State": "ZZ",
                                 "County": "COUNTY",
                                 "Place": "ATLANTA",
                                 "Prefix": "",
                                 "Name": "Jefferson",
                                 "Type": "Ave",
                                 "Suffix": "SW"
                             }
                    ]
                },
                "WellKnownText": "POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.08858407706913 32.02259853170128,-81.05322183341679 32.02434500961698,-81.05047525138554 32.042681017283066,-81.0319358226746 32.06537765335268,-81.01202310294804 32.078469305179404,-81.02850259513554 32.07963291684719,-81.07759774894413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))"
            }
        }
    }
    before {post :create,  params: { ticket:  params , format: :json }}

    it 'creates new Ticket object' do
      expect(assigns(:ticket)).to eq(Ticket.last)
    end
    it 'redirects to candidates list page' do
      expect(response).to redirect_to Ticket.last
    end
    context 'check all Ticket params' do
      it 'check RequestNumber exist' do
        expect(Ticket.last.RequestNumber).to eq('09252012-00001')
      end
      it 'check SequenceNumber exist' do
        expect(Ticket.last.SequenceNumber).to eq(2421)
      end
      it 'check RequestType exist' do
        expect(Ticket.last.RequestType).to eq('Normal')
      end
      it 'check ResponseDueDateTime exist' do
        expect(Ticket.last.ResponseDueDateTime).to eq('2011/07/13 23:59:59')
      end
      it 'check PrimaryServiceAreaCode exist' do
        expect(Ticket.last.PrimaryServiceAreaCode).to eq('ZZGL103')
      end
      it 'check AdditionalServiceAreaCodes exist' do
        expect(Ticket.last.AdditionalServiceAreaCodes).to eq('["ZZL01", "ZZL02", "ZZL03"]')
      end
      it 'check DigsiteInfo exist' do
        expect(Ticket.last.DigsiteInfo) == 'POLYGON((-81.13390268058475 32.07206917625161,-81.14660562247929 32.04064386441295,-81.0885840770691...94413 32.07090546831167,-81.12154306144413 32.08806865844325,-81.13390268058475 32.07206917625161))'
      end
    end
    context 'check all Excavator params' do
      it 'check CompanyName exist' do
        expect(Excavator.last.CompanyName).to eq('John Doe CONSTRUCTION')
      end
      it 'check Address exist' do
        expect(Excavator.last.Address).to eq('555 Some RD')
      end
      it 'check City exist' do
        expect(Excavator.last.City).to eq('SOME PARK')
      end
      it 'check State exist' do
        expect(Excavator.last.State).to eq('ZZ')
      end
      it 'check Zip exist' do
        expect(Excavator.last.Zip).to eq('55555')
      end
      it 'check Type exist' do
        expect(Excavator.last.Type).to eq('Excavator')
      end
      it 'check CrewOnSite exist' do
        expect(Excavator.last.CrewOnsite).to eq(true)
      end
    end
  end
