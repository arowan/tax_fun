require 'spec_helper'

describe "Application home" do
  context 'GET Index' do
    before do
      get '/'
    end

    it "should allow accessing the home page" do
      expect(last_response).to be_ok
    end

    it 'should return json' do
      expect(last_response.headers['Content-type']).to eq('application/json')
    end

    it 'should display json with a message' do
      expect(JSON.parse(last_response.body)).to eq({"message" => "request a report /report?income=XXXXX"})
    end
  end

  context 'GET /report' do
    let(:tax_report) { {"income"=>34010, "tax_free_allowence"=>11500, "taxable_income"=>22510, "tax_rate"=>20, "tax_amount"=>4500, "income_after_tax"=>29510} }

    before do
      get '/report', {income: 34010}
    end

    it "should return ok" do
      expect(last_response).to be_ok
    end

    it 'should return json' do
      expect(last_response.headers['Content-type']).to eq('application/json')
    end

    it 'should display json with a report' do
      expect(JSON.parse(last_response.body)).to eq(tax_report)
    end
  end
end
