require_relative '../lib/get_townhall_email'


describe "get_townhall_email(townhall_url)" do
  it "should return an array with hashes of cities and the email of the mayor of this city" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/val-d-oise.html")).to be_kind_of Array
    expect(get_townhall_email("http://annuaire-des-mairies.com/val-d-oise.html")[0].class).to eq(Hash)
  end
end